import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:propick/repository/ev_repository.dart';
import 'package:propick/util/TextBtn_save.dart';

class InputAreaPage extends StatefulWidget {
  const InputAreaPage({super.key});

  @override
  State<InputAreaPage> createState() => _InputAreaPageState();
}

List<String> areaItems = [
  "강원특별자치도 양구군",
  "강원특별자치도 속초시",
  "경기도 수원특례시",
  "경상도 대구광역시",
  "서울특별시 관악구",
];
String? dropdownValue;

class _InputAreaPageState extends State<InputAreaPage> {
  @override
  void initState() {
    super.initState();
    dropdownValue = null;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final baseFontSize = screenWidth / 17; // 반응형 기준 폰트 크기

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,

        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: screenHeight * 0.1,
          backgroundColor: Colors.white,
          title: SizedBox(
            width: screenWidth * 0.5 > 300 ? 300 : screenWidth * 0.5,
            // child: LinearProgressIndicator(
            //   value: 0.99,
            //   backgroundColor: Colors.grey[300],
            //   color: Color.fromARGB(255, 34, 92, 168),
            //   minHeight: 5.0,
            //   borderRadius: BorderRadius.circular(10.0),
            // ),
            child: TweenAnimationBuilder(
              tween: Tween<double>(begin: 0.6, end: 0.99),
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              builder: (context, value, _) {
                return LinearProgressIndicator(
                  value: value,
                  backgroundColor: Colors.grey[300],
                  color: Color.fromARGB(255, 34, 92, 168),
                  minHeight: 5.0,
                  borderRadius: BorderRadius.circular(10.0),
                );
              },
            ),
          ),
        ),

        body: Column(
          children: [
            SizedBox(height: screenHeight * 0.022),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.05,
                    ),
                    child: Text(
                      "이제 마지막이에요!",
                      style: TextStyle(
                        fontSize: baseFontSize * 1,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.05,
                    ),
                    child: Text(
                      "회원님은 어느 지역에 거주하시나요?",
                      style: TextStyle(
                        fontSize: baseFontSize * 1,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.04),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 500, minWidth: 0),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      isExpanded: true,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: baseFontSize * 1.15,
                        fontWeight: FontWeight.bold,
                      ),

                      value: dropdownValue,
                      hint: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.02,
                        ),
                        child: Text(
                          "거주 지역을 선택하세요",
                          style: TextStyle(
                            fontSize: baseFontSize * 1,
                            fontWeight: FontWeight.w500,
                            color: Color(0x99999999),
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),

                      items: areaItems.map((value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.02,
                            ),
                            child: Text(
                              value,
                              style: TextStyle(
                                fontSize: baseFontSize * 0.7,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        );
                      }).toList(),

                      selectedItemBuilder: (BuildContext context) {
                        return areaItems.map((value) {
                          return Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: screenWidth * 0.02,
                              ),
                              child: Text(
                                value,
                                style: TextStyle(
                                  fontSize: baseFontSize * 1,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          );
                        }).toList();
                      },

                      onChanged: (value) {
                        if (value != null && areaItems.contains(value)) {
                          setState(() {
                            dropdownValue = value;
                          });
                        }
                      },

                      buttonStyleData: ButtonStyleData(
                        height: screenHeight * 0.08 > 64
                            ? screenHeight * 0.08
                            : 64,
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.04,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Color(0x99999999)),
                          color: Colors.white,
                        ),
                      ),

                      iconStyleData: IconStyleData(
                        icon: Icon(Icons.keyboard_arrow_down_rounded),
                        iconEnabledColor: Colors.black,
                        iconSize: screenWidth * 0.08,
                      ),

                      dropdownStyleData: DropdownStyleData(
                        elevation: 0,
                        maxHeight: screenHeight * 0.53,
                        offset: Offset(0, -16),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: Color(0x99999999),
                          ),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                      ),
                      menuItemStyleData: MenuItemStyleData(
                        height: screenHeight * 0.046,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            Spacer(), // 맨 아래로 밀어줌
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: screenHeight * 0.04),
                child: SaveBtn(
                  text: "완료",
                  info: dropdownValue,
                  pageRoute: APIDataPage(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
