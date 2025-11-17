import 'package:flutter/material.dart';
import 'package:propick/services/apiservice.dart';
import 'package:propick/util/BottmAppbar.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:xml/xml.dart';

class SummaryPage extends StatefulWidget {
  SummaryPage({super.key, required this.servId, required this.servDtlLink});
  final String servDtlLink;
  final String servId;

  @override
  State<SummaryPage> createState() => _SummaryPageState();
}

class _SummaryPageState extends State<SummaryPage> {
  String username = "이현민";
  String summarizedText = "";
  bool isLoading = true;
  String servName = "";

  // 1️⃣ 서비스 상세 정보 가져오기
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
      final name = document.findAllElements('servNm').firstOrNull?.text.trim() ?? '';
      return {'servNm': name, 'wantedDtl': allDetailText};
    } else {
      throw Exception('API 요청 실패: ${response.statusCode}');
    }
  }

  // 2️⃣ 요약 수행
  Future<void> fetchAndSummarize() async {
    setState(() => isLoading = true);

    try {
      final data = await fetchServiceDetail();
      servName = data['servNm'] ?? '';
      final summary = await doSummarizeText(data['wantedDtl'] ?? '');
      setState(() {
        summarizedText = summary;
      });
    } catch (e) {
      setState(() {
        summarizedText = "오류: $e";
      });
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    fetchAndSummarize();
  }

  @override
  Widget build(BuildContext context) {
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
              const SizedBox(height: 40),
              Text(
                "$username님을 위한",
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const Text(
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
              const SizedBox(height: 50),
              Container(
                width: 350,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: const Color(0x99999999)),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Text(
                        servName,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      isLoading
                          ? const SizedBox(
                              width: 25,
                              height: 25,
                              child: CircularProgressIndicator(
                                color: Color.fromARGB(255, 34, 92, 168),
                              ),
                            )
                          : Text(
                              summarizedText,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 50),
              Align(
                child: TextButton(
                  style: TextButton.styleFrom(
                    minimumSize: const Size(350, 64),
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
                  child: const Text(
                    "서류 작성하러 가기 →",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
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
