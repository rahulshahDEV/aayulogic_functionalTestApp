import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FlutterSlider extends StatefulWidget {
  const FlutterSlider({super.key});

  @override
  State<FlutterSlider> createState() => _FlutterSliderState();
}

class _FlutterSliderState extends State<FlutterSlider> {
  double currentValue = 20;
  final textValue = TextEditingController();
  bool val = true;

  void getSearch() {
    print(textValue.text);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      CircularProgressIndicator();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        // crossAxisAlignment: ,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
              onPressed: () => showCupertinoDialog(
                    context: context,
                    builder: (context) {
                      return CupertinoAlertDialog(
                        title: Text("Dialog Title"),
                        content: Text("This is my content"),
                        actions: <Widget>[
                          CupertinoDialogAction(
                            isDefaultAction: true,
                            child: Text("Yes"),
                          ),
                          CupertinoDialogAction(
                            child: Text("No"),
                          )
                        ],
                      );
                    },
                  ),
              child: const Text('dialog box')),
          const CupertinoActivityIndicator(),
          Slider(
            // min: 0,
            value: currentValue,
            divisions: 10,
            max: 100,
            label: currentValue.round().toString(),
            onChanged: (double value) => setState(() {
              currentValue = value;
            }),
          ),
          CupertinoSearchTextField(
            placeholder: 'Search',
            controller: textValue,
            onSubmitted: (value) => print(textValue.text),
          ),
          CupertinoSwitch(
            value: val,
            onChanged: (value) => setState(() {
              // val = value;
              val = !val;
              print(value);
            }),
          ),
          CupertinoTabBar(items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'profile'),
            BottomNavigationBarItem(icon: Icon(Icons.menu)),
            BottomNavigationBarItem(icon: Icon(Icons.add))
          ]),
        ],
      ),
    );
  }
}
