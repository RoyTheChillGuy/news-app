import 'package:get/get.dart';
import 'package:skl_news/controllers/weather_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WeatherController>(() => WeatherController());
  }
}
