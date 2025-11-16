import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class APIService {
  final String apiUrl =
      "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateText";

  Future<String> summarizeWithGemini(String text) async {
    final key = dotenv.env['OPEN_API_KEY'];
    if (key == null) {
      throw Exception("API 키가 설정되지 않았습니다.");
    }

    final response = await http.post(
      Uri.parse("$apiUrl?key=$key"),
      headers: ({"Content-Type": "application/json"}),
      body: jsonEncode({
        "prompt": "다음 텍스트를 복지의 제도 개요, 지원 내용, 선정 방법, 제출 서류로 나눠서 요약해줘:\n$text",
        "temperature": 0.7,
        "max_output_tokens": 256,
      }),
    );

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final generated = body["candidates"]?[0]?["output"];
      if (generated is String) {
        return generated;
      } else {
        throw Exception("요약된 텍스트를 찾을 수 없음: $body");
      }
    } else {
      throw Exception(
        "Gemini API 요청 실패 : ${response.statusCode}, ${response.body}",
      );
    }
  }
}
