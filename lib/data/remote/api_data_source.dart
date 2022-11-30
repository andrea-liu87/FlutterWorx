import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter/material.dart';
import 'package:worx/data/model/create_team_model.dart';

class ApiDataSource{
  final Dio _dio;

  final String _apiBaseUrl = "api.worx.dev.id";
  final String _apiPath = "/mobile";

  ApiDataSource(this._dio);

  // endpoint
  final String _createNewTeamEndPoint = "/users/create-new-team";
  final String _getTemplateFormsEndpoint = "/forms";
  final String _postSubmissionEndpoint = "/forms/submit";
  final String _getSubmissionEndpoint = "/forms/submissions";

  Future<Either<String, Response>> createNewTeam(CreateTeamModel form) async {
    try {
      final Uri uri = _buildUri(_createNewTeamEndPoint);
      setupInterceptors();
      final response = await _dio.post(uri.toString(), data: FormData.fromMap(form.toJson()));
      if (response.statusCode == 200){
        return Right(response);
      }
      return const Left('Error post create team');
    } on DioError catch (e) {
      if (e.response != null){
        return Left(e.response.toString());
      }
    } catch (e) {
      return Left(e.toString());
    }
    return Left('Some error has happen');
  }

  // Future<ResponseFormList> fetchTemplateForms() async {
  //   try {
  //     final Uri uri = _buildUri(_getTemplateFormsEndpoint);
  //     final Response<Map<String, dynamic>> response = await _dio.get(
  //         uri.toString(),
  //         options: buildCacheOptions(Duration(days: 7), forceRefresh: true));
  //     if (response.statusCode == 200) {
  //       return ResponseFormList.fromJson(response.data!);
  //     } else {
  //       return ResponseFormList.withErrorCode(response.statusCode);
  //     }
  //   } catch (exc, stacktrace) {
  //     log("Exception occurred: $exc stack trace: ${stacktrace.toString()}");
  //
  //     return ResponseFormList.withErrorCode(exc);
  //   }
  // }

  Uri _buildUri(String endpoint) {
    return Uri(
      scheme: "https",
      host: _apiBaseUrl,
      path: "$_apiPath$endpoint",
    );
  }

  void setupInterceptors() async {
    _dio.interceptors
        .add(DioCacheManager(CacheConfig(baseUrl: _apiBaseUrl)).interceptor);
    final deviceCode = await _getId();
    _dio.options.headers.addAll({"deviceCode": deviceCode});
  }

  Future<String?> _getId() async {
    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) { // import 'dart:io'
      var iosDeviceInfo = await deviceInfo.iosInfo;
      return iosDeviceInfo.identifierForVendor; // unique ID on iOS
    } else if(Platform.isAndroid) {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      return androidDeviceInfo.androidId; // unique ID on Android
    }
  }

  @visibleForTesting
  Dio get dio => _dio;
}