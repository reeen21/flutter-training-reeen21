// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_store.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WeatherState {

 WeatherForecast? get weatherForecast; AppException? get error; bool get isLoading;
/// Create a copy of WeatherState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WeatherStateCopyWith<WeatherState> get copyWith => _$WeatherStateCopyWithImpl<WeatherState>(this as WeatherState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeatherState&&(identical(other.weatherForecast, weatherForecast) || other.weatherForecast == weatherForecast)&&(identical(other.error, error) || other.error == error)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading));
}


@override
int get hashCode => Object.hash(runtimeType,weatherForecast,error,isLoading);

@override
String toString() {
  return 'WeatherState(weatherForecast: $weatherForecast, error: $error, isLoading: $isLoading)';
}


}

/// @nodoc
abstract mixin class $WeatherStateCopyWith<$Res>  {
  factory $WeatherStateCopyWith(WeatherState value, $Res Function(WeatherState) _then) = _$WeatherStateCopyWithImpl;
@useResult
$Res call({
 WeatherForecast? weatherForecast, AppException? error, bool isLoading
});


$WeatherForecastCopyWith<$Res>? get weatherForecast;

}
/// @nodoc
class _$WeatherStateCopyWithImpl<$Res>
    implements $WeatherStateCopyWith<$Res> {
  _$WeatherStateCopyWithImpl(this._self, this._then);

  final WeatherState _self;
  final $Res Function(WeatherState) _then;

/// Create a copy of WeatherState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? weatherForecast = freezed,Object? error = freezed,Object? isLoading = null,}) {
  return _then(_self.copyWith(
weatherForecast: freezed == weatherForecast ? _self.weatherForecast : weatherForecast // ignore: cast_nullable_to_non_nullable
as WeatherForecast?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppException?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of WeatherState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WeatherForecastCopyWith<$Res>? get weatherForecast {
    if (_self.weatherForecast == null) {
    return null;
  }

  return $WeatherForecastCopyWith<$Res>(_self.weatherForecast!, (value) {
    return _then(_self.copyWith(weatherForecast: value));
  });
}
}


/// @nodoc


class _WeatherState implements WeatherState {
  const _WeatherState({this.weatherForecast = null, this.error = null, this.isLoading = false});
  

@override@JsonKey() final  WeatherForecast? weatherForecast;
@override@JsonKey() final  AppException? error;
@override@JsonKey() final  bool isLoading;

/// Create a copy of WeatherState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WeatherStateCopyWith<_WeatherState> get copyWith => __$WeatherStateCopyWithImpl<_WeatherState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WeatherState&&(identical(other.weatherForecast, weatherForecast) || other.weatherForecast == weatherForecast)&&(identical(other.error, error) || other.error == error)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading));
}


@override
int get hashCode => Object.hash(runtimeType,weatherForecast,error,isLoading);

@override
String toString() {
  return 'WeatherState(weatherForecast: $weatherForecast, error: $error, isLoading: $isLoading)';
}


}

/// @nodoc
abstract mixin class _$WeatherStateCopyWith<$Res> implements $WeatherStateCopyWith<$Res> {
  factory _$WeatherStateCopyWith(_WeatherState value, $Res Function(_WeatherState) _then) = __$WeatherStateCopyWithImpl;
@override @useResult
$Res call({
 WeatherForecast? weatherForecast, AppException? error, bool isLoading
});


@override $WeatherForecastCopyWith<$Res>? get weatherForecast;

}
/// @nodoc
class __$WeatherStateCopyWithImpl<$Res>
    implements _$WeatherStateCopyWith<$Res> {
  __$WeatherStateCopyWithImpl(this._self, this._then);

  final _WeatherState _self;
  final $Res Function(_WeatherState) _then;

/// Create a copy of WeatherState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? weatherForecast = freezed,Object? error = freezed,Object? isLoading = null,}) {
  return _then(_WeatherState(
weatherForecast: freezed == weatherForecast ? _self.weatherForecast : weatherForecast // ignore: cast_nullable_to_non_nullable
as WeatherForecast?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppException?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of WeatherState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WeatherForecastCopyWith<$Res>? get weatherForecast {
    if (_self.weatherForecast == null) {
    return null;
  }

  return $WeatherForecastCopyWith<$Res>(_self.weatherForecast!, (value) {
    return _then(_self.copyWith(weatherForecast: value));
  });
}
}

// dart format on
