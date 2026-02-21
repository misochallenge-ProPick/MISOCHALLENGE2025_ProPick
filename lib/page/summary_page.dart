import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:propick/repository/apiservice.dart';
import 'package:propick/util/BottmAppbar.dart';
import 'package:propick/util/ChatBot.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:xml/xml.dart';

class SummaryPage extends StatefulWidget {
  const SummaryPage({
    super.key,
    required this.servId,
    required this.servDtlLink,
  });
  final String servDtlLink;
  final String servId;

  @override
  State<SummaryPage> createState() => _SummaryPageState();
}

class _SummaryPageState extends State<SummaryPage> {
  String username = "이현준";
  String summarizedText = "";
  String welfareFullText = "";
  bool isLoading = true;
  String servName = "";

  // 서비스 상세 정보 가져오기
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
      final name =
          document.findAllElements('servNm').firstOrNull?.text.trim() ?? '';
      return {'servNm': name, 'wantedDtl': allDetailText};
    } else {
      throw Exception('API 요청 실패: ${response.statusCode}');
    }
  }

  // 요약 수행
  Future<void> fetchAndSummarize() async {
    setState(() => isLoading = true);

    try {
      final data = await fetchServiceDetail();
      servName = data['servNm'] ?? '';
      final fullText = data['wantedDtl'] ?? '';
      final summary = await doSummarizeText(fullText);
      setState(() {
        welfareFullText = fullText;
        summarizedText = summary;
      });
    } catch (e) {
      setState(() {
        summarizedText = "오류: $e";
      });
    }
    setState(() => isLoading = false);
  }

  @override
  void initState() {
    super.initState();
    fetchAndSummarize();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final textScaleFactor = MediaQuery.of(
      context,
    ).textScaleFactor.clamp(0.8, 1.2);
    final baseFontSize = screenWidth / 17; // 반응형 기준 폰트 크기

    return Scaffold(
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
            padding: EdgeInsets.only(
              right: screenWidth * 0.05,
              top: screenHeight * 0.025,
            ),
            child: GestureDetector(
              onTap: () {
                showGeneralDialog(
                  context: context,
                  barrierDismissible: false,
                  barrierLabel: "Dialog",
                  barrierColor: Colors.black.withOpacity(0.2),
                  pageBuilder: (context, _, _) {
                    return Stack(
                      children: [
                        IgnorePointer(
                          ignoring: true,
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                            child: Container(
                              color: Colors.black.withOpacity(0.1),
                            ),
                          ),
                        ),

                        Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: Container(
                              width: screenWidth * 0.8,
                              height: screenHeight * 0.75,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 20,
                                    spreadRadius: 2,
                                    offset: Offset(0.5, 0.5),
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: screenWidth * 0.05,
                                    right: screenWidth * 0.05,
                                    top: screenHeight * 0.012,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          "프로픽 봇",
                                          style: TextStyle(
                                            fontSize: 18 * textScaleFactor,
                                            color: Color.fromARGB(
                                              255,
                                              34,
                                              92,
                                              168,
                                            ),
                                            decoration: TextDecoration.none,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () => Navigator.pop(context),
                                        icon: const Icon(Icons.close),
                                      ),
                                    ],
                                  ),
                                ),
                                const Divider(
                                  thickness: 1,
                                  color: Color(0xFFE8E8E8),
                                ),
                                Expanded(
                                  child: ChatBotWidget(
                                    width: screenWidth * 0.8,
                                    serviceName: servName,
                                    welfareFullText: welfareFullText,
                                  ),
                                ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Column(
                children: [
                  Image.asset('assets/images/ChatBot2.png', scale: 2),
                  SizedBox(height: screenHeight * 0.012),
                  Transform.translate(
                    offset: Offset(0, -6),
                    child: Text(
                      '챗봇에게 질문하기',
                      style: TextStyle(fontSize: 10 * textScaleFactor),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

      body: Align(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Image.asset('assets/images/propick_doorimage.png', scale: 2),
              SizedBox(height: screenHeight * 0.05),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                child: Text(
                  "$username님을 위한",
                  style: TextStyle(
                    fontSize: baseFontSize * 1,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                child: Text(
                  "AI 혜택 요약 정리",
                  style: TextStyle(
                    fontSize: baseFontSize * 1,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "요약은 어떻게 이루어지나요?",
                  style: TextStyle(
                    fontSize: baseFontSize * 0.5,
                    fontWeight: FontWeight.w300,
                    color: Colors.black.withAlpha(200),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.06),
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 500, minWidth: 0),
                child: Container(
                  width: screenWidth * 0.9 > 500 ? 500 : screenWidth * 0.9,
                  padding: EdgeInsets.all(screenWidth * 0.06),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: const Color(0x99999999),
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.02,
                          ),
                          child: Text(
                            servName,
                            style: TextStyle(
                              fontSize: baseFontSize * 0.8,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.015),
                        isLoading
                            ? SizedBox(
                                width: 25,
                                height: 25,
                                child: CircularProgressIndicator(
                                  color: Color.fromARGB(255, 34, 92, 168),
                                ),
                              )
                            : Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.02,
                                ),
                                child: Text(
                                  summarizedText,
                                  style: TextStyle(
                                    fontSize: baseFontSize * 0.6,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                  textAlign: TextAlign.center,
                                  maxLines: 15,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.06),
              Align(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 500, minWidth: 0),
                  child: SizedBox(
                    width: screenWidth * 0.9 > 500 ? 500 : screenWidth * 0.9,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        minimumSize: Size(
                          0,
                          screenHeight * 0.08 > 64 ? screenHeight * 0.08 : 64,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: const Color.fromARGB(255, 34, 92, 168),
                      ),
                      onPressed: () async {
                        if (await canLaunchUrl(Uri.parse(widget.servDtlLink))) {
                          await launchUrl(Uri.parse(widget.servDtlLink));
                        } else {
                          print("연결이 되지 않습니다.");
                        }
                      },
                      child: Text(
                        "서류 작성하러 가기 →",
                        style: TextStyle(
                          fontSize: baseFontSize * 1,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: PropickBottomAppbar(),
    );
  }
}
