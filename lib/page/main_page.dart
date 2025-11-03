import 'package:flutter/material.dart';
import 'package:propick/page/inputAge_page.dart';
import 'package:propick/util/TextBtn.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 60,
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
                            text: "장담모한다님",
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

        bottomNavigationBar: BottomAppBar(
          height: 90,
          color: Colors.white,
          elevation: 3,
          shadowColor: Colors.black,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.home_filled, size: 30),
                  ),
                  Transform.translate(
                    offset: Offset(0, -6),
                    child: Text(
                      "홈",
                      style: TextStyle(fontSize: 12, color: Colors.black),
                    ),
                  ),
                ],
              ),
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromARGB(255, 34, 92, 168),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Center(
                    child: Text(
                      "프로픽",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.grid_view_rounded, size: 30),
                  ),
                  Transform.translate(
                    offset: Offset(0, -6),
                    child: Text(
                      "전체메뉴",
                      style: TextStyle(fontSize: 12, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
