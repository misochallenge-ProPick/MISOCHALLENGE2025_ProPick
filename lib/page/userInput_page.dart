import 'package:flutter/material.dart';

class UserinputPage extends StatelessWidget {
  UserinputPage({super.key});

  final TextEditingController _ageEditingController = TextEditingController();

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
          title: Text(
            "필터",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.close))],
        ),
        body: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "연령",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 18),
              TextField(
                controller: _ageEditingController,
                decoration: InputDecoration(
                  hintText: "연령을 입력하세요",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
