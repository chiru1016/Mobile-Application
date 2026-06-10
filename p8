import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool showMsg = true;

  void toggleMessage() {
    setState(() {
      showMsg = !showMsg;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Toggle App"),
        ),

        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                showMsg ? "RV College of Engineering!" : "Go Change the World!",
                style: TextStyle(fontSize: 24),
              ),

              ElevatedButton(
                onPressed: toggleMessage,
                child: Text("Toggle"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}