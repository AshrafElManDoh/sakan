import 'package:flutter/material.dart';
import 'package:sakan/features/chat_bot/presentation/views/widgets/chat_bot_body.dart';

class ChatBotView extends StatelessWidget {
  const ChatBotView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: ChatBotBody()),
    );
  }
}
