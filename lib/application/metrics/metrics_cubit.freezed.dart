// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'metrics_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MetricsState {

 int? get metricsId; int get goalMinutes; int get streakDays; int get todayMinutes; MetricsLoadStatus get loadStatus; GoalSaveStatus get goalSaveStatus;
/// Create a copy of MetricsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MetricsStateCopyWith<MetricsState> get copyWith => _$MetricsStateCopyWithImpl<MetricsState>(this as MetricsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MetricsState&&(identical(other.metricsId, metricsId) || other.metricsId == metricsId)&&(identical(other.goalMinutes, goalMinutes) || other.goalMinutes == goalMinutes)&&(identical(other.streakDays, streakDays) || other.streakDays == streakDays)&&(identical(other.todayMinutes, todayMinutes) || other.todayMinutes == todayMinutes)&&(identical(other.loadStatus, loadStatus) || other.loadStatus == loadStatus)&&(identical(other.goalSaveStatus, goalSaveStatus) || other.goalSaveStatus == goalSaveStatus));
}


@override
int get hashCode => Object.hash(runtimeType,metricsId,goalMinutes,streakDays,todayMinutes,loadStatus,goalSaveStatus);

@override
String toString() {
  return 'MetricsState(metricsId: $metricsId, goalMinutes: $goalMinutes, streakDays: $streakDays, todayMinutes: $todayMinutes, loadStatus: $loadStatus, goalSaveStatus: $goalSaveStatus)';
}


}

/// @nodoc
abstract mixin class $MetricsStateCopyWith<$Res>  {
  factory $MetricsStateCopyWith(MetricsState value, $Res Function(MetricsState) _then) = _$MetricsStateCopyWithImpl;
@useResult
$Res call({
 int? metricsId, int goalMinutes, int streakDays, int todayMinutes, MetricsLoadStatus loadStatus, GoalSaveStatus goalSaveStatus
});




}
/// @nodoc
class _$MetricsStateCopyWithImpl<$Res>
    implements $MetricsStateCopyWith<$Res> {
  _$MetricsStateCopyWithImpl(this._self, this._then);

  final MetricsState _self;
  final $Res Function(MetricsState) _then;

/// Create a copy of MetricsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? metricsId = freezed,Object? goalMinutes = null,Object? streakDays = null,Object? todayMinutes = null,Object? loadStatus = null,Object? goalSaveStatus = null,}) {
  return _then(_self.copyWith(
metricsId: freezed == metricsId ? _self.metricsId : metricsId // ignore: cast_nullable_to_non_nullable
as int?,goalMinutes: null == goalMinutes ? _self.goalMinutes : goalMinutes // ignore: cast_nullable_to_non_nullable
as int,streakDays: null == streakDays ? _self.streakDays : streakDays // ignore: cast_nullable_to_non_nullable
as int,todayMinutes: null == todayMinutes ? _self.todayMinutes : todayMinutes // ignore: cast_nullable_to_non_nullable
as int,loadStatus: null == loadStatus ? _self.loadStatus : loadStatus // ignore: cast_nullable_to_non_nullable
as MetricsLoadStatus,goalSaveStatus: null == goalSaveStatus ? _self.goalSaveStatus : goalSaveStatus // ignore: cast_nullable_to_non_nullable
as GoalSaveStatus,
  ));
}

}


/// Adds pattern-matching-related methods to [MetricsState].
extension MetricsStatePatterns on MetricsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MetricsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MetricsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MetricsState value)  $default,){
final _that = this;
switch (_that) {
case _MetricsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MetricsState value)?  $default,){
final _that = this;
switch (_that) {
case _MetricsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? metricsId,  int goalMinutes,  int streakDays,  int todayMinutes,  MetricsLoadStatus loadStatus,  GoalSaveStatus goalSaveStatus)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MetricsState() when $default != null:
return $default(_that.metricsId,_that.goalMinutes,_that.streakDays,_that.todayMinutes,_that.loadStatus,_that.goalSaveStatus);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? metricsId,  int goalMinutes,  int streakDays,  int todayMinutes,  MetricsLoadStatus loadStatus,  GoalSaveStatus goalSaveStatus)  $default,) {final _that = this;
switch (_that) {
case _MetricsState():
return $default(_that.metricsId,_that.goalMinutes,_that.streakDays,_that.todayMinutes,_that.loadStatus,_that.goalSaveStatus);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? metricsId,  int goalMinutes,  int streakDays,  int todayMinutes,  MetricsLoadStatus loadStatus,  GoalSaveStatus goalSaveStatus)?  $default,) {final _that = this;
switch (_that) {
case _MetricsState() when $default != null:
return $default(_that.metricsId,_that.goalMinutes,_that.streakDays,_that.todayMinutes,_that.loadStatus,_that.goalSaveStatus);case _:
  return null;

}
}

}

