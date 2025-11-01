import 'package:flutter/material.dart';
import 'package:propick/page/inputAge_page.dart';
import 'package:propick/page/inputArea_page.dart';

class InputTypePage extends StatelessWidget {
  const InputTypePage({super.key});

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
              value: 0.7,
              backgroundColor: Colors.grey[300],
              color: Color.fromARGB(255, 34, 92, 168),
              minHeight: 5.0,
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),

        body: Column(
          children: [
            SizedBox(height: 18),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "회원님은 어떤 유형을 선호하시나요?",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "(중복가능)",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            SizedBox(height: 35),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TypeButton(typeText: "창업"),
                      SizedBox(width: 10),
                      TypeButton(typeText: "의료/의학"),
                      SizedBox(width: 10),
                      TypeButton(typeText: "IT"),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TypeButton(typeText: "다자녀"),
                      SizedBox(width: 10),
                      TypeButton(typeText: "공무원"),
                      SizedBox(width: 10),
                      TypeButton(typeText: "군인가족"),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TypeButton(typeText: "창업"),
                      SizedBox(width: 10),
                      TypeButton(typeText: "창업"),
                      SizedBox(width: 10),
                      TypeButton(typeText: "창업"),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TypeButton(typeText: "창업"),
                      SizedBox(width: 10),
                      TypeButton(typeText: "창업"),
                      SizedBox(width: 10),
                      TypeButton(typeText: "창업"),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TypeButton(typeText: "창업"),
                      SizedBox(width: 10),
                      TypeButton(typeText: "창업"),
                      SizedBox(width: 10),
                      TypeButton(typeText: "창업"),
                    ],
                  ),
                ],
              ),
            ),
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
                MaterialPageRoute(builder: (context) => InputAreaPage()),
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

class TypeButton extends StatelessWidget {
  String typeText;
  TypeButton({super.key, required this.typeText});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        elevation: 0,
        side: BorderSide(width: 1),
        minimumSize: Size(108, 44),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      onPressed: () {},
      child: Text(
        typeText,
        style: TextStyle(color: Colors.black, fontSize: 12),
      ),
    );
  }
}
