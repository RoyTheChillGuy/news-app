import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:skl_news/model/weather_response.dart';
import 'package:skl_news/utils/constants.dart';

class WeatherService {
  Future<WeatherResponse> getCurrentWeather({required String location}) async {
    final url = Uri.parse(
      '${Constants.weatherBaseUrl}${Constants.currentWeather}?location=$location&apiKey=${Constants.apiKey}',
    );
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return WeatherResponse.fromJson(json);
    } else {
      throw Exception('Failed to load current weather');
    }
  }

  Future<WeatherResponse> getWeatherForecast({required String location}) async {
    final url = Uri.parse(
      '${Constants.weatherBaseUrl}${Constants.forecast}?location=$location&apiKey=${Constants.apiKey}',
    );
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return WeatherResponse.fromJson(json);
    } else {
      throw Exception('Failed to load weather forecast');
    }
  }
}
