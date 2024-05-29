import 'dart:convert';

import 'package:apitest/allmethod.dart';
import 'package:apitest/interceptors.dart';
import 'package:apitest/modal.dart';
import 'package:apitest/postmethod.dart';
import 'package:apitest/putmethod.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> names = ["Rahul Shah", "Shyam shah", "hari shah"];
  final List<Todo> todos = [];
  // Future<void> getApi() async {
  //   final response =
  //       await http.get(Uri.parse("https://jsonplaceholder.typicode.com/todos"));
  //   var data = response.body;
  //   final decodedData = jsonDecode(data) as List;
  //   List<Todo> todos = decodedData.map((e) => Todo.fromJson(e)).toList();
  //   print(todos);
  // }

  final dio = Dio()..interceptors.add(CustomInterceptors());
  Future<List<Todo>> getAPI() async {
    try {
      final response =
          await dio.get("https://jsonplaceholder.typicode.com/todos");
      final List<dynamic> data = response.data;
      // print(data);
      if (response.statusCode == 200) {
        for (Map<String, dynamic> index in data) {
          todos.add(Todo.fromJson(index));
        }
        return todos;
      } else {
        return todos;
      }
    } catch (e) {
      throw e;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("API TESTING"),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // postData();
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => AllMethod(),
          ));
        },
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getAPI(),
              builder: (context, snapshot) => ListView.builder(
                shrinkWrap: true,
                itemCount: todos.length,
                itemBuilder: (context, index) => ListTile(
                  // tileColor: Colors.purple,
                  title: Text(todos[index].title),
                  subtitle: const Text("subtitle"),
                  leading: Text(' ${todos[index].id}'),
                  trailing: IconButton(
                      onPressed: () {
                        todos.removeAt(index);
                        setState(() {});
                      },
                      icon: const Icon(Icons.delete)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
