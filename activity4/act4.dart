import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  final apiKey =
      '372d4590f90bbcdab8038e3f36616745'; 
  final city =
      'Philippines'; 

  fetchWeatherData(apiKey, city).then((weatherData) {
    if (weatherData != null) {
      printWeatherData(weatherData);
    } else {
      print('Failed to fetch weather data.');
    }
  });
}

Future<Map<String, dynamic>?> fetchWeatherData(
    String apiKey, String city) async {
  final apiUrl =
      'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey';

  try {
    http.Response response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print('Failed to fetch weather data: ${response.statusCode}');
      return null;
    }
  } catch (e) {
    print('Error fetching weather data: $e');
    return null;
  }
}

void printWeatherData(Map<String, dynamic> weatherData) {
  final cityName = weatherData['name'];
  final weatherDescription = weatherData['weather'][0]['description'];
  final temperature = (weatherData['main']['temp'] - 273.15)
      .toStringAsFixed(2); // Convert Kelvin to Celsius

  print('Weather in $cityName:');
  print('Description: $weatherDescription');
  print('Temperature: $temperature°C');
}

