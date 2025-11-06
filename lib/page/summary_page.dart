import 'package:flutter/material.dart';
import 'package:propick/util/TextBtn.dart';

class SummaryPage extends StatelessWidget {
  SummaryPage({super.key});
  
  String username = "장담모한다";

  String summaryTitle = "청년 월세 지원";
  List<String> firstText = [
    "✅ 제도 개요 : ",
    "💡 지원 내용 : ",
    "📌 선정 방법 : ",
    "📝 제출 서류 : ",
  ];
  List<String> summaryBody = [
    "청년의 주거비 부담을 완화하고 거주 안정을 지원하기 위한 제도예요.",
    "대체로 월 20만원이 상한선인 경우가 많아요.",
    "모집 인원 초과 시 추첨 방식 또는 기준에 따라 선발돼요. 예: 서울시의 경우 구간별로 나눠 15,000명 중 무작위 추첨.",
    "임대차계약서 사본(확정일자 포함), 월세 이체내역, 주민등록등본, 가족관계증명서 등이 요구돼요.",
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,

        appBar: AppBar(
          scrolledUnderElevation: 0,
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
        ),

        body: Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              Image.asset('assets/images/propick_doorimage.png', scale: 2),
              SizedBox(height: 40),
              Text(
                "${username}님을 위한",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Text(
                "AI 혜택 요약 정리",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "요약은 어떻게 이루어지나요?",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                    color: Colors.black.withAlpha(200),
                  ),
                ),
              ),
              SizedBox(height: 50),
              Container(
                width: 350,
                padding: EdgeInsets.all(24),
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Color(0x99999999)),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Text(
                        summaryTitle,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 12),

                      for (int i = 0; i < 4; i++) ...[
                        RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: firstText[i],
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              TextSpan(
                                text: summaryBody[i],
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 12),
                      ],
                    ],
                  ),
                ),
              ),

              SizedBox(height: 50),

              Align(
                child: Textbtn(text: "서류 작성하러 가기 →", pageRoute: SummaryPage()),
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
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
