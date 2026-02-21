import 'package:google_generative_ai/google_generative_ai.dart';

const String apiKey = "AIzaSyCq2h0Ob_GCYHkIPnpsKvfkLiszijhJ_b4";

Future<String> doSummarizeText(String text) async {
  final model = GenerativeModel(
    model: 'gemini-2.5-flash',
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

/// 복지 전체 텍스트와 사용자 질문을 함께 AI에 보내고 답변을 받습니다.
Future<String> askAiAboutWelfare(String welfareFullText, String userQuestion) async {
  final model = GenerativeModel(
    model: 'gemini-2.5-flash',
    apiKey: apiKey,
  );

  final response = await model.generateContent([
    Content.text("""
다음은 복지 제도/서비스에 대한 전체 상세 내용입니다:

---
$welfareFullText
---

사용자가 다음과 같이 질문했습니다:
"$userQuestion"

[규칙] 3문장 이내로 짧게 답변. 불필요한 서두·인사 생략. 핵심만 단호하고 명확하게. 내용에 없으면 "해당 내용에 없습니다"라고만 답변.
""")
  ]);

  return response.text ?? "답변을 생성하지 못했습니다.";
}
