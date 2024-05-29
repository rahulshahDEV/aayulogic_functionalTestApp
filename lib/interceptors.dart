import 'package:dio/dio.dart';

class CustomInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print('REQUEST[${options.method}] => PATH: ${options.path}');
    if (options.method == 'put') {
      options.data['id'] = 1;
      print(options.data);
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.statusCode != 200) {
      print('error');
    } else {
      print(
          'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
      print(response.statusCode);

      // if (response.requestOptions.method == 'GET') {
      //   for (var mydata in response.data) {
      //     mydata['title'] = "Rahul shah";
      //     print(mydata['title']);
      //   }
      // }
    }

    super.onResponse(response, handler);
  }

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    print(
        'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    super.onError(err, handler);
  }
}
