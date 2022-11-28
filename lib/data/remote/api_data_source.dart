import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter/material.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

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

  Future<String> createNewTeam(Map<String, String> form) async {
    try {
      final Uri uri = _buildUri(_createNewTeamEndPoint);
      final Response<String> response = await _dio.post(uri.toString(), queryParameters: form);
      return response.statusCode.toString();
    } catch (exc, stacktrace) {
      log("Exception occurred: $exc stack trace: ${stacktrace.toString()}");
      return stacktrace.toString();
    }
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

  void setupInterceptors() {
    _dio.interceptors
        .add(DioCacheManager(CacheConfig(baseUrl: _apiBaseUrl)).interceptor);
    _dio.options.headers['device-code'] = 'deviceCode';
    _dio.interceptors.add(PrettyDioLogger());
  }

  @visibleForTesting
  Dio get dio => _dio;
}