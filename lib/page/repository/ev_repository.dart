import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:xml/xml.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: '복지 서비스 상세 조회', home: WelfareDetailPage());
  }
}

class WelfareDetailPage extends StatefulWidget {
  const WelfareDetailPage({super.key});

  @override
  _WelfareDetailPageState createState() => _WelfareDetailPageState();
}

class _WelfareDetailPageState extends State<WelfareDetailPage> {
  String detailText = "서비스 상세 내용이 여기에 표시됩니다...";
  bool loading = false;
  List<String> people = [];
  List<String> goverment = [];
  List<List<String>> items = [];

  // 공공데이터 상세 API 호출
  Future<String> fetchWelfareDetail() async {
    final url = Uri.parse(
      'https://apis.data.go.kr/B554287/NationalWelfareInformationsV001/NationalWelfarelistV001?serviceKey=b5685498584d0bc46ca1924ad0f65950f62af6ab3906cc103498bc6fdd5edfff&callTp=L&pageNo=1&numOfRows=14&srchKeyCode=003',
    );

    final response = await http.get(url);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('API 요청 실패: ${response.statusCode}');
    }
  }

  // XML에서 특정 태그("lifeArray")의 텍스트 추출 → 리스트로 반환
  List<List<String>> extractTextFromXml(String xmlString) {
    final document = XmlDocument.parse(xmlString);
    final itemElements = document.findAllElements('servList');
    List<List<String>> results = [];

    for (final item in itemElements) {
      final jurMnofNm = item.getElement('jurMnofNm')?.text.trim();
      final lifeArray = item.getElement('lifeArray')?.text.trim();

      if (jurMnofNm != null &&
          lifeArray != null &&
          jurMnofNm.isNotEmpty &&
          lifeArray.isNotEmpty) {
        results.add([jurMnofNm, lifeArray]);
      }
    }

    return results;
  }

  // 버튼 클릭 시 실행
  void handleFetchDetail() async {
    setState(() {
      loading = true;
      items = [];
    });

    try {
      final xmlString = await fetchWelfareDetail();
      final parsedItems = extractTextFromXml(xmlString);

      setState(() {
        items = parsedItems;
      });
    } catch (e) {
      setState(() {
        detailText = "오류 발생: $e";
      });
    } finally {
      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('복지 서비스 상세 조회')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: loading ? null : handleFetchDetail,
              child: Text(loading ? "불러오는 중..." : "서비스 상세 조회"),
            ),
            SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      items[index][0] + " " + items[index][1],
                      style: TextStyle(fontSize: 16),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
