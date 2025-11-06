import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:propick/page/List_page.dart';
import 'package:propick/page/main_page.dart';
import 'package:xml/xml.dart';
import 'package:provider/provider.dart';
import '/providers/item_provider.dart';

class APIDataPage extends StatefulWidget {
  const APIDataPage({super.key});

  @override
  _APIDataPage createState() => _APIDataPage();
}

class _APIDataPage extends State<APIDataPage> {
  @override
  void initState() {
    super.initState();
    fetchWelfareDetail();
  }

  List<List<String>> items = [];

  // 공공데이터 상세 API 호출
  Future<void> fetchWelfareDetail() async {
    final url = Uri.parse(
      'https://apis.data.go.kr/B554287/NationalWelfareInformationsV001/NationalWelfarelistV001?serviceKey=b5685498584d0bc46ca1924ad0f65950f62af6ab3906cc103498bc6fdd5edfff&callTp=L&pageNo=1&numOfRows=14&srchKeyCode=003',
    );

    final response = await http.get(url);
    if (response.statusCode == 200) {
      final xmlString = response.body;
      final parsedItems = extractTextFromXml(xmlString);
      Provider.of<ItemProvider>(context, listen: false).setItems(parsedItems);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MainPage()),
      );

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
      final servNm = item.getElement('servNm')?.text.trim();
      final jurOrgNm = item.getElement('jurOrgNm')?.text.trim();
      final rprsCtadr = item.getElement('rprsCtadr')?.text.trim();

      if (jurMnofNm != null &&
          lifeArray != null &&
          servNm != null &&
          jurOrgNm != null &&
          rprsCtadr != null &&
          jurMnofNm.isNotEmpty &&
          lifeArray.isNotEmpty &&
          servNm.isNotEmpty &&
          jurOrgNm.isNotEmpty &&
          rprsCtadr.isNotEmpty) {
        results.add([jurMnofNm, lifeArray, servNm, jurOrgNm, rprsCtadr]);
      }
    }

    return results;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
