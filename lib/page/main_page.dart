import 'package:flutter/material.dart';
import 'package:propick/page/inputAge_page.dart';
import 'package:propick/util/BottmAppbar.dart';
import 'package:propick/util/TextBtn.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});

  String username = "장담모한다";
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 80,
          backgroundColor: Colors.white,
          elevation: 0,
          leadingWidth: 70,
          leading: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Image.asset(
              'assets/images/propick_logo_2x_black.png',
              scale: 1,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Center(
                child: Text(
                  "로그아웃",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 64),
              Text(
                "당신에게 맞는 이익을 택하다,",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Image.asset('assets/images/propick_logo_2x.png', scale: 2),
              SizedBox(height: 100),

              Center(
                child: Column(
                  children: [
                    RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: "$username님",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: ", 지금 조건을 입력하고 딱",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "맞는 혜택을 바로 확인해보세요!",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 48),
                    Image.asset(
                      'assets/images/propick_character.png',
                      scale: 2,
                    ),
                    SizedBox(height: 112),
                    Textbtn(text: "조건 입력하러 가기 →", pageRoute: InputAgePage()),
                  ],
                ),
              ),
            ],
          ),
        ),

        bottomNavigationBar: PropickBottomAppbar()
      ),
    );
  }
}
