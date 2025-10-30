import 'package:flutter/material.dart';
import 'package:propick/page/inputType_page.dart';

class InputAgePage extends StatelessWidget {
  const InputAgePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        // App Bar
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 80,
          backgroundColor: Colors.white,
          title: SizedBox(
            width: 200,
            child: LinearProgressIndicator(
              value: 0.3,
              backgroundColor: Colors.grey[300],
              color: Color.fromARGB(255, 34, 92, 168),
              minHeight: 5.0,
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_back_ios_new),
          ),
        ),

        body: Column(
          children: [
            SizedBox(height: 18),
            Center(
              child: Text(
                "회원님의 연령대를 알려주세요!",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(height: 40),
            AgeButton(ageText: "15~19세"),
            SizedBox(height: 20),
            AgeButton(ageText: "20~39세"),
            SizedBox(height: 20),
            AgeButton(ageText: "40~59세"),
            SizedBox(height: 20),
            AgeButton(ageText: "60세 이상"),
          ],
        ),

        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          child: TextButton(
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              backgroundColor: Color.fromARGB(255, 34, 92, 168),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const InputTypePage()),
              );
            },
            child: Text(
              "다음",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class AgeButton extends StatelessWidget {
  String ageText;
  AgeButton({super.key, required this.ageText});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        elevation: 0,
        side: BorderSide(width: 1),
        minimumSize: Size(350, 90),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      onPressed: () {},
      child: SizedBox(
        width: 330,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            ageText,
            style: TextStyle(color: Colors.black, fontSize: 17),
          ),
        ),
      ),
    );
  }
}
