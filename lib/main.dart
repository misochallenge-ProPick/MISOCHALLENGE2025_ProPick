import 'package:flutter/material.dart';
import 'package:propick/page/List_page.dart';
import 'package:propick/page/firstLoading_page.dart';
import 'package:propick/page/inputAge_page.dart';
import 'package:propick/page/inputArea_page.dart';
import 'package:propick/page/inputType_page.dart';
import 'package:propick/page/main_page.dart';

void main() {
  runApp(const MyWidget());
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}