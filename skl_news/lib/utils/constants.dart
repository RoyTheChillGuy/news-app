import 'package:flutter_dotenv/flutter_dotenv.dart';

class Constants {
  // API base URL (assuming shared or news API URL)
  static const String baseUrl = "https://newsapi.org/v2";
  static String get apiKey => dotenv.env['API_KEY'] ?? '';

  // News Endpoints
  static const String topHeadlines = "/top-headlines";

  // Default country for news
  static const String defaultCountry = "us";

  // News categories
  static const List<String> categories = [
    'general',
    'business',
    'entertainment',
    'health',
    'science',
    'sports',
    'technology',
  ];

  // Weather API base URL
  static const String weatherBaseUrl = "https://weather.ewalabs.com/api/v1";

  // Weather Endpoints
  static const String currentWeather = "/current";
  static const String forecast = "/forecast";

  // Default location
  static const String defaultLocation = "Jakarta";

  // Weather types or categories (e.g., for different views)
  static const List<String> weatherTypes = ['current', 'forecast'];
}
