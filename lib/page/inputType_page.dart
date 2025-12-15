import 'package:flutter/material.dart';
import 'package:propick/page/inputArea_page.dart';
import 'package:provider/provider.dart';
import '/providers/item_provider.dart';

class InputTypePage extends StatefulWidget {
  const InputTypePage({super.key});

  @override
  State<InputTypePage> createState() => _InputTypePageState();
}

final typeList = [
  ["장애인", "저소득", "한부모"],
  ["다문화", "탈북민", "다자녀"],
  ["보훈대상자", "생활 지원", "일자리"],
  ["임신", "신체건강", "장애"],
  ["교육", "법률", "여가"],
];
List<String> clickedtype = [];

class _InputTypePageState extends State<InputTypePage> {
  @override
  void initState() {
    super.initState();
    clickedtype = [];
  }

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
            // child: LinearProgressIndicator(
            //   value: 0.7,
            //   backgroundColor: Colors.grey[300],
            //   color: Color.fromARGB(255, 34, 92, 168),
            //   minHeight: 5.0,
            //   borderRadius: BorderRadius.circular(10.0),
            // ),
            child: TweenAnimationBuilder(
              tween: Tween<double>(begin: 0.3, end: 0.6),
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              builder: (context, value, _) {
                return LinearProgressIndicator(
                  value: value,
                  backgroundColor: Colors.grey[300],
                  color: Color.fromARGB(255, 34, 92, 168),
                  minHeight: 5.0,
                  borderRadius: BorderRadius.circular(10.0),
                );
              },
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
                                if (clickedtype.contains(text))
                                  clickedtype.remove(text);
                                else
                                  clickedtype.add(text);
                              });
                            },
                          ),
                          SizedBox(width: 12),
                        ],
                        SizedBox(height: 50),
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
                child: TextButton(
                  style: TextButton.styleFrom(
                    minimumSize: Size(350, 64),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: Color.fromARGB(255, 34, 92, 168),
                  ),
                  onPressed: () {
                    Provider.of<ItemProvider>(
                      context,
                      listen: false,
                    ).setTypeInfo(clickedtype);

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => InputAreaPage()),
                    );
                  },
                  child: Text(
                    "다음",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
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
