import 'package:flutter/material.dart';
import 'package:propick/page/summary_page.dart';
import 'package:propick/util/BottmAppbar.dart';
import 'package:provider/provider.dart';
import '/providers/item_provider.dart';

class ListPage extends StatelessWidget {
  ListPage({super.key});

  String username = "이현준";

  @override
  Widget build(BuildContext context) {
    final items = Provider.of<ItemProvider>(context).items;
    final infos = Provider.of<ItemProvider>(context).infos;
    final typeInfos = Provider.of<ItemProvider>(context).typeInfo;
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
          scrolledUnderElevation: 0,
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
              padding: EdgeInsetsDirectional.only(top: screenHeight * 0.012),
              child: Column(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.search, size: screenWidth * 0.075),
                  ),
                  Transform.translate(
                    offset: Offset(0, -6),
                    child: Text(
                      "통합 검색",
                      style: TextStyle(
                        fontSize: 8 * textScaleFactor,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: screenWidth * 0.012),
            Padding(
              padding: EdgeInsetsDirectional.only(top: screenHeight * 0.012),
              child: Column(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.format_size, size: screenWidth * 0.075),
                  ),
                  Transform.translate(
                    offset: Offset(0, -6),
                    child: Text(
                      "글자 크기",
                      style: TextStyle(
                        fontSize: 8 * textScaleFactor,
                        color: Colors.black,
                      ),
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
                  style: TextStyle(
                    fontSize: baseFontSize * 1.21,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "복지 리스트",
                  style: TextStyle(
                    fontSize: baseFontSize * 1.21,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: screenHeight * 0.037),
              ],
            ),
            SizedBox(height: screenHeight * 0.045),

            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                scrollDirection: Axis.vertical,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: screenHeight * 0.14 < 100
                        ? 100
                        : screenHeight * 0.14,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Color(0x99999999)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.03,
                          ),
                          child: Text(
                            items[index][2],
                            style: TextStyle(
                              fontSize: baseFontSize * 0.8,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.015),

                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.06,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "• ${items[index][0]} ${items[index][3]}",
                                      style: TextStyle(
                                        fontSize: baseFontSize * 0.45,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      "• ${items[index][1]}",
                                      style: TextStyle(
                                        fontSize: baseFontSize * 0.45,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      "• ${items[index][4]}",
                                      style: TextStyle(
                                        fontSize: baseFontSize * 0.45,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: screenWidth * 0.03),
                              SizedBox(
                                width: screenWidth * 0.25,
                                height: screenHeight * 0.044,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    backgroundColor: Color.fromARGB(
                                      255,
                                      34,
                                      92,
                                      168,
                                    ),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: screenWidth * 0.02,
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => SummaryPage(
                                          servId: items[index][5],
                                          servDtlLink: items[index][6],
                                        ),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    "자세히 보기",
                                    style: TextStyle(
                                      fontSize: baseFontSize * 0.5,
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
                  return SizedBox(height: screenHeight * 0.02);
                },
              ),
            ),
          ],
        ),

        bottomNavigationBar: PropickBottomAppbar(),
      ),
    );
  }
}
