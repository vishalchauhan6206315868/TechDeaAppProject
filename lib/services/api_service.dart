import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import '../models/stats_model.dart';

class ApiService {
  static const String baseUrl = 'https://techdea.onrender.com/api';

  // Fetch real-time statistics from TechDea API
  static Future<StatsModel> getStats() async {
    try {
      final response = await http
          .get(Uri.parse('$baseUrl/stats'))
          .timeout(const Duration(seconds: 8));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        if (data['success'] == true && data['stats'] != null) {
          return StatsModel.fromJson(data['stats']);
        }
      }
      return StatsModel.fallback();
    } catch (_) {
      // Fallback in case of network issue or timeout
      return StatsModel.fallback();
    }
  }

  // Helper method to safely launch external URLs
  static Future<bool> launchWebUrl(String urlString) async {
    try {
      final Uri uri = Uri.parse(urlString);
      if (await canLaunchUrl(uri)) {
        return await launchUrl(
          uri,
          mode: LaunchMode.externalApplication,
        );
      }
      return false;
    } catch (_) {
      return false;
    }
  }
}

