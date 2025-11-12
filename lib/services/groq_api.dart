import 'dart:convert';
import 'package:http/http.dart' as http;
import '../utils/constants.dart';

class GroqApi {
  static Future<String> getResponse(String userMessage) async {
    try {
      final response = await http.post(
        Uri.parse("END POINT"),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer Your API Key',
        },
        body: jsonEncode({
          "model": "MODEL Name",
          "messages": [
            {"role": "system", "content": "You are CM BOT, a helpful AI assistant."},
            {"role": "user", "content": userMessage}
          ],
          "temperature": 0.7
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['choices'][0]['message']['content'];
      } else {
        return "⚠️ Error: ${response.statusCode}";
      }
    } catch (e) {
      return "❌ Failed to connect to Groq API: $e";
    }
  }
}
