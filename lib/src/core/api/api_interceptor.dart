import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http/src/base_request.dart';
import 'package:http/src/base_response.dart';
import 'package:http_interceptor/models/interceptor_contract.dart';

class ApiInterceptor extends Interceptor {
  @override
  FutureOr<BaseRequest> interceptRequest(
      {required http.BaseRequest request}) async {
    if (kDebugMode) {
      log("[Interceptor]---------ON_REQUEST(${request.method})------------------"
          "\nURL: ${request.url}\n\n");
    }
    return request;
  }

  @override
  FutureOr<BaseResponse> interceptResponse(
      {required http.BaseResponse response}) {
    if (kDebugMode) {
      log("[Interceptor]---------ON_RESPONSE(${response.statusCode})------------------"
          "\nREASON PHRASE: ${response.reasonPhrase}\n\n");
    }
    return response;
  }
}
