import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DeleteMethod extends StatelessWidget {
  DeleteMethod({super.key});
  final dio = Dio();
  Future<void> deleteMethod() async {
    try {
      final response =
          await dio.delete('https://jsonplaceholder.typicode.com/posts/1');
      print(response.data);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Delete Method'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Container(
        child: ElevatedButton(
            onPressed: () {
              deleteMethod();
            },
            child: Text('delete')),
      ),
    );
  }
}
