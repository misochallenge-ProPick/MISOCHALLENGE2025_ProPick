import 'package:google_generative_ai/google_generative_ai.dart';

const String apiKey = "AIzaSyByvGD5i-JDtekCKdKJElDCtIBEoz00xk8";

Future<String> doSummarizeText(String text) async {
  final model = GenerativeModel(
    model: 'gemini-2.5-flash', // 무료 모델
    apiKey: apiKey,
  );

  final response = await model.generateContent([
    Content.text("""
다음 글을 핵심만 3~4줄로 요약해줘:
$text
""")
  ]);

  return response.text ?? "요약 실패";
}
