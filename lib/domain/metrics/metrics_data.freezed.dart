// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'metrics_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MetricsData {

 int get id; int get streakDays; double get dailyGoalInMinutes;
/// Create a copy of MetricsData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MetricsDataCopyWith<MetricsData> get copyWith => _$MetricsDataCopyWithImpl<MetricsData>(this as MetricsData, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MetricsData&&(identical(other.id, id) || other.id == id)&&(identical(other.streakDays, streakDays) || other.streakDays == streakDays)&&(identical(other.dailyGoalInMinutes, dailyGoalInMinutes) || other.dailyGoalInMinutes == dailyGoalInMinutes));
}


@override
int get hashCode => Object.hash(runtimeType,id,streakDays,dailyGoalInMinutes);

@override
String toString() {
  return 'MetricsData(id: $id, streakDays: $streakDays, dailyGoalInMinutes: $dailyGoalInMinutes)';
}


}

/// @nodoc
abstract mixin class $MetricsDataCopyWith<$Res>  {
  factory $MetricsDataCopyWith(MetricsData value, $Res Function(MetricsData) _then) = _$MetricsDataCopyWithImpl;
@useResult
$Res call({
 int id, int streakDays, double dailyGoalInMinutes
});




}
/// @nodoc
class _$MetricsDataCopyWithImpl<$Res>
    implements $MetricsDataCopyWith<$Res> {
  _$MetricsDataCopyWithImpl(this._self, this._then);

  final MetricsData _self;
  final $Res Function(MetricsData) _then;

/// Create a copy of MetricsData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? streakDays = null,Object? dailyGoalInMinutes = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,streakDays: null == streakDays ? _self.streakDays : streakDays // ignore: cast_nullable_to_non_nullable
as int,dailyGoalInMinutes: null == dailyGoalInMinutes ? _self.dailyGoalInMinutes : dailyGoalInMinutes // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [MetricsData].
extension MetricsDataPatterns on MetricsData {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MetricsData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MetricsData() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MetricsData value)  $default,){
final _that = this;
switch (_that) {
case _MetricsData():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MetricsData value)?  $default,){
final _that = this;
switch (_that) {
case _MetricsData() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int streakDays,  double dailyGoalInMinutes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MetricsData() when $default != null:
return $default(_that.id,_that.streakDays,_that.dailyGoalInMinutes);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int streakDays,  double dailyGoalInMinutes)  $default,) {final _that = this;
switch (_that) {
case _MetricsData():
return $default(_that.id,_that.streakDays,_that.dailyGoalInMinutes);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int streakDays,  double dailyGoalInMinutes)?  $default,) {final _that = this;
switch (_that) {
case _MetricsData() when $default != null:
return $default(_that.id,_that.streakDays,_that.dailyGoalInMinutes);case _:
  return null;

}
}

}

/// @nodoc


class _MetricsData implements MetricsData {
  const _MetricsData({required this.id, required this.streakDays, required this.dailyGoalInMinutes});
  

@override final  int id;
@override final  int streakDays;
@override final  double dailyGoalInMinutes;

/// Create a copy of MetricsData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MetricsDataCopyWith<_MetricsData> get copyWith => __$MetricsDataCopyWithImpl<_MetricsData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MetricsData&&(identical(other.id, id) || other.id == id)&&(identical(other.streakDays, streakDays) || other.streakDays == streakDays)&&(identical(other.dailyGoalInMinutes, dailyGoalInMinutes) || other.dailyGoalInMinutes == dailyGoalInMinutes));
}


@override
int get hashCode => Object.hash(runtimeType,id,streakDays,dailyGoalInMinutes);

@override
String toString() {
  return 'MetricsData(id: $id, streakDays: $streakDays, dailyGoalInMinutes: $dailyGoalInMinutes)';
}


}

/// @nodoc
abstract mixin class _$MetricsDataCopyWith<$Res> implements $MetricsDataCopyWith<$Res> {
  factory _$MetricsDataCopyWith(_MetricsData value, $Res Function(_MetricsData) _then) = __$MetricsDataCopyWithImpl;
@override @useResult
$Res call({
 int id, int streakDays, double dailyGoalInMinutes
});




}
/// @nodoc
class __$MetricsDataCopyWithImpl<$Res>
    implements _$MetricsDataCopyWith<$Res> {
  __$MetricsDataCopyWithImpl(this._self, this._then);

  final _MetricsData _self;
  final $Res Function(_MetricsData) _then;

/// Create a copy of MetricsData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? streakDays = null,Object? dailyGoalInMinutes = null,}) {
  return _then(_MetricsData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,streakDays: null == streakDays ? _self.streakDays : streakDays // ignore: cast_nullable_to_non_nullable
as int,dailyGoalInMinutes: null == dailyGoalInMinutes ? _self.dailyGoalInMinutes : dailyGoalInMinutes // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