/// @nodoc


class _MetricsState implements MetricsState {
  const _MetricsState({this.metricsId, this.goalMinutes = defaultGoal, this.streakDays = 0, this.todayMinutes = 0, this.loadStatus = MetricsLoadStatus.loading, this.goalSaveStatus = GoalSaveStatus.idle});
  

@override final  int? metricsId;
@override@JsonKey() final  int goalMinutes;
@override@JsonKey() final  int streakDays;
@override@JsonKey() final  int todayMinutes;
@override@JsonKey() final  MetricsLoadStatus loadStatus;
@override@JsonKey() final  GoalSaveStatus goalSaveStatus;

/// Create a copy of MetricsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MetricsStateCopyWith<_MetricsState> get copyWith => __$MetricsStateCopyWithImpl<_MetricsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MetricsState&&(identical(other.metricsId, metricsId) || other.metricsId == metricsId)&&(identical(other.goalMinutes, goalMinutes) || other.goalMinutes == goalMinutes)&&(identical(other.streakDays, streakDays) || other.streakDays == streakDays)&&(identical(other.todayMinutes, todayMinutes) || other.todayMinutes == todayMinutes)&&(identical(other.loadStatus, loadStatus) || other.loadStatus == loadStatus)&&(identical(other.goalSaveStatus, goalSaveStatus) || other.goalSaveStatus == goalSaveStatus));
}


@override
int get hashCode => Object.hash(runtimeType,metricsId,goalMinutes,streakDays,todayMinutes,loadStatus,goalSaveStatus);

@override
String toString() {
  return 'MetricsState(metricsId: $metricsId, goalMinutes: $goalMinutes, streakDays: $streakDays, todayMinutes: $todayMinutes, loadStatus: $loadStatus, goalSaveStatus: $goalSaveStatus)';
}


}

/// @nodoc
abstract mixin class _$MetricsStateCopyWith<$Res> implements $MetricsStateCopyWith<$Res> {
  factory _$MetricsStateCopyWith(_MetricsState value, $Res Function(_MetricsState) _then) = __$MetricsStateCopyWithImpl;
@override @useResult
$Res call({
 int? metricsId, int goalMinutes, int streakDays, int todayMinutes, MetricsLoadStatus loadStatus, GoalSaveStatus goalSaveStatus
});




}
/// @nodoc
class __$MetricsStateCopyWithImpl<$Res>
    implements _$MetricsStateCopyWith<$Res> {
  __$MetricsStateCopyWithImpl(this._self, this._then);

  final _MetricsState _self;
  final $Res Function(_MetricsState) _then;

/// Create a copy of MetricsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? metricsId = freezed,Object? goalMinutes = null,Object? streakDays = null,Object? todayMinutes = null,Object? loadStatus = null,Object? goalSaveStatus = null,}) {
  return _then(_MetricsState(
metricsId: freezed == metricsId ? _self.metricsId : metricsId // ignore: cast_nullable_to_non_nullable
as int?,goalMinutes: null == goalMinutes ? _self.goalMinutes : goalMinutes // ignore: cast_nullable_to_non_nullable
as int,streakDays: null == streakDays ? _self.streakDays : streakDays // ignore: cast_nullable_to_non_nullable
as int,todayMinutes: null == todayMinutes ? _self.todayMinutes : todayMinutes // ignore: cast_nullable_to_non_nullable
as int,loadStatus: null == loadStatus ? _self.loadStatus : loadStatus // ignore: cast_nullable_to_non_nullable
as MetricsLoadStatus,goalSaveStatus: null == goalSaveStatus ? _self.goalSaveStatus : goalSaveStatus // ignore: cast_nullable_to_non_nullable
as GoalSaveStatus,
  ));
}


}

// dart format on
