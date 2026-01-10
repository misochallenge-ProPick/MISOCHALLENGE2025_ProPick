import 'package:flutter/material.dart';
import 'package:propick/page/inputType_page.dart';
import 'package:propick/util/TextBtn_save.dart';

class InputAgePage extends StatefulWidget {
  const InputAgePage({super.key});

  @override
  State<InputAgePage> createState() => _InputAgePageState();
}

final ageText = ["만 15~19세", "만 20~39세", "만 40~59세", "만 60세 이상"];
int selectedIndex = -1;

class _InputAgePageState extends State<InputAgePage> {
  @override
  void initState() {
    super.initState();
    selectedIndex = -1;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
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
            //   value: 0.3,
            //   backgroundColor: Colors.grey[300],
            //   color: Color.fromARGB(255, 34, 92, 168),
            //   minHeight: 5.0,
            //   borderRadius: BorderRadius.circular(10.0),
            // ),
            child: TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: 0.3),
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

        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
          child: Column(
            children: [
              SizedBox(height: screenHeight * 0.022),
              Center(
                child: Text(
                  "회원님의 연령대를 알려주세요!",
                  style: TextStyle(
                    fontSize: baseFontSize * 1.1,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: screenHeight * 0.083),

              for (int i = 0; i < ageText.length; i++) ...[
                AgeButton(
                  ageText: ageText[i],
                  isSelected: selectedIndex == i,
                  onTap: () {
                    setState(() {
                      selectedIndex = i;
                    });
                  },
                ),
                SizedBox(height: screenHeight * 0.025),
              ],
              Spacer(), // 맨 아래로 밀어줌
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: screenHeight * 0.04),
                  child: SaveBtn(
                    text: "다음",
                    info: (selectedIndex + 1).toString(),
                    pageRoute: InputTypePage(),
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

// ignore: must_be_immutable
class AgeButton extends StatelessWidget {
  String ageText;
  bool isSelected;
  VoidCallback onTap;

  AgeButton({
    super.key,
    required this.ageText,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final baseFontSize = screenWidth / 17; // 반응형 기준 폰트 크기

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected
            ? Color.fromARGB(255, 34, 92, 168)
            : Colors.white,
        elevation: 0,
        side: BorderSide(width: 1, color: Color(0x99999999)),
        minimumSize: Size(
          screenWidth * 0.9 > 500 ? 500 : screenWidth * 0.9,
          screenHeight * 0.08 > 64 ? screenHeight * 0.08 : 64,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
      ),
      onPressed: onTap,

      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
          child: Text(
            ageText,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontSize: baseFontSize * 1,
              fontWeight: FontWeight.w500,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
