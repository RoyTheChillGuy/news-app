import 'package:flutter/material.dart';
import 'package:skl_news/model/weather.dart';
import 'package:skl_news/utils/app_colors.dart';

class WeatherCard extends StatelessWidget {
  final VoidCallback onTap;
  final Weather weather;

  const WeatherCard({super.key, required this.weather, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 16.0),
      elevation: 2.0,
      shadowColor: AppColors.cardShadow,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Location and date
              Row(
                children: [
                  if (weather.location != null) ...[
                    Expanded(
                      child: Text(
                        weather.location!,
                        style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                  if (weather.date != null) ...[
                    Text(
                      '${weather.date!.day}/${weather.date!.month}/${weather.date!.year}',
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ],
              ),
              SizedBox(height: 12),
              // Temperature and condition
              Row(
                children: [
                  if (weather.temperature != null) ...[
                    Text(
                      '${weather.temperature!.toStringAsFixed(1)}°C',
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                  SizedBox(width: 16),
                  if (weather.condition != null) ...[
                    Text(
                      weather.condition!,
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ],
              ),
              SizedBox(height: 8),
              // Humidity and wind speed
              Row(
                children: [
                  if (weather.humidity != null) ...[
                    Text(
                      'Humidity: ${weather.humidity}%',
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 14,
                      ),
                    ),
                  ],
                  SizedBox(width: 16),
                  if (weather.windSpeed != null) ...[
                    Text(
                      'Wind: ${weather.windSpeed!.toStringAsFixed(1)} km/h',
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
