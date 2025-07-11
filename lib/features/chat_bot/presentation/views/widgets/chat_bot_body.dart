// import 'package:flutter/material.dart';

// class ChatBotBody extends StatelessWidget {
//   const ChatBotBody({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sakan/constants.dart';
import 'package:sakan/core/utils/api_service.dart';
import 'package:sakan/core/utils/chat_bot_service.dart';

class ChatBotBody extends StatefulWidget {
  const ChatBotBody({super.key});

  @override
  State<ChatBotBody> createState() => _ChatBotBodyState();
}

class _ChatBotBodyState extends State<ChatBotBody> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> _messages =
      []; // {"role": "user" | "bot", "text": "..."}

  bool isLoading = false;

  void _sendMessage() async {
    final text = _controller.text.trim();
    if (text.isEmpty) return;

    setState(() {
      _messages.add({"role": "user", "text": text});
      isLoading = true;
      _controller.clear();
    });

    try {
      // Send to chatbot service
      final botResponse = await _chatBotService.sendMessage(text);
      setState(() {
        _messages.add({"role": "bot", "text": botResponse});
      });
    } catch (e) {
      setState(() {
        _messages.add({"role": "bot", "text": "❌ Error: $e"});
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  // Temporary direct service instance (you can replace with Cubit later)
  final ChatBotService _chatBotService = ChatBotService(ApiService(Dio()));

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: _messages.length,
            itemBuilder: (context, index) {
              final message = _messages[index];
              final isUser = message["role"] == "user";
              return Align(
                alignment:
                    isUser ? Alignment.centerRight : Alignment.centerLeft,
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  padding: const EdgeInsets.all(12),
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.7),
                  decoration: BoxDecoration(
                    color: isUser ? ksecondaryColor : Colors.grey[300],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    message["text"] ?? "",
                    style:
                        TextStyle(color: isUser ? Colors.white : Colors.black),
                  ),
                ),
              );
            },
          ),
        ),
        if (isLoading)
          const Padding(
            padding: EdgeInsets.only(bottom: 8),
            child: CircularProgressIndicator(),
          ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    hintText: "Enter your message",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: kcolorOfTextField),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: kcolorOfTextField),
                    ),
                  ),
                  onSubmitted: (_) => _sendMessage(),
                ),
              ),
              const SizedBox(width: 8),
              IconButton(
                icon: const Icon(Icons.send),
                onPressed: _sendMessage,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
