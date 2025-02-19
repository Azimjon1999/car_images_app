import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'api_constants.dart';
import 'api_interceptor.dart';

enum ApiResult { success, error }

enum RequestMethod { GET, POST, PUT, DELETE }

@immutable
sealed class DioService {
  static BaseOptions _baseOptions = BaseOptions();
  static Dio _dio = Dio();
  static Dio init() {
    _baseOptions = BaseOptions(
      contentType: ApiConstants.contentType,
      receiveTimeout: ApiConstants.duration,
      sendTimeout: ApiConstants.duration,
      connectTimeout: ApiConstants.duration,
      baseUrl: ApiConstants.url,
      validateStatus: ApiConstants.validate,
      headers: ApiConstants.headers,
    );
    _dio = Dio(_baseOptions);
    _dio.interceptors.add(ApiInterceptor() );
    return _dio;
  }

  static Future<String?> getData( String api,
      [Map<String, dynamic>? params]) async {
    try {
      Response response = await init().get(api, queryParameters: params);
      return jsonEncode(response.data);
    } on DioException catch (e) {
      log("DioException: Error at ${e.requestOptions.uri}. Because of ${e.type.name}");

      return null;
    }
  }

  static Future<String?> postData(
      BuildContext context, String api, Map<String, Object?> data,
      [Map<String, dynamic>? params]) async {
    try {
      Response response = await init().post(api, data: jsonEncode(data));
      return jsonEncode(response.data);
    } on DioException catch (e) {
      log("DioException: Error at ${e.requestOptions.uri}. Because of ${e.type.name}");
      return null;
    }
  }

  static Future<String?> updateData(
      BuildContext context, String api, String id, Map<String, Object?> data,
      [Map<String, dynamic>? params]) async {
    try {
      Response response = await init()
          .put("$api/$id", data: jsonEncode(data), queryParameters: params);
      return jsonEncode(response.data);
    } on DioException catch (e) {
      log("DioException: Error at ${e.requestOptions.uri}. Because of ${e.type.name}");
      return null;
    }
  }

  static Future<String?> deleteData(
      BuildContext context, String api, String id, Map<String, Object?> data,
      [Map<String, dynamic>? params]) async {
    try {
      Response response = await init().delete("$api/$id", data: data);
      return jsonEncode(response.data);
    } on DioException catch (e) {
      log("DioException: Error at ${e.requestOptions.uri}. Because of ${e.type.name}");
      return null;
    }
  }

  static Future<String?> request(
      BuildContext context, String api, RequestMethod method,
      [Map<String, dynamic>? param,
        Map<String, Object?> data = const {},
        String? id]) async {
    try {
      Response response = await init().request(id == null ? api : "$api/$id",
          data: jsonEncode(data),
          options: Options(
            method: method.name,
          ));
      return jsonEncode(response.data);
    } on DioException catch (e) {
      log("DioException: Error at ${e.requestOptions.uri}. Because of ${e.type.name}");
      return null;
    }
  }
}
