import 'package:dio/dio.dart';

class RequestHeaderInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    getCustomHeaders().then((customHeaders) {
      options.headers.addAll(customHeaders);
      super.onRequest(options, handler);
    });
  }

  Future<Map<String, String>> getCustomHeaders() async {
    final customHeaders = {
      'content-type': 'application/json',
      'Authorization':
          'Bearer c22c5ea81685e1b6459cb0d03c89c6ad73a1015ea0407401f4d61fa501c1b867'
    };

    return customHeaders;
  }
}
