import 'package:flutter/material.dart';
import 'package:propick/page/list_page.dart';
import 'package:propick/page/main_page.dart';
import 'package:provider/provider.dart';
import '/providers/item_provider.dart';

class PropickBottomAppbar extends StatelessWidget {
  const PropickBottomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
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
                onPressed: () {
                  Provider.of<ItemProvider>(context, listen: false).clearInfos();
                  Provider.of<ItemProvider>(context, listen: false).clearTypeInfos();

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MainPage()),
                  );
                },
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
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ListPage()),
                  );
                },
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
    );
  }
}
