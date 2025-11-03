import 'package:flutter/material.dart';
import 'package:propick/page/inputAge_page.dart';
import 'package:propick/page/inputArea_page.dart';
import 'package:propick/util/TextBtn.dart';

class InputTypePage extends StatefulWidget {
  const InputTypePage({super.key});

  @override
  State<InputTypePage> createState() => _InputTypePageState();
}

final typeList = [
  ["창업", "의료/의학", "IT"],
  ["다자녀", "공무원", "임산부"],
  ["창업", "창업", "창업"],
  ["창업", "창업", "창업"],
  ["창업", "창업", "창업"],
];
List<dynamic> clickedtype = [];

class _InputTypePageState extends State<InputTypePage> {
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
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 6),
                  Text(
                    "(중복가능)",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(height: 35),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  for (var row in typeList) ...[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (var text in row) ...[
                          TypeButton(
                            typeText: text,
                            isSelected: clickedtype.contains(text)
                                ? true
                                : false,
                            onTap: () {
                              setState(() {
                                if(clickedtype.contains(text)) clickedtype.remove(text);
                                else clickedtype.add(text);
                              });
                            },
                          ),
                          SizedBox(width: 12),
                        ],
                        SizedBox(height: 12),
                      ],
                    ),
                  ],
                ],
              ),
            ),

            Spacer(), // 맨 아래로 밀어줌
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 32),
                child: Textbtn(text: "다음", pageRoute: InputAreaPage()),
              ),
            ),
          ],
        ),

      ),
    );
  }
}

class TypeButton extends StatelessWidget {
  String typeText;
  bool isSelected;
  VoidCallback onTap;
  TypeButton({
    super.key,
    required this.typeText,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected
            ? Color.fromARGB(255, 34, 92, 168)
            : Colors.white,
        elevation: 0,
        side: BorderSide(width: 1, color: Color(0x99999999)),
        minimumSize: Size(108, 44),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      onPressed: onTap,
      child: Text(
        typeText,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
          fontSize: 12,
        ),
      ),
    );
  }
}
