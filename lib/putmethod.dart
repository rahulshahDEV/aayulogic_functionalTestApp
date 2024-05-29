import 'package:apitest/postmodal.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PutMethod extends StatelessWidget {
  PutMethod({super.key});

  Future<void> putData() async {
    try {
      var response = await http.put(
          Uri.parse('https://jsonplaceholder.typicode.com/posts/1'),
          body: {
            // "id": controller1.text,
            "title": controller3.text,
            "body": controller4.text,
            "userId": controller2.text
          });
      print(response.body);
    } catch (e) {
      print(e.toString());
    }
  }

  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
  final controller3 = TextEditingController();
  final controller4 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Put Method'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        child: Column(
          children: [
            TextField(
              controller: controller1,
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
            TextField(
              controller: controller2,
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
            TextField(
              controller: controller3,
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
            TextField(
              controller: controller4,
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  putData();
                },
                child: const Text("Submit"))
          ],
        ),
      ),
    );
  }
}
