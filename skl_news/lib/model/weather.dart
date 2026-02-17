class Weather {
  Weather({
    this.location,
    this.temperature,
    this.condition,
    this.humidity,
    this.windSpeed,
    this.date,
  });

  final String? location;
  final double? temperature;
  final String? condition;
  final int? humidity;
  final double? windSpeed;
  final DateTime? date;

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      location: json["location"],
      temperature: json["temperature"]?.toDouble(),
      condition: json["condition"],
      humidity: json["humidity"],
      windSpeed: json["wind_speed"]?.toDouble(),
      date: DateTime.tryParse(json["date"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
    "location": location,
    "temperature": temperature,
    "condition": condition,
    "humidity": humidity,
    "wind_speed": windSpeed,
    "date": date?.toIso8601String(),
  };
}
