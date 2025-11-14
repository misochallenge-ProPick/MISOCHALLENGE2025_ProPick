import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:propick/page/List_page.dart';
import 'package:xml/xml.dart';
import 'package:provider/provider.dart';
import '/providers/item_provider.dart';

class APIDataPage extends StatefulWidget {
  const APIDataPage({super.key});

  @override
  _APIDataPage createState() => _APIDataPage();
}

class _APIDataPage extends State<APIDataPage> {
  late List infos, typeinfos;
  String age = "?";
  bool isDataLoaded = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (isDataLoaded) return;

    infos = Provider.of<ItemProvider>(context).infos;
    typeinfos = Provider.of<ItemProvider>(context).typeInfo;

    switch (infos[0]) {
      case "1":
        setState(() => age = "청소년");
        break;
      case "2":
        setState(() => age = "청년");
        break;
      case "3":
        setState(() => age = "중장년");
        break;
      case "4":
        setState(() => age = "노년");
        break;
    }

    isDataLoaded = true;

    fetchWelfareDetail();
  }

  List<List<String>> items = [];

  // 공공데이터 상세 API 호출
  Future<void> fetchWelfareDetail() async {
    final url = Uri.parse(
      'https://apis.data.go.kr/B554287/NationalWelfareInformationsV001/NationalWelfarelistV001?serviceKey=b5685498584d0bc46ca1924ad0f65950f62af6ab3906cc103498bc6fdd5edfff&callTp=L&pageNo=1&numOfRows=500&srchKeyCode=003',
    );

    final response = await http.get(url);
    if (response.statusCode == 200) {
      final xmlString = response.body;
      final parsedItems = extractTextFromXml(xmlString);
      Provider.of<ItemProvider>(context, listen: false).setItems(parsedItems);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ListPage()),
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
      final servId = item.getElement('servId')?.text.trim();
      final servDtlLink = item.getElement('servDtlLink')?.text.trim();
      final intrsThemaArray = item.getElement('intrsThemaArray')?.text.trim();

      if (jurMnofNm != null &&
          lifeArray != null &&
          lifeArray.contains(age) &&
          servNm != null &&
          jurOrgNm != null &&
          rprsCtadr != null &&
          servId != null &&
          servDtlLink != null &&
          intrsThemaArray != null &&
          typeinfos.contains(intrsThemaArray) &&
          jurMnofNm.isNotEmpty &&
          lifeArray.isNotEmpty &&
          servNm.isNotEmpty &&
          jurOrgNm.isNotEmpty &&
          rprsCtadr.isNotEmpty &&
          servId.isNotEmpty &&
          servDtlLink.isNotEmpty) {
        results.add([
          jurMnofNm,
          lifeArray,
          servNm,
          jurOrgNm,
          rprsCtadr,
          servId,
          servDtlLink,
        ]);
      }
    }

    return results;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: CircularProgressIndicator(
          color: Color.fromARGB(255, 34, 92, 168),
        ),
      ),
    );
  }
}
