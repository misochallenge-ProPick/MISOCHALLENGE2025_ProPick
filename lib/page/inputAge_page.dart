import 'package:flutter/material.dart';
import 'package:propick/page/inputType_page.dart';

class InputAgePage extends StatefulWidget {
  const InputAgePage({super.key});

  @override
  State<InputAgePage> createState() => _InputAgePageState();
}

final ageText = ["만 15~19세", "만 20~39세", "만 40~59세", "만 60세 이상"];
int selectedIndex = -1;

class _InputAgePageState extends State<InputAgePage> {
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
        ),

        body: Column(
          children: [
            SizedBox(height: 18),
            Center(
              child: Text(
                "회원님의 연령대를 알려주세요!",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 67),

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
              SizedBox(height: 20),
            ],
          ],
        ),

        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          child: TextButton(
            style: TextButton.styleFrom(
              minimumSize: Size(350, 64),
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
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected
            ? Color.fromARGB(255, 34, 92, 168)
            : Colors.white,
        elevation: 0,
        side: BorderSide(width: 1, color: Color(0x99999999)),
        minimumSize: Size(350, 64),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      onPressed: onTap,
      
      child: SizedBox(
        width: 330,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            ageText,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
