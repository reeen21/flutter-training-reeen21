// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_forecast.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WeatherForecast {

@JsonKey(name: 'weather_condition') WeatherCondition get condition; int get maxTemperature; int get minTemperature;
/// Create a copy of WeatherForecast
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WeatherForecastCopyWith<WeatherForecast> get copyWith => _$WeatherForecastCopyWithImpl<WeatherForecast>(this as WeatherForecast, _$identity);

  /// Serializes this WeatherForecast to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeatherForecast&&(identical(other.condition, condition) || other.condition == condition)&&(identical(other.maxTemperature, maxTemperature) || other.maxTemperature == maxTemperature)&&(identical(other.minTemperature, minTemperature) || other.minTemperature == minTemperature));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,condition,maxTemperature,minTemperature);

@override
String toString() {
  return 'WeatherForecast(condition: $condition, maxTemperature: $maxTemperature, minTemperature: $minTemperature)';
}


}

/// @nodoc
abstract mixin class $WeatherForecastCopyWith<$Res>  {
  factory $WeatherForecastCopyWith(WeatherForecast value, $Res Function(WeatherForecast) _then) = _$WeatherForecastCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'weather_condition') WeatherCondition condition, int maxTemperature, int minTemperature
});




}
/// @nodoc
class _$WeatherForecastCopyWithImpl<$Res>
    implements $WeatherForecastCopyWith<$Res> {
  _$WeatherForecastCopyWithImpl(this._self, this._then);

  final WeatherForecast _self;
  final $Res Function(WeatherForecast) _then;

/// Create a copy of WeatherForecast
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? condition = null,Object? maxTemperature = null,Object? minTemperature = null,}) {
  return _then(_self.copyWith(
condition: null == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as WeatherCondition,maxTemperature: null == maxTemperature ? _self.maxTemperature : maxTemperature // ignore: cast_nullable_to_non_nullable
as int,minTemperature: null == minTemperature ? _self.minTemperature : minTemperature // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _WeatherForecast implements WeatherForecast {
  const _WeatherForecast({@JsonKey(name: 'weather_condition') required this.condition, required this.maxTemperature, required this.minTemperature});
  factory _WeatherForecast.fromJson(Map<String, dynamic> json) => _$WeatherForecastFromJson(json);

@override@JsonKey(name: 'weather_condition') final  WeatherCondition condition;
@override final  int maxTemperature;
@override final  int minTemperature;

/// Create a copy of WeatherForecast
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WeatherForecastCopyWith<_WeatherForecast> get copyWith => __$WeatherForecastCopyWithImpl<_WeatherForecast>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WeatherForecastToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WeatherForecast&&(identical(other.condition, condition) || other.condition == condition)&&(identical(other.maxTemperature, maxTemperature) || other.maxTemperature == maxTemperature)&&(identical(other.minTemperature, minTemperature) || other.minTemperature == minTemperature));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,condition,maxTemperature,minTemperature);

@override
String toString() {
  return 'WeatherForecast(condition: $condition, maxTemperature: $maxTemperature, minTemperature: $minTemperature)';
}


}

/// @nodoc
abstract mixin class _$WeatherForecastCopyWith<$Res> implements $WeatherForecastCopyWith<$Res> {
  factory _$WeatherForecastCopyWith(_WeatherForecast value, $Res Function(_WeatherForecast) _then) = __$WeatherForecastCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'weather_condition') WeatherCondition condition, int maxTemperature, int minTemperature
});




}
/// @nodoc
class __$WeatherForecastCopyWithImpl<$Res>
    implements _$WeatherForecastCopyWith<$Res> {
  __$WeatherForecastCopyWithImpl(this._self, this._then);

  final _WeatherForecast _self;
  final $Res Function(_WeatherForecast) _then;

/// Create a copy of WeatherForecast
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? condition = null,Object? maxTemperature = null,Object? minTemperature = null,}) {
  return _then(_WeatherForecast(
condition: null == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as WeatherCondition,maxTemperature: null == maxTemperature ? _self.maxTemperature : maxTemperature // ignore: cast_nullable_to_non_nullable
as int,minTemperature: null == minTemperature ? _self.minTemperature : minTemperature // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
