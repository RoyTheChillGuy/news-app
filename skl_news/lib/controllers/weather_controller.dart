import 'package:get/get.dart';
import 'package:skl_news/model/weather.dart';
import 'package:skl_news/services/weather_service.dart';
import 'package:skl_news/utils/constants.dart';

class WeatherController extends GetxController {
  final WeatherService _weatherService = WeatherService();

  // Obs variables
  final _isLoading = false.obs;
  final _currentWeather = <Weather>[].obs;
  final _forecast = <Weather>[].obs;
  final _selectedType = 'current'.obs;
  final _error = ''.obs;

  // Getters
  bool get isLoading => _isLoading.value;
  List<Weather> get currentWeather => _currentWeather;
  List<Weather> get forecast => _forecast;
  String get selectedType => _selectedType.value;
  String get error => _error.value;
  List<String> get weatherTypes => Constants.weatherTypes;

  @override
  void onInit() {
    super.onInit();
    fetchCurrentWeather();
  }

  Future<void> fetchCurrentWeather({String? location}) async {
    try {
      _isLoading.value = true;
      _error.value = '';
      final response = await _weatherService.getCurrentWeather(
        location: location ?? Constants.defaultLocation,
      );
      _currentWeather.value = response.data;
    } catch (e) {
      print(e.toString());
      Get.snackbar('Error', e.toString(), snackPosition: SnackPosition.BOTTOM);
    } finally {
      _isLoading.value = false;
    }
  }

  Future<void> fetchForecast({String? location}) async {
    try {
      _isLoading.value = true;
      _error.value = '';
      final response = await _weatherService.getWeatherForecast(
        location: location ?? Constants.defaultLocation,
      );
      _forecast.value = response.data;
    } catch (e) {
      print(e.toString());
      Get.snackbar('Error', e.toString(), snackPosition: SnackPosition.BOTTOM);
    } finally {
      _isLoading.value = false;
    }
  }

  void selectType(String type) {
    _selectedType.value = type;
    if (type == 'current') {
      fetchCurrentWeather();
    } else {
      fetchForecast();
    }
  }
}
