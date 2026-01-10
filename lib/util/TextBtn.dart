import 'package:flutter/material.dart';

class Textbtn extends StatelessWidget {
  Textbtn({super.key, required this.text, required this.pageRoute});

  String text;
  Widget pageRoute;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final baseFontSize = screenWidth / 17; // 반응형 기준 폰트 크기

    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 500, minWidth: 0),
      child: SizedBox(
        width: screenWidth * 0.9 > 500 ? 500 : screenWidth * 0.9,
        child: TextButton(
          style: TextButton.styleFrom(
            minimumSize: Size(
              0,
              screenHeight * 0.08 > 64 ? screenHeight * 0.08 : 64,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            backgroundColor: Color.fromARGB(255, 34, 92, 168),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => pageRoute),
            );
          },
          child: Text(
            text,
            style: TextStyle(
              fontSize: baseFontSize * 1,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
