// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_action.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WeatherAction {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeatherAction);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WeatherAction()';
}


}

/// @nodoc
class $WeatherActionCopyWith<$Res>  {
$WeatherActionCopyWith(WeatherAction _, $Res Function(WeatherAction) __);
}


/// @nodoc


class FetchWeatherAction implements WeatherAction {
  const FetchWeatherAction({required this.city, required this.date});
  

 final  String city;
 final  DateTime date;

/// Create a copy of WeatherAction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FetchWeatherActionCopyWith<FetchWeatherAction> get copyWith => _$FetchWeatherActionCopyWithImpl<FetchWeatherAction>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FetchWeatherAction&&(identical(other.city, city) || other.city == city)&&(identical(other.date, date) || other.date == date));
}


@override
int get hashCode => Object.hash(runtimeType,city,date);

@override
String toString() {
  return 'WeatherAction.fetchWeather(city: $city, date: $date)';
}


}

/// @nodoc
abstract mixin class $FetchWeatherActionCopyWith<$Res> implements $WeatherActionCopyWith<$Res> {
  factory $FetchWeatherActionCopyWith(FetchWeatherAction value, $Res Function(FetchWeatherAction) _then) = _$FetchWeatherActionCopyWithImpl;
@useResult
$Res call({
 String city, DateTime date
});




}
/// @nodoc
class _$FetchWeatherActionCopyWithImpl<$Res>
    implements $FetchWeatherActionCopyWith<$Res> {
  _$FetchWeatherActionCopyWithImpl(this._self, this._then);

  final FetchWeatherAction _self;
  final $Res Function(FetchWeatherAction) _then;

/// Create a copy of WeatherAction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? city = null,Object? date = null,}) {
  return _then(FetchWeatherAction(
city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

/// @nodoc


class FetchWeatherSuccessAction implements WeatherAction {
  const FetchWeatherSuccessAction({required this.weatherForecast});
  

 final  WeatherForecast weatherForecast;

/// Create a copy of WeatherAction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FetchWeatherSuccessActionCopyWith<FetchWeatherSuccessAction> get copyWith => _$FetchWeatherSuccessActionCopyWithImpl<FetchWeatherSuccessAction>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FetchWeatherSuccessAction&&(identical(other.weatherForecast, weatherForecast) || other.weatherForecast == weatherForecast));
}


@override
int get hashCode => Object.hash(runtimeType,weatherForecast);

@override
String toString() {
  return 'WeatherAction.fetchWeatherSuccess(weatherForecast: $weatherForecast)';
}


}

/// @nodoc
abstract mixin class $FetchWeatherSuccessActionCopyWith<$Res> implements $WeatherActionCopyWith<$Res> {
  factory $FetchWeatherSuccessActionCopyWith(FetchWeatherSuccessAction value, $Res Function(FetchWeatherSuccessAction) _then) = _$FetchWeatherSuccessActionCopyWithImpl;
@useResult
$Res call({
 WeatherForecast weatherForecast
});


$WeatherForecastCopyWith<$Res> get weatherForecast;

}
/// @nodoc
class _$FetchWeatherSuccessActionCopyWithImpl<$Res>
    implements $FetchWeatherSuccessActionCopyWith<$Res> {
  _$FetchWeatherSuccessActionCopyWithImpl(this._self, this._then);

  final FetchWeatherSuccessAction _self;
  final $Res Function(FetchWeatherSuccessAction) _then;

/// Create a copy of WeatherAction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? weatherForecast = null,}) {
  return _then(FetchWeatherSuccessAction(
weatherForecast: null == weatherForecast ? _self.weatherForecast : weatherForecast // ignore: cast_nullable_to_non_nullable
as WeatherForecast,
  ));
}

/// Create a copy of WeatherAction
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WeatherForecastCopyWith<$Res> get weatherForecast {
  
  return $WeatherForecastCopyWith<$Res>(_self.weatherForecast, (value) {
    return _then(_self.copyWith(weatherForecast: value));
  });
}
}

/// @nodoc


class FetchWeatherErrorAction implements WeatherAction {
  const FetchWeatherErrorAction({required this.error});
  

 final  AppException error;

/// Create a copy of WeatherAction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FetchWeatherErrorActionCopyWith<FetchWeatherErrorAction> get copyWith => _$FetchWeatherErrorActionCopyWithImpl<FetchWeatherErrorAction>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FetchWeatherErrorAction&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'WeatherAction.fetchWeatherError(error: $error)';
}


}

/// @nodoc
abstract mixin class $FetchWeatherErrorActionCopyWith<$Res> implements $WeatherActionCopyWith<$Res> {
  factory $FetchWeatherErrorActionCopyWith(FetchWeatherErrorAction value, $Res Function(FetchWeatherErrorAction) _then) = _$FetchWeatherErrorActionCopyWithImpl;
@useResult
$Res call({
 AppException error
});




}
/// @nodoc
class _$FetchWeatherErrorActionCopyWithImpl<$Res>
    implements $FetchWeatherErrorActionCopyWith<$Res> {
  _$FetchWeatherErrorActionCopyWithImpl(this._self, this._then);

  final FetchWeatherErrorAction _self;
  final $Res Function(FetchWeatherErrorAction) _then;

/// Create a copy of WeatherAction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(FetchWeatherErrorAction(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppException,
  ));
}


}

// dart format on
