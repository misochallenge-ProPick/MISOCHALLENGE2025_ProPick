import 'package:flutter/material.dart';
import 'package:propick/page/list_page.dart';
import 'package:propick/page/main_page.dart';
import 'package:propick/util/BottmAppbar.dart';
import 'package:propick/util/TextBtn.dart';
import 'package:http/http.dart' as http;
import 'package:xml/xml.dart';

class SummaryPage extends StatefulWidget {
  SummaryPage({super.key, required this.servId});

  String servId;

  @override
  State<SummaryPage> createState() => _SummaryPageState();
}

class _SummaryPageState extends State<SummaryPage> {
  String username = "장담모한다";

  Future<Map<String, String>> fetchServiceDetail() async {
    final url = Uri.parse(
      "https://apis.data.go.kr/B554287/NationalWelfareInformationsV001/NationalWelfaredetailedV001?serviceKey=b5685498584d0bc46ca1924ad0f65950f62af6ab3906cc103498bc6fdd5edfff&callTp=D&servId=${widget.servId}",
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final xmlString = response.body;
      final document = XmlDocument.parse(xmlString);

      final allDetailText =
          document.findAllElements('wantedDtl').firstOrNull?.text.trim() ?? '';
      final servNm =
          document.findAllElements('servNm').firstOrNull?.text.trim() ?? '';

      return {'servNm': servNm, 'wantedDtl': allDetailText};
    } else {
      throw Exception('API 요청 실패: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, String>>(
      future: fetchServiceDetail(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: CircularProgressIndicator(
                color: Color.fromARGB(255, 34, 92, 168),
              ),
            ),
          );
        }

        if (snapshot.hasError) {
          return Scaffold(body: Center(child: Text("데이터를 불러오는 중 오류 발생")));
        }

        final data = snapshot.data!;
        final servName = data['servNm'] ?? '';
        final summaryText = data['wantedDtl'] ?? '';

        return Scaffold(
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
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Image.asset('assets/images/propick_doorimage.png', scale: 2),
                  SizedBox(height: 40),
                  Text(
                    "$username님을 위한",
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
                            servName,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          SizedBox(height: 12),
                          Text(
                            summaryText,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 50),

                  Align(
                    child: Textbtn(
                      text: "서류 작성하러 가기 →",
                      pageRoute: SummaryPage(servId: ""),
                    ),
                  ),
                ],
              ),
            ),
          ),

          bottomNavigationBar: PropickBottomAppbar(),
        );
      },
    );
  }
}
