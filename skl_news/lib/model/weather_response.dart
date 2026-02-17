import 'weather.dart';

class WeatherResponse {
  WeatherResponse({required this.status, required this.data});

  final String? status;
  final List<Weather> data;

  factory WeatherResponse.fromJson(Map<String, dynamic> json) {
    return WeatherResponse(
      status: json["status"],
      data:
          json["data"] == null
              ? []
              : List<Weather>.from(
                json["data"]!.map((x) => Weather.fromJson(x)),
              ),
    );
  }

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data.map((x) => x.toJson()).toList(),
  };
}
