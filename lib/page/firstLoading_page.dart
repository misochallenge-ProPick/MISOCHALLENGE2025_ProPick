import 'package:flutter/material.dart';
import 'package:propick/repository/ev_repository.dart';
import 'dart:async';

class FirstLoadingPage extends StatefulWidget {
  const FirstLoadingPage({super.key});

  @override
  State<FirstLoadingPage> createState() => _FirstLoadingPageState();
}

class _FirstLoadingPageState extends State<FirstLoadingPage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => APIDataPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Image.asset('assets/images/propick_logo_2x.png', scale: 2),
        ),
      ),
    );
  }
}
