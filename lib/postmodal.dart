import 'dart:ffi';
import 'dart:io';

import 'package:apitest/interceptors.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

var finalresponse;
final dio = Dio()..interceptors.add(CustomInterceptors());

class PostModal {
  final int id;
  final String title;
  final String body;
  final int useriD;
  final bool run;
  // final List myresponse = [];
  PostModal(
      {required this.body,
      required this.id,
      required this.title,
      required this.useriD,
      required this.run});
  // checkvalue();
  Future<void> postData() async {
    // if (run == true) {
    try {
      var response = await dio
          .post('https://jsonplaceholder.typicode.com/posts', data: {
        "id": id.toString(),
        "title": title,
        "body": body,
        "userId": useriD.toString()
      });
      var headers = response.headers;

      finalresponse = response.statusCode;
      print(response.data);
      print(finalresponse);
    } catch (e) {
      print(e.toString());
    }

    // }
  }
}
