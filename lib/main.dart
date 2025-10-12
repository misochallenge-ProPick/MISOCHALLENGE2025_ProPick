import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            SizedBox(
              height: 300,
              child: Stack(
                children: [
                  const Positioned(
                    top: 10,
                    left: 10,
                    child: Icon(Icons.menu, color: Colors.orange, size: 35),
                  ),

                  const Positioned(
                    bottom: 10,
                    right: 50,
                    child: Text(
                      "0",
                      style: TextStyle(fontSize: 60, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Row(children: [
                  SizedBox(width: 30,),
                    calcBtn(
                      btnColor: Colors.grey.shade700,
                      btnText: "AC",
                    ),
                    SizedBox(width: 7,),
                    calcBtn(
                      btnColor: Colors.grey.shade700,
                      btnText: "AD",
                    ),
                    SizedBox(width: 7,),
                    calcBtn(
                      btnColor: Colors.grey.shade700,
                      btnText: "%",
                    ),
                    SizedBox(width: 7,),
                    calcBtn(
                      btnColor: Colors.orange,
                      btnText: "/",
                    ),
                  ]
                ),
                Container(height: 8,),
                Row(children: [
                  SizedBox(width: 30,),
                    calcBtn(
                      btnColor: Colors.grey.shade900,
                      btnText: "7",
                    ),
                    SizedBox(width: 7,),
                    calcBtn(
                      btnColor: Colors.grey.shade900,
                      btnText: "8",
                    ),
                    SizedBox(width: 7,),
                    calcBtn(
                      btnColor: Colors.grey.shade900,
                      btnText: "9",
                    ),
                    SizedBox(width: 7,),
                    calcBtn(
                      btnColor: Colors.orange,
                      btnText: "X",
                    ),
                  ]
                ),
                Container(height: 8,),
                Row(children: [
                  SizedBox(width: 30,),
                    calcBtn(
                      btnColor: Colors.grey.shade900,
                      btnText: "4",
                    ),
                    SizedBox(width: 7,),
                    calcBtn(
                      btnColor: Colors.grey.shade900,
                      btnText: "5",
                    ),
                    SizedBox(width: 7,),
                    calcBtn(
                      btnColor: Colors.grey.shade900,
                      btnText: "6",
                    ),
                    SizedBox(width: 7,),
                    calcBtn(
                      btnColor: Colors.orange,
                      btnText: "ㅡ",
                    ),
                  ]
                ),
                Container(height: 8,),
                Row(children: [
                  SizedBox(width: 30,),
                    calcBtn(
                      btnColor: Colors.grey.shade900,
                      btnText: "1",
                    ),
                    SizedBox(width: 7,),
                    calcBtn(
                      btnColor: Colors.grey.shade900,
                      btnText: "2",
                    ),
                    SizedBox(width: 7,),
                    calcBtn(
                      btnColor: Colors.grey.shade900,
                      btnText: "3",
                    ),
                    SizedBox(width: 7,),
                    calcBtn(
                      btnColor: Colors.orange,
                      btnText: "+",
                    ),
                  ]
                ),
                Container(height: 8,),
                Row(children: [
                  SizedBox(width: 30,),
                    calcBtn(
                      btnColor: Colors.grey.shade900,
                      btnText: "C",
                    ),
                    SizedBox(width: 7,),
                    calcBtn(
                      btnColor: Colors.grey.shade900,
                      btnText: "0",
                    ),
                    SizedBox(width: 7,),
                    calcBtn(
                      btnColor: Colors.grey.shade900,
                      btnText: ".",
                    ),
                    SizedBox(width: 7,),
                    calcBtn(
                      btnColor: Colors.orange,
                      btnText: "=",
                    ),
                  ]
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class calcBtn extends StatelessWidget {
  final Color btnColor;
  final String btnText;

  const calcBtn({super.key, required this.btnColor, required this.btnText});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: btnColor,
        shape: BoxShape.circle,
      ),
      child: Center(child: Text(btnText, style: TextStyle(fontSize: 30, color: Colors.white))),
    );
  }
}
