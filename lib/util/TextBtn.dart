import 'package:flutter/material.dart';

class Textbtn extends StatelessWidget {
  Textbtn({super.key, required this.text, required this.pageRoute});

  String text;
  Widget pageRoute;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        minimumSize: Size(350, 64),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
          fontSize: 20,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
