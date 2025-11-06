import 'package:flutter/material.dart';
import 'package:propick/page/summary_page.dart';

class ListPage extends StatelessWidget {
  ListPage({super.key});

  String username = "장담모한다"; 
  List<String> ListCardText1 = ["임신 사전건강관리 지원사업"];
  List<List<String>> ListCardText2 = [
    ["보건복지부 출산정책과", "현금 지급", "1회성"],
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
          actions: [
            Padding(
              padding: EdgeInsetsGeometry.directional(top: 10),
              child: Column(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.search, size: 30),
                  ),
                  Transform.translate(
                    offset: Offset(0, -6),
                    child: Text(
                      "통합 검색",
                      style: TextStyle(fontSize: 8, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 5),
            Padding(
              padding: EdgeInsetsGeometry.directional(top: 10),
              child: Column(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.format_size, size: 30),
                  ),
                  Transform.translate(
                    offset: Offset(0, -6),
                    child: Text(
                      "글자 크기",
                      style: TextStyle(fontSize: 8, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "${username}님을 위한",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(
                  "복지 리스트",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 36),

            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 20),
                scrollDirection: Axis.vertical,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    height: 110,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Color(0x99999999)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          ListCardText1[0],
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 12),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "• ${ListCardText2[0][0]}",
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    "• ${ListCardText2[0][1]}",
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    "• ${ListCardText2[0][2]}",
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 100,
                                height: 35,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    backgroundColor: Color.fromARGB(
                                      255,
                                      34,
                                      92,
                                      168,
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => SummaryPage(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    "자세히 보기",
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: 16);
                },
              ),
            ),
          ],
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
