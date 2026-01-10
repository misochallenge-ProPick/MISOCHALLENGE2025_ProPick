import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final textScaleFactor = MediaQuery.of(context).textScaleFactor.clamp(0.8, 1.2);
    final baseFontSize = screenWidth / 17; // 반응형 기준 폰트 크기

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Text(
              "로그인",
              style: TextStyle(fontSize: baseFontSize * 1.76),
            )
          ],
        ),
      ),
    );
  }
}
