import 'dart:developer';

class ApiConstants {
  static const String baseUrl = 'https://api.data.gov.in/resource/';
  static const String resourceId = '3b01bcb8-0b14-4abf-b6f2-c1bfd384ba69';
  static const String apiKey =
      '579b464db66ec23bdd000001bfe3daab54f14c2b45d747752b1ab556';

  static String airQualityUrl({required String state, required String city}) {
    final encodedState = Uri.encodeComponent(state);
    final encodedCity = Uri.encodeComponent(city);

    if (city.isNotEmpty) {
      return '$resourceId?api-key=$apiKey&format=json'
          '&filters%5Bstate%5D=$encodedState'
          '&filters%5Bcity%5D=$encodedCity';

    } else{
      return '$resourceId?api-key=$apiKey&format=json'
          '&filters%5Bstate%5D=$encodedState';
    }
  }
}
