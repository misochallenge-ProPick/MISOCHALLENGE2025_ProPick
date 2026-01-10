import 'package:flutter/material.dart';
import 'package:propick/page/list_page.dart';
import 'package:propick/page/main_page.dart';
import 'package:provider/provider.dart';
import '/providers/item_provider.dart';

class PropickBottomAppbar extends StatelessWidget {
  const PropickBottomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final textScaleFactor = MediaQuery.of(context).textScaleFactor.clamp(0.8, 1.2);
    final baseFontSize = screenWidth / 17; // 반응형 기준 폰트 크기

    return BottomAppBar(
      height: screenHeight * 0.11 < 85 
          ? 85 
          : (screenHeight * 0.11 > 100 ? 100 : screenHeight * 0.11),
      color: Colors.white,
      elevation: 3,
      shadowColor: Colors.black,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () {
                  Provider.of<ItemProvider>(context, listen: false).clearInfos();
                  Provider.of<ItemProvider>(context, listen: false).clearTypeInfos();

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MainPage()),
                  );
                },
                icon: Icon(Icons.home_filled, size: screenWidth * 0.075),
              ),
              Transform.translate(
                offset: Offset(0, -6),
                child: Text(
                  "홈",
                  style: TextStyle(fontSize: baseFontSize * 0.5, color: Colors.black),
                ),
              ),
            ],
          ),
          Container( 
            width: screenWidth * 0.25 > 110 
                ? 110 
                : (screenWidth * 0.25 < 80 ? 80 : screenWidth * 0.25),
            height: screenWidth * 0.25 > 110 
                ? 110 
                : (screenWidth * 0.25 < 80 ? 80 : screenWidth * 0.25),
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
                    fontSize: baseFontSize * 0.62,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ListPage()),
                  );
                },
                icon: Icon(Icons.grid_view_rounded, size: screenWidth * 0.075),
              ),
              Transform.translate(
                offset: Offset(0, -6),
                child: Text(
                  "전체메뉴",
                  style: TextStyle(fontSize: baseFontSize * 0.5, color: Colors.black),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
