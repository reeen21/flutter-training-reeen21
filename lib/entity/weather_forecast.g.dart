// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_forecast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WeatherForecast _$WeatherForecastFromJson(Map<String, dynamic> json) =>
    _WeatherForecast(
      condition: $enumDecode(
        _$WeatherConditionEnumMap,
        json['weather_condition'],
      ),
      maxTemperature: (json['max_temperature'] as num).toInt(),
      minTemperature: (json['min_temperature'] as num).toInt(),
    );

Map<String, dynamic> _$WeatherForecastToJson(_WeatherForecast instance) =>
    <String, dynamic>{
      'weather_condition': _$WeatherConditionEnumMap[instance.condition]!,
      'max_temperature': instance.maxTemperature,
      'min_temperature': instance.minTemperature,
    };

const _$WeatherConditionEnumMap = {
  WeatherCondition.sunny: 'sunny',
  WeatherCondition.rainy: 'rainy',
  WeatherCondition.cloudy: 'cloudy',
};
