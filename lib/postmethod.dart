import 'package:apitest/postmodal.dart';
import 'package:flutter/material.dart';

class PostMethod extends StatefulWidget {
  PostMethod({super.key});

  @override
  State<PostMethod> createState() => _PostMethodState();
}

class _PostMethodState extends State<PostMethod> {
  final controller1 = TextEditingController();

  final controller2 = TextEditingController();

  final controller3 = TextEditingController();

  final controller4 = TextEditingController();

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        title: const Text('post data'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formkey,
          child: Column(
            children: [
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty || value.runtimeType != int) {
                    return "insert value";
                  }
                },
                controller: controller1,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "insert value";
                  }
                },
                controller: controller2,
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "insert value";
                  }
                },
                controller: controller3,
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "insert value";
                  }
                },
                controller: controller4,
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
              ElevatedButton(
                  onPressed: () {
                    // try {
                    if (formkey.currentState!.validate()) {
                      PostModal(
                              body: controller4.text,
                              id: int.parse(controller1.text),
                              title: controller3.text,
                              useriD: int.parse(controller2.text),
                              run: true)
                          .postData();
                    }

                    // } catch (e) {
                    // throw Exception(e);
                    // }

                    // print(fjkd.);
                    print(finalresponse);
                    if (finalresponse == 201) {
                      final mysnackbar = SnackBar(content: Text("success"));
                      ScaffoldMessenger.of(context).showSnackBar(mysnackbar);
                    }
                  },
                  child: const Text('Submit'))
            ],
          ),
        ),
      ),
    );
  }
}
