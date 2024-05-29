import 'package:apitest/deleteMethod.dart';
import 'package:apitest/postmethod.dart';
import 'package:apitest/putmethod.dart';
import 'package:flutter/material.dart';

class AllMethod extends StatelessWidget {
  const AllMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Method'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => PostMethod(),
                    ));
                  },
                  child: Text('post method')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => PutMethod(),
                    ));
                  },
                  child: Text('put method')),
              ElevatedButton(onPressed: () {}, child: Text('patch method')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DeleteMethod(),
                    ));
                  },
                  child: Text('delete method')),
            ],
          ),
        ),
      ),
    );
  }
}
