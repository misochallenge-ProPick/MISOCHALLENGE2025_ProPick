import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:propick/page/inputType_page.dart';

class InputAreaPage extends StatefulWidget {
  const InputAreaPage({super.key});

  @override
  State<InputAreaPage> createState() => _InputAreaPageState();
}

List<String> areaItems = ["강원특별자치도 양구군", "강원특별자치도 속초시", "경기도 수원특례시"];
String? dropdownValue;

class _InputAreaPageState extends State<InputAreaPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,

        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 80,
          backgroundColor: Colors.white,
          title: SizedBox(
            width: 200,
            child: LinearProgressIndicator(
              value: 0.99,
              backgroundColor: Colors.grey[300],
              color: Color.fromARGB(255, 34, 92, 168),
              minHeight: 5.0,
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),

        body: Column(
          children: [
            SizedBox(height: 18),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "이제 마지막이에요!",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "회원님은 어느 지역에 거주하시나요?",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Center(
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2(
                    isExpanded: true,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),

                    value: dropdownValue,
                    hint: Text(
                      "거주 지역을 입력하세요",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Color(0x99999999),
                      ),
                    ),
                    
                    items: areaItems.map((value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      );
                    }).toList(),

                    selectedItemBuilder: (BuildContext context) {
                      return areaItems.map((value) {
                        return Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            value,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        );
                      }).toList();
                    },

                    onChanged: (value) {
                      setState(() {
                        dropdownValue = value!;
                      });
                    },

                    buttonStyleData: ButtonStyleData(
                      height: 64,
                      width: 350,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Color(0x99999999)),
                        color: Colors.white,
                      ),
                    ),

                    iconStyleData: IconStyleData(
                      icon: Icon(Icons.keyboard_arrow_down_rounded),
                      iconEnabledColor: Colors.black,
                      iconSize: 32,
                    ),

                    dropdownStyleData: DropdownStyleData(
                      elevation: 0,
                      maxHeight: 427,
                      offset: Offset(0, -16),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Color(0x99999999)),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                    ),
                    menuItemStyleData: MenuItemStyleData(height: 37),
                  ),
                ),
              ),
            ),
          ],
        ),

        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          child: TextButton(
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              backgroundColor: Color.fromARGB(255, 34, 92, 168),
            ),
            onPressed: () {},
            child: Text(
              "완료",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
