import 'package:flutter/material.dart';
import 'package:propick/page/inputAge_page.dart';
import 'package:propick/util/BottmAppbar.dart';
import 'package:propick/util/TextBtn.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});

  String username = "이현준";

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
        appBar: AppBar(
          toolbarHeight: screenHeight * 0.1,
          backgroundColor: Colors.white,
          elevation: 0,
          leadingWidth: screenWidth * 0.18,
          leading: Padding(
            padding: EdgeInsets.only(left: screenWidth * 0.04),
            child: Image.asset(
              'assets/images/propick_logo_2x_black.png',
              scale: 1,
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: screenWidth * 0.04),
              child: Center(
                child: Text(
                  "로그아웃",
                  style: TextStyle(
                    fontSize: 14 * textScaleFactor,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.08),
              Text(
                "당신에게 맞는 이익을 택하다,",
                style: TextStyle(
                  fontSize: baseFontSize * 1.2,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: screenHeight * 0.012),
              Image.asset('assets/images/propick_logo_2x.png', scale: 2),
              SizedBox(height: screenHeight * 0.12),

              Center(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.02,
                      ),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: "$username님",
                              style: TextStyle(
                                fontSize: baseFontSize * 0.5,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            TextSpan(
                              text: ", 지금 조건을 입력하고 딱",
                              style: TextStyle(
                                fontSize: baseFontSize * 0.5,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.02,
                      ),
                      child: Text(
                        "맞는 혜택을 바로 확인해보세요!",
                        style: TextStyle(
                          fontSize: baseFontSize * 0.5,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    Image.asset(
                      'assets/images/propick_character.png',
                      scale: 2,
                    ),
                    SizedBox(height: screenHeight * 0.10),
                    Textbtn(text: "조건 입력하러 가기 →", pageRoute: InputAgePage()),
                  ],
                ),
              ),
            ],
          ),
        ),

        bottomNavigationBar: PropickBottomAppbar(),
      ),
    );
  }
}
