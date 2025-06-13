// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'yumemi_weather_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$YumemiWeatherRequest {

 String get area; DateTime get date;
/// Create a copy of YumemiWeatherRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$YumemiWeatherRequestCopyWith<YumemiWeatherRequest> get copyWith => _$YumemiWeatherRequestCopyWithImpl<YumemiWeatherRequest>(this as YumemiWeatherRequest, _$identity);

  /// Serializes this YumemiWeatherRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is YumemiWeatherRequest&&(identical(other.area, area) || other.area == area)&&(identical(other.date, date) || other.date == date));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,area,date);

@override
String toString() {
  return 'YumemiWeatherRequest(area: $area, date: $date)';
}


}

/// @nodoc
abstract mixin class $YumemiWeatherRequestCopyWith<$Res>  {
  factory $YumemiWeatherRequestCopyWith(YumemiWeatherRequest value, $Res Function(YumemiWeatherRequest) _then) = _$YumemiWeatherRequestCopyWithImpl;
@useResult
$Res call({
 String area, DateTime date
});




}
/// @nodoc
class _$YumemiWeatherRequestCopyWithImpl<$Res>
    implements $YumemiWeatherRequestCopyWith<$Res> {
  _$YumemiWeatherRequestCopyWithImpl(this._self, this._then);

  final YumemiWeatherRequest _self;
  final $Res Function(YumemiWeatherRequest) _then;

/// Create a copy of YumemiWeatherRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? area = null,Object? date = null,}) {
  return _then(_self.copyWith(
area: null == area ? _self.area : area // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// @nodoc
@JsonSerializable(createFactory: false)

class _YumemiWeatherRequest implements YumemiWeatherRequest {
  const _YumemiWeatherRequest({required this.area, required this.date});
  

@override final  String area;
@override final  DateTime date;

/// Create a copy of YumemiWeatherRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$YumemiWeatherRequestCopyWith<_YumemiWeatherRequest> get copyWith => __$YumemiWeatherRequestCopyWithImpl<_YumemiWeatherRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$YumemiWeatherRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _YumemiWeatherRequest&&(identical(other.area, area) || other.area == area)&&(identical(other.date, date) || other.date == date));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,area,date);

@override
String toString() {
  return 'YumemiWeatherRequest(area: $area, date: $date)';
}


}

/// @nodoc
abstract mixin class _$YumemiWeatherRequestCopyWith<$Res> implements $YumemiWeatherRequestCopyWith<$Res> {
  factory _$YumemiWeatherRequestCopyWith(_YumemiWeatherRequest value, $Res Function(_YumemiWeatherRequest) _then) = __$YumemiWeatherRequestCopyWithImpl;
@override @useResult
$Res call({
 String area, DateTime date
});




}
/// @nodoc
class __$YumemiWeatherRequestCopyWithImpl<$Res>
    implements _$YumemiWeatherRequestCopyWith<$Res> {
  __$YumemiWeatherRequestCopyWithImpl(this._self, this._then);

  final _YumemiWeatherRequest _self;
  final $Res Function(_YumemiWeatherRequest) _then;

/// Create a copy of YumemiWeatherRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? area = null,Object? date = null,}) {
  return _then(_YumemiWeatherRequest(
area: null == area ? _self.area : area // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
