import 'package:google_generative_ai/google_generative_ai.dart';

const String apiKey = "AIzaSyByvGD5i-JDtekCKdKJElDCtIBEoz00xk8";

Future<String> doSummarizeText(String text) async {
  final model = GenerativeModel(
    model: 'gemini-2.5-flash', // 무료 모델
    apiKey: apiKey,
  );

  final response = await model.generateContent([
    Content.text("""
    다음 글을
     ✅ 제도 개요: 청년의 주거비 부담을 완화하고
  거주 안정을 지원하기 위한 제도예요.

  💡 지원 내용: 대체로 월 20만원이 상한선인 경우가 많아요. 

  📌 선정 방법: 모집 인원 초과 시 추첨 방식 또는 기준에 따라 선발돼요. 예: 서울시의 경우 구간별로 나눠 15,000명 중 무작위 추첨.

  📝 제출 서류: 임대차계약서 사본(확정일자 포함), 월세 이체내역, 주민등록등본, 가족관계증명서 등이 요구돼요.
    를 예시로 하고,
    ✅ 제도 개요 :

    💡 지원 내용 : 

    📌 선정 방법 :
    
    📝 제출 서류 :
    로 나눠서 6줄 이내로 핵심만 요약해줘
    *은 넣지마
    $text
    """)
  ]);

  return response.text ?? "요약 실패";
}
