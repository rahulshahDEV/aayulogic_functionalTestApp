import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class Test {
  Future<void> getApi() async {
    try {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/'))
          .timeout(Duration.zero);
      final data = jsonDecode(response.body.toString());
      print(data);
    } on TimeoutException {
      print('timeout boss');
    }
  }

  void divException() {
    try {
      final a = 12;
      double c = a / 0;
    } on IntegerDivisionByZeroException {
      throw Exception('cannot divide zero');
    }
  }

  void formatException() {
    try {
      int a = int.parse('abc');
    } catch (e) {
      // print('format exception');
      var res = ExceptionHandler('A').exceptionHandler();
      print(res.toString());
    } finally {
      // print('finally executed');
    }
  }

  void ioException(var a) {
    try {
      var b = a / 2;
      print(a);
    } on IOException {
      print('send only integer data');
    } finally {
      print('success');
    }
  }
}

void main() {
  Test obj = new Test();
  // obj.getApi();
  // obj.divException();
  obj.formatException();
  // obj.ioException("dhf");
}

class ExceptionHandler {
  final String exception;

  ExceptionHandler(this.exception);

  Exception exceptionHandler() {
    switch (exception) {
      case 'A':
        // print('dfjh');
        return Exception('can not insert divide number by zero');
      case 'B':
        return Exception('can not insert divide number by zero');
      case 'c':
        return Exception('can not insert divide number by zero');
      default:
        return Exception('can not insert divide number by zero');
    }
  }
}
