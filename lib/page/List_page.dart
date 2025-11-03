import 'package:flutter/material.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

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
