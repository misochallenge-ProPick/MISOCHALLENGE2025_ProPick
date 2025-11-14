import 'package:flutter/material.dart';
import 'package:propick/page/summary_page.dart';
import 'package:propick/util/BottmAppbar.dart';
import 'package:provider/provider.dart';
import '/providers/item_provider.dart';

class ListPage extends StatelessWidget {
  ListPage({super.key});

  String username = "이현민";

  @override
  Widget build(BuildContext context) {
    final items = Provider.of<ItemProvider>(context).items;
    final infos = Provider.of<ItemProvider>(context).infos;
    final typeInfos = Provider.of<ItemProvider>(context).typeInfo;

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
                  "$username님을 위한",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(
                  "복지 리스트",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 30),
                Text(
                  "${typeInfos} \n ${infos}"
                ),

              ],
            ),
            SizedBox(height: 36),

            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 20),
                scrollDirection: Axis.vertical,
                itemCount: items.length,
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
                          items[index][2],
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
                                    "• ${items[index][0]} ${items[index][3]}",
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    "• ${items[index][1]}",
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    "• ${items[index][4]}",
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
                                        builder: (context) => SummaryPage(
                                          servId: items[index][5],
                                          servDtlLink : items[index][6],
                                        ),
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

        bottomNavigationBar: PropickBottomAppbar()
      ),
    );
  }
}
