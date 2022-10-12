import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter/material.dart';
import 'package:worx/data/model/ResponseFormList.dart';

class ApiDataSource{
  final Dio _dio = Dio();

  final String _apiBaseUrl = "api.worx.dev.id";
  final String _apiPath = "/mobile";

  // endpoint
  final String _getTemplateFormsEndpoint = "/forms";
  final String _postSubmissionEndpoint = "/forms/submit";
  final String _getSubmissionEndpoint = "/forms/submissions";

  Future<ResponseFormList> fetchTemplateForms() async {
    try {
      final Uri uri = _buildUri(_getTemplateFormsEndpoint);
      final Response<Map<String, dynamic>> response = await _dio.get(
          uri.toString(),
          options: buildCacheOptions(7, forceRefresh: true));
      if (response.statusCode == 200) {
        return ResponseFormList.fromJson(response.data!);
      } else {
        return ResponseFormList.withErrorCode(ApplicationError.apiError);
      }
    } catch (exc, stacktrace) {
      Log.e("Exception occurred: $exc stack trace: ${stacktrace.toString()}");

      return ResponseFormList.withErrorCode(ApplicationError.connectionError);
    }
  }

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