import 'package:flutter/material.dart';

class FirstLoadingPage extends StatelessWidget {
  const FirstLoadingPage({super.key});

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
