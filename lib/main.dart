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
                Row(
                  children: [
                    SizedBox(width: 30),
                    calcBtn(btnColor: Colors.grey.shade700, btnText: "AC",btnSize: 30,),
                    SizedBox(width: 7),
                    calcBtn(btnColor: Colors.grey.shade700, btnText: "AD",btnSize: 30,),
                    SizedBox(width: 7),
                    calcBtn(btnColor: Colors.grey.shade700, btnText: "%",btnSize: 40,),
                    SizedBox(width: 7),
                    calcBtn(btnColor: Colors.orange, btnText: "/",btnSize: 35,),
                  ],
                ),
                Container(height: 8),
                Row(
                  children: [
                    SizedBox(width: 30),
                    calcBtn(btnColor: Colors.grey.shade900, btnText: "7",btnSize: 40,),
                    SizedBox(width: 7),
                    calcBtn(btnColor: Colors.grey.shade900, btnText: "8",btnSize: 35,),
                    SizedBox(width: 7),
                    calcBtn(btnColor: Colors.grey.shade900, btnText: "9",btnSize: 35,),
                    SizedBox(width: 7),
                    calcBtn(btnColor: Colors.orange, btnText: "X",btnSize: 35,),
                  ],
                ),
                Container(height: 8),
                Row(
                  children: [
                    SizedBox(width: 30),
                    calcBtn(btnColor: Colors.grey.shade900, btnText: "4",btnSize: 35,),
                    SizedBox(width: 7),
                    calcBtn(btnColor: Colors.grey.shade900, btnText: "5",btnSize: 35,),
                    SizedBox(width: 7),
                    calcBtn(btnColor: Colors.grey.shade900, btnText: "6",btnSize: 35,),
                    SizedBox(width: 7),
                    calcBtn(btnColor: Colors.orange, btnText: "ㅡ",btnSize: 30,),
                  ],
                ),
                Container(height: 8),
                Row(
                  children: [
                    SizedBox(width: 30),
                    calcBtn(btnColor: Colors.grey.shade900, btnText: "1",btnSize: 35,),
                    SizedBox(width: 7),
                    calcBtn(btnColor: Colors.grey.shade900, btnText: "2",btnSize: 35,),
                    SizedBox(width: 7),
                    calcBtn(btnColor: Colors.grey.shade900, btnText: "3",btnSize: 35,),
                    SizedBox(width: 7),
                    calcBtn(btnColor: Colors.orange, btnText: "+",btnSize: 50,),
                  ],
                ),
                Container(height: 8),
                Row(
                  children: [
                    SizedBox(width: 30),
                    calcBtn(btnColor: Colors.grey.shade900, btnText: "C",btnSize: 35,),
                    SizedBox(width: 7),
                    calcBtn(btnColor: Colors.grey.shade900, btnText: "0",btnSize: 35,),
                    SizedBox(width: 7),
                    calcBtn(btnColor: Colors.grey.shade900, btnText: ".",btnSize: 30,),
                    SizedBox(width: 7),
                    calcBtn(btnColor: Colors.orange, btnText: "=",btnSize: 45,),
                  ],
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
  final double btnSize;

  const calcBtn({
    super.key,
    required this.btnColor,
    required this.btnText,
    required this.btnSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(color: btnColor, shape: BoxShape.circle),
      child: Center(
        child: Text(
          btnText,
          style: TextStyle(fontSize: btnSize, color: Colors.white),
        ),
      ),
    );
  }
}
