import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skl_news/controllers/weather_controller.dart';
import 'package:skl_news/widgets/loading_shimmer.dart';
import 'package:skl_news/widgets/weather_card.dart';
import 'package:skl_news/widgets/category_chip.dart' show CategoryChip;

class HomeView extends GetView<WeatherController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),

      body: Column(
        children: [
          Container(
            height: 60,
            color: Colors.white,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              itemCount: controller.weatherTypes.length,
              itemBuilder: (context, index) {
                final type = controller.weatherTypes[index];
                return Obx(
                  () => CategoryChip(
                    label: type.capitalize ?? 'No Type',
                    isSelected: controller.selectedType == type,
                    onTap: () {
                      controller.selectType(type);
                    },
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: Obx(() {
              if (controller.isLoading) {
                return LoadingShimmer();
              }
              final weatherList =
                  controller.selectedType == 'current'
                      ? controller.currentWeather
                      : controller.forecast;
              if (weatherList.isEmpty) {
                return Center(
                  child: Text('Belum ada data ${controller.error}'),
                );
              }
              return RefreshIndicator(
                onRefresh:
                    () =>
                        controller.selectedType == 'current'
                            ? controller.fetchCurrentWeather()
                            : controller.fetchForecast(),
                child: ListView.builder(
                  itemCount: weatherList.length,
                  itemBuilder: (context, index) {
                    final weather = weatherList[index];
                    return WeatherCard(
                      weather: weather,
                      onTap: () {
                        // Handle weather card tap
                      },
                    );
                  },
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
