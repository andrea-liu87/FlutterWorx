import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:dio_logging_interceptor/dio_logging_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:worx/data/model/create_team_model.dart';
import 'package:worx/data/model/response_form_list.dart';

import '../../utility/common_function.dart';
import '../model/join_team_model.dart';

class ApiDataSource{
  final Dio _dio;

  final String _apiBaseUrl = "api.dev.worx.id";
  final String _apiPath = "/mobile";

  ApiDataSource(this._dio);

  // endpoint
  final String _getDeviceInfo = "/devices/get-info-device";
  final String _createNewTeamEndPoint = "/users/create-new-team";
  final String _joinTeam = "/devices/register";
  final String _getTemplateFormsEndpoint = "/forms";
  final String _postSubmissionEndpoint = "/forms/submit";
  final String _getSubmissionEndpoint = "/forms/submissions";

  Future<Either<String, Response>> getDeviceStatus() async {
    try {
      final Uri uri = _buildUri(_getDeviceInfo);
      setupInterceptors();

      final response = await _dio.get(uri.toString());
      if (response.statusCode == 200){
        return Right(response);
      }
      return const Left('Error get device status');
    } on DioError catch (e) {
      if (e.response != null) {
        Response response = e.response!;
        if (response.statusCode == 404 && response.data.toString().contains("ENTITY_NOT_FOUND_ERROR")) {
          return Right(response);
        }
        else {
          return Left('Http error ${e.response?.statusCode ??= 0}');
        }
      }
    } on Exception catch (e) {
      return Left(e.toString());
    }
    return const Left('Unknown type error has happen');
  }

  Future<Either<String, Response>> createNewTeam(CreateTeamModel form) async {
    try {
      final Uri uri = _buildUri(_createNewTeamEndPoint);
      setupInterceptors();
      final response = await _dio.post(uri.toString(), data: form.toJson());
      if (response.statusCode == 200){
        return Right(response);
      }
      return const Left('Error post create team');
    } on DioError catch (e) {
      if (e.response != null){
        return Left('Http error ${e.response?.statusCode ??= 0}');
      }
    } on Exception catch (e) {
      return Left(e.toString());
    }
    return const Left('Unknown type error has happen');
  }

  Future<Either<String, Response>> joinTeam(JoinTeamModel form) async {
    try {
      final Uri uri = _buildUri(_joinTeam);
      setupInterceptors();
      final response = await _dio.post(uri.toString(), data: form.toJson());
      if (response.statusCode == 200){
        return Right(response);
      }
      return const Left('Error post join team');
    } on DioError catch (e) {
      if (e.response != null){
        return Left('Http error ${e.response?.statusCode ??= 0}');
      }
    } on Exception catch (e) {
      return Left(e.toString());
    }
    return const Left('Unknown type error has happen');
  }

  Future<ResponseFormList> fetchTemplateForms() async {
    try {
      final Uri uri = _buildUri(_getTemplateFormsEndpoint);
      setupInterceptors();
      final Response<Map<String, dynamic>> response = await _dio.get(
          uri.toString(),
          options: _cacheOptions());
      if (response.statusCode == 200 ) {
        return ResponseFormList.fromJson(response.data!);
      } else {
        return ResponseFormList.withErrorCode(response.statusCode.toString());
      }
    } catch (exc, stacktrace) {
      log("Exception occurred: $exc stack trace: ${stacktrace.toString()}");

      return ResponseFormList.withErrorCode(exc.toString());
    }
  }

  Future<SubmissionFormResponse> fetchSubmissionForms() async {
    try {
      final Uri uri = _buildUri(_getSubmissionEndpoint);
      setupInterceptors();
      final Response<Map<String, dynamic>> response = await _dio.get(
          uri.toString(),
          options: _cacheOptions());
      if (response.statusCode == 200 ) {
        return SubmissionFormResponse.fromJson(response.data!);
      } else {
        return SubmissionFormResponse.withErrorCode(response.statusCode.toString());
      }
    } catch (exc, stacktrace) {
      log("Exception occurred: $exc stack trace: ${stacktrace.toString()}");

      return SubmissionFormResponse.withErrorCode(exc.toString());
    }
  }

  Options _cacheOptions() {
    return buildCacheOptions(
        Duration.zero,
        maxStale: const Duration(days:30),
        forceRefresh: true);
  }

  Uri _buildUri(String endpoint) {
    return Uri(
      scheme: "https",
      host: _apiBaseUrl,
      path: "$_apiPath$endpoint",
    );
  }

  void setupInterceptors() async {
    _dio.interceptors.add(DioCacheManager(CacheConfig()).interceptor);
    _dio.options.connectTimeout = 10000; //10s
    _dio.options.receiveTimeout = 50000;
    _dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) async {
      final deviceCode = await getId();
      _dio.lock();
      options.headers['deviceCode'] = deviceCode;
      handler.next(options);
      _dio.unlock();
    }));

    final loggingInterceptor = DioLoggingInterceptor(level: Level.body, compact: false,);
    _dio.interceptors.addAll([loggingInterceptor]);
  }

  @visibleForTesting
  Dio get dio => _dio;
}