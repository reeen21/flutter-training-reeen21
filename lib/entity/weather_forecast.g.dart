// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'weather_forecast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WeatherForecast _$WeatherForecastFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_WeatherForecast',
      json,
      ($checkedConvert) {
        final val = _WeatherForecast(
          condition: $checkedConvert(
            'weather_condition',
            (v) => $enumDecode(_$WeatherConditionEnumMap, v),
          ),
          maxTemperature: $checkedConvert(
            'max_temperature',
            (v) => (v as num).toInt(),
          ),
          minTemperature: $checkedConvert(
            'min_temperature',
            (v) => (v as num).toInt(),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'condition': 'weather_condition',
        'maxTemperature': 'max_temperature',
        'minTemperature': 'min_temperature',
      },
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
