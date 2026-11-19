// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'practice_session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PracticeSession {

 int get id; DateTime get startedAt; DateTime? get endedAt; Set<int> get loggedSongIds; int get completedCount; DateTime? get lastLoggedAt;
/// Create a copy of PracticeSession
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PracticeSessionCopyWith<PracticeSession> get copyWith => _$PracticeSessionCopyWithImpl<PracticeSession>(this as PracticeSession, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PracticeSession&&(identical(other.id, id) || other.id == id)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.endedAt, endedAt) || other.endedAt == endedAt)&&const DeepCollectionEquality().equals(other.loggedSongIds, loggedSongIds)&&(identical(other.completedCount, completedCount) || other.completedCount == completedCount)&&(identical(other.lastLoggedAt, lastLoggedAt) || other.lastLoggedAt == lastLoggedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,startedAt,endedAt,const DeepCollectionEquality().hash(loggedSongIds),completedCount,lastLoggedAt);

@override
String toString() {
  return 'PracticeSession(id: $id, startedAt: $startedAt, endedAt: $endedAt, loggedSongIds: $loggedSongIds, completedCount: $completedCount, lastLoggedAt: $lastLoggedAt)';
}


}

/// @nodoc
abstract mixin class $PracticeSessionCopyWith<$Res>  {
  factory $PracticeSessionCopyWith(PracticeSession value, $Res Function(PracticeSession) _then) = _$PracticeSessionCopyWithImpl;
@useResult
$Res call({
 int id, DateTime startedAt, DateTime? endedAt, Set<int> loggedSongIds, int completedCount, DateTime? lastLoggedAt
});




}
/// @nodoc
class _$PracticeSessionCopyWithImpl<$Res>
    implements $PracticeSessionCopyWith<$Res> {
  _$PracticeSessionCopyWithImpl(this._self, this._then);

  final PracticeSession _self;
  final $Res Function(PracticeSession) _then;

/// Create a copy of PracticeSession
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? startedAt = null,Object? endedAt = freezed,Object? loggedSongIds = null,Object? completedCount = null,Object? lastLoggedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,startedAt: null == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime,endedAt: freezed == endedAt ? _self.endedAt : endedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,loggedSongIds: null == loggedSongIds ? _self.loggedSongIds : loggedSongIds // ignore: cast_nullable_to_non_nullable
as Set<int>,completedCount: null == completedCount ? _self.completedCount : completedCount // ignore: cast_nullable_to_non_nullable
as int,lastLoggedAt: freezed == lastLoggedAt ? _self.lastLoggedAt : lastLoggedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [PracticeSession].
extension PracticeSessionPatterns on PracticeSession {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PracticeSession value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PracticeSession() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PracticeSession value)  $default,){
final _that = this;
switch (_that) {
case _PracticeSession():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PracticeSession value)?  $default,){
final _that = this;
switch (_that) {
case _PracticeSession() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  DateTime startedAt,  DateTime? endedAt,  Set<int> loggedSongIds,  int completedCount,  DateTime? lastLoggedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PracticeSession() when $default != null:
return $default(_that.id,_that.startedAt,_that.endedAt,_that.loggedSongIds,_that.completedCount,_that.lastLoggedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  DateTime startedAt,  DateTime? endedAt,  Set<int> loggedSongIds,  int completedCount,  DateTime? lastLoggedAt)  $default,) {final _that = this;
switch (_that) {
case _PracticeSession():
return $default(_that.id,_that.startedAt,_that.endedAt,_that.loggedSongIds,_that.completedCount,_that.lastLoggedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  DateTime startedAt,  DateTime? endedAt,  Set<int> loggedSongIds,  int completedCount,  DateTime? lastLoggedAt)?  $default,) {final _that = this;
switch (_that) {
case _PracticeSession() when $default != null:
return $default(_that.id,_that.startedAt,_that.endedAt,_that.loggedSongIds,_that.completedCount,_that.lastLoggedAt);case _:
  return null;

}
}

}

/// @nodoc


class _PracticeSession implements PracticeSession {
  const _PracticeSession({required this.id, required this.startedAt, this.endedAt, final  Set<int> loggedSongIds = const <int>{}, this.completedCount = 0, this.lastLoggedAt}): _loggedSongIds = loggedSongIds;
  

@override final  int id;
@override final  DateTime startedAt;
@override final  DateTime? endedAt;
 final  Set<int> _loggedSongIds;
@override@JsonKey() Set<int> get loggedSongIds {
  if (_loggedSongIds is EqualUnmodifiableSetView) return _loggedSongIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_loggedSongIds);
}

@override@JsonKey() final  int completedCount;
@override final  DateTime? lastLoggedAt;

/// Create a copy of PracticeSession
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PracticeSessionCopyWith<_PracticeSession> get copyWith => __$PracticeSessionCopyWithImpl<_PracticeSession>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PracticeSession&&(identical(other.id, id) || other.id == id)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.endedAt, endedAt) || other.endedAt == endedAt)&&const DeepCollectionEquality().equals(other._loggedSongIds, _loggedSongIds)&&(identical(other.completedCount, completedCount) || other.completedCount == completedCount)&&(identical(other.lastLoggedAt, lastLoggedAt) || other.lastLoggedAt == lastLoggedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,startedAt,endedAt,const DeepCollectionEquality().hash(_loggedSongIds),completedCount,lastLoggedAt);

@override
String toString() {
  return 'PracticeSession(id: $id, startedAt: $startedAt, endedAt: $endedAt, loggedSongIds: $loggedSongIds, completedCount: $completedCount, lastLoggedAt: $lastLoggedAt)';
}


}

/// @nodoc
abstract mixin class _$PracticeSessionCopyWith<$Res> implements $PracticeSessionCopyWith<$Res> {
  factory _$PracticeSessionCopyWith(_PracticeSession value, $Res Function(_PracticeSession) _then) = __$PracticeSessionCopyWithImpl;
@override @useResult
$Res call({
 int id, DateTime startedAt, DateTime? endedAt, Set<int> loggedSongIds, int completedCount, DateTime? lastLoggedAt
});




}
/// @nodoc
class __$PracticeSessionCopyWithImpl<$Res>
    implements _$PracticeSessionCopyWith<$Res> {
  __$PracticeSessionCopyWithImpl(this._self, this._then);

  final _PracticeSession _self;
  final $Res Function(_PracticeSession) _then;

/// Create a copy of PracticeSession
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? startedAt = null,Object? endedAt = freezed,Object? loggedSongIds = null,Object? completedCount = null,Object? lastLoggedAt = freezed,}) {
  return _then(_PracticeSession(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,startedAt: null == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime,endedAt: freezed == endedAt ? _self.endedAt : endedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,loggedSongIds: null == loggedSongIds ? _self._loggedSongIds : loggedSongIds // ignore: cast_nullable_to_non_nullable
as Set<int>,completedCount: null == completedCount ? _self.completedCount : completedCount // ignore: cast_nullable_to_non_nullable
as int,lastLoggedAt: freezed == lastLoggedAt ? _self.lastLoggedAt : lastLoggedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
