import 'package:sakan/core/utils/api_service.dart';

class ChatBotService {
  final ApiService apiService;
  ChatBotService(this.apiService);

  Future<String> sendMessage(String message) async {
    final response = await apiService.postForAI(
      url: "https://sakanbot-production.up.railway.app/chat",
      data: {"message": message},
    );
    return response["response"];
  }
}
