import 'package:flutter/material.dart';
import 'package:propick/repository/apiservice.dart';

class ChatMessage {
  final String text;
  final bool isUser;

  ChatMessage({required this.text, required this.isUser});
}

/// 챗봇 채팅 UI. 복지 전체 텍스트와 사용자 질문을 AI에 보내 답변을 받아 표시합니다.
class ChatBotWidget extends StatefulWidget {
  final double? width;
  final double? height;
  final String serviceName;
  final String welfareFullText;

  const ChatBotWidget({
    super.key,
    this.width,
    this.height,
    this.serviceName = '',
    this.welfareFullText = '',
  });

  @override
  State<ChatBotWidget> createState() => _ChatBotWidgetState();
}

class _ChatBotWidgetState extends State<ChatBotWidget> {
  final List<ChatMessage> _messages = [];
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  bool _isLoading = false;

  static const _botName = '프로픽 봇';

  @override
  void initState() {
    super.initState();
    _messages.add(
      ChatMessage(
        text:
            '안녕하세요! ${widget.serviceName.isNotEmpty ? '"${widget.serviceName}"' : ''} 관련해서 궁금한 점을 편하게 질문해 주세요.',
        isUser: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
        );
      }
    });
  }

  Future<void> _sendMessage() async {
    final text = _controller.text.trim();
    if (text.isEmpty || _isLoading) return;

    _controller.clear();
    setState(() {
      _messages.add(ChatMessage(text: text, isUser: true));
      _isLoading = true;
    });
    _scrollToBottom();

    // 로딩 메시지 표시
    final loadingIndex = _messages.length;
    setState(() {
      _messages.add(ChatMessage(text: '답변 생성 중...', isUser: false));
    });
    _scrollToBottom();

    try {
      final answer = await askAiAboutWelfare(
        widget.welfareFullText.isEmpty
            ? '(아직 복지 상세 내용을 불러오지 못했습니다. 잠시 후 다시 시도해 주세요.)'
            : widget.welfareFullText,
        text,
      );
      if (!mounted) return;
      setState(() {
        _messages.removeAt(loadingIndex);
        _messages.add(ChatMessage(text: answer, isUser: false));
        _isLoading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        if (_messages.length > loadingIndex) {
          _messages.removeAt(loadingIndex);
        }
        _messages.add(
          ChatMessage(text: '답변 생성 중 오류가 발생했습니다: $e', isUser: false),
        );
        _isLoading = false;
      });
    }
    _scrollToBottom();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final textScale = MediaQuery.of(context).textScaleFactor.clamp(0.8, 1.2);
    final w = widget.width ?? screenWidth * 0.8;

    return LayoutBuilder(
      builder: (context, constraints) {
        // 부모가 유한한 높이를 주면 사용, 아니면 화면 비율로 고정 (오버플로우 방지)
        final boundedHeight = constraints.maxHeight.isFinite
            ? constraints.maxHeight
            : screenHeight * 0.6;
        final maxH = widget.height ?? boundedHeight;

        return Material(
          color: Colors.white,
          child: SizedBox(
            width: w,
            height: maxH,
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    controller: _scrollController,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    itemCount: _messages.length,
                    itemBuilder: (context, index) {
                      final msg = _messages[index];
                      return _MessageBubble(
                        text: msg.text,
                        isUser: msg.isUser,
                        botName: _botName,
                        textScale: textScale,
                      );
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(8, 6, 8, 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      top: BorderSide(color: Colors.grey.shade200),
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _controller,
                          style: TextStyle(fontSize: 12 * textScale),
                          decoration: InputDecoration(
                            hintText: '메시지를 입력하세요.',
                            hintStyle: TextStyle(
                              fontSize: 14 * textScale,
                              color: Colors.grey.shade600,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(24),
                              borderSide: BorderSide(
                                color: Colors.grey.shade300,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(24),
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 34, 92, 168),
                              ),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 10,
                            ),
                            isDense: true,
                          ),
                          textCapitalization: TextCapitalization.sentences,
                          maxLines: 3,
                          minLines: 1,
                          onSubmitted: (_) => _sendMessage(),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: IconButton.filled(
                          onPressed: _isLoading ? null : _sendMessage,
                          icon: const Icon(Icons.send_rounded, size: 20),
                          style: IconButton.styleFrom(
                            backgroundColor: const Color.fromARGB(
                              255,
                              34,
                              92,
                              168,
                            ),
                            foregroundColor: Colors.white,
                            minimumSize: const Size(44, 44),
                            padding: EdgeInsets.zero,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _MessageBubble extends StatelessWidget {
  final String text;
  final bool isUser;
  final String botName;
  final double textScale;

  const _MessageBubble({
    required this.text,
    required this.isUser,
    required this.botName,
    required this.textScale,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: isUser
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (!isUser)
            Padding(
              padding: const EdgeInsets.only(right: 6, bottom: 4),
              child: Text(
                botName,
                style: TextStyle(
                  fontSize: 11 * textScale,
                  color: Colors.grey.shade600,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          Flexible(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: BoxDecoration(
                color: isUser
                    ? const Color.fromARGB(255, 34, 92, 168)
                    : Colors.grey.shade200,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(16),
                  topRight: const Radius.circular(16),
                  bottomLeft: Radius.circular(isUser ? 16 : 4),
                  bottomRight: Radius.circular(isUser ? 4 : 16),
                ),
              ),
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 14 * textScale,
                  color: isUser ? Colors.white : Colors.black87,
                ),
                softWrap: true,
                overflow: TextOverflow.clip,
              ),
            ),
          ),
          if (isUser) const SizedBox(width: 6),
        ],
      ),
    );
  }
}
