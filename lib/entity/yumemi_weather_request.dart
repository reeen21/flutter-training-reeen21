class YumemiWeatherRequest {
  const YumemiWeatherRequest({required this.city, required this.date});
  final String city;
  final DateTime date;

  Map<String, String> toJson() {
    return {
      'area': city,
      'date': date.toIso8601String(),
    };
  }
}
