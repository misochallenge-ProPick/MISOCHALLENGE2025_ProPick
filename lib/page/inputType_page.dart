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
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final textScaleFactor = MediaQuery.of(
      context,
    ).textScaleFactor.clamp(0.8, 1.2);
    final baseFontSize = screenWidth / 17; // 반응형 기준 폰트 크기

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        // App Bar
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: screenHeight * 0.1,
          backgroundColor: Colors.white,
          title: SizedBox(
            width: screenWidth * 0.5 > 300 ? 300 : screenWidth * 0.5,
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
            SizedBox(height: screenHeight * 0.022),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.05,
                    ),
                    child: Text(
                      "회원님은 어떤 유형을 선호하시나요?",
                      style: TextStyle(
                        fontSize: baseFontSize * 1.0,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.007),
                  Text(
                    "(중복가능)",
                    style: TextStyle(
                      fontSize: baseFontSize * 1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.043),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: Column(
                children: [
                  for (var row in typeList) ...[
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: screenHeight * 0.015,
                      ),
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        spacing: screenWidth * 0.02,
                        runSpacing: screenHeight * 0.015,
                        children: [
                          for (var text in row)
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
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),

            Spacer(), // 맨 아래로 밀어줌
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: screenHeight * 0.04),
                child: ConstrainedBox(
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
                        Provider.of<ItemProvider>(
                          context,
                          listen: false,
                        ).setTypeInfo(clickedtype);

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => InputAreaPage(),
                          ),
                        );
                      },
                      child: Text(
                        "다음",
                        style: TextStyle(
                          fontSize: baseFontSize * 1.15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final textScaleFactor = MediaQuery.of(
      context,
    ).textScaleFactor.clamp(0.8, 1.2);
    final baseFontSize = screenWidth / 17; // 반응형 기준 폰트 크기

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected
            ? Color.fromARGB(255, 34, 92, 168)
            : Colors.white,
        elevation: 0,
        side: BorderSide(width: 1, color: Color(0x99999999)),
        minimumSize: Size(
          screenWidth * 0.27 > 150
              ? 150
              : (screenWidth * 0.27 < 90 ? 90 : screenWidth * 0.27),
          screenHeight * 0.055 < 40 ? 40 : screenHeight * 0.055,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      onPressed: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4),
        child: Text(
          typeText,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontSize: baseFontSize * 0.6,
          ),
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
