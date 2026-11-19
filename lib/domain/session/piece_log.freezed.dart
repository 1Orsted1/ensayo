// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'piece_log.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PieceLogInput {

 int get minutes; PieceMood? get mood; int? get tempoBpm; String? get note;
/// Create a copy of PieceLogInput
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PieceLogInputCopyWith<PieceLogInput> get copyWith => _$PieceLogInputCopyWithImpl<PieceLogInput>(this as PieceLogInput, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PieceLogInput&&(identical(other.minutes, minutes) || other.minutes == minutes)&&(identical(other.mood, mood) || other.mood == mood)&&(identical(other.tempoBpm, tempoBpm) || other.tempoBpm == tempoBpm)&&(identical(other.note, note) || other.note == note));
}


@override
int get hashCode => Object.hash(runtimeType,minutes,mood,tempoBpm,note);

@override
String toString() {
  return 'PieceLogInput(minutes: $minutes, mood: $mood, tempoBpm: $tempoBpm, note: $note)';
}


}

/// @nodoc
abstract mixin class $PieceLogInputCopyWith<$Res>  {
  factory $PieceLogInputCopyWith(PieceLogInput value, $Res Function(PieceLogInput) _then) = _$PieceLogInputCopyWithImpl;
@useResult
$Res call({
 int minutes, PieceMood? mood, int? tempoBpm, String? note
});




}
/// @nodoc
class _$PieceLogInputCopyWithImpl<$Res>
    implements $PieceLogInputCopyWith<$Res> {
  _$PieceLogInputCopyWithImpl(this._self, this._then);

  final PieceLogInput _self;
  final $Res Function(PieceLogInput) _then;

/// Create a copy of PieceLogInput
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? minutes = null,Object? mood = freezed,Object? tempoBpm = freezed,Object? note = freezed,}) {
  return _then(_self.copyWith(
minutes: null == minutes ? _self.minutes : minutes // ignore: cast_nullable_to_non_nullable
as int,mood: freezed == mood ? _self.mood : mood // ignore: cast_nullable_to_non_nullable
as PieceMood?,tempoBpm: freezed == tempoBpm ? _self.tempoBpm : tempoBpm // ignore: cast_nullable_to_non_nullable
as int?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PieceLogInput].
extension PieceLogInputPatterns on PieceLogInput {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PieceLogInput value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PieceLogInput() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PieceLogInput value)  $default,){
final _that = this;
switch (_that) {
case _PieceLogInput():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PieceLogInput value)?  $default,){
final _that = this;
switch (_that) {
case _PieceLogInput() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int minutes,  PieceMood? mood,  int? tempoBpm,  String? note)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PieceLogInput() when $default != null:
return $default(_that.minutes,_that.mood,_that.tempoBpm,_that.note);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int minutes,  PieceMood? mood,  int? tempoBpm,  String? note)  $default,) {final _that = this;
switch (_that) {
case _PieceLogInput():
return $default(_that.minutes,_that.mood,_that.tempoBpm,_that.note);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int minutes,  PieceMood? mood,  int? tempoBpm,  String? note)?  $default,) {final _that = this;
switch (_that) {
case _PieceLogInput() when $default != null:
return $default(_that.minutes,_that.mood,_that.tempoBpm,_that.note);case _:
  return null;

}
}

}

/// @nodoc


class _PieceLogInput implements PieceLogInput {
  const _PieceLogInput({required this.minutes, this.mood, this.tempoBpm, this.note});
  

@override final  int minutes;
@override final  PieceMood? mood;
@override final  int? tempoBpm;
@override final  String? note;

/// Create a copy of PieceLogInput
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PieceLogInputCopyWith<_PieceLogInput> get copyWith => __$PieceLogInputCopyWithImpl<_PieceLogInput>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PieceLogInput&&(identical(other.minutes, minutes) || other.minutes == minutes)&&(identical(other.mood, mood) || other.mood == mood)&&(identical(other.tempoBpm, tempoBpm) || other.tempoBpm == tempoBpm)&&(identical(other.note, note) || other.note == note));
}


@override
int get hashCode => Object.hash(runtimeType,minutes,mood,tempoBpm,note);

@override
String toString() {
  return 'PieceLogInput(minutes: $minutes, mood: $mood, tempoBpm: $tempoBpm, note: $note)';
}


}

/// @nodoc
abstract mixin class _$PieceLogInputCopyWith<$Res> implements $PieceLogInputCopyWith<$Res> {
  factory _$PieceLogInputCopyWith(_PieceLogInput value, $Res Function(_PieceLogInput) _then) = __$PieceLogInputCopyWithImpl;
@override @useResult
$Res call({
 int minutes, PieceMood? mood, int? tempoBpm, String? note
});




}
/// @nodoc
class __$PieceLogInputCopyWithImpl<$Res>
    implements _$PieceLogInputCopyWith<$Res> {
  __$PieceLogInputCopyWithImpl(this._self, this._then);

  final _PieceLogInput _self;
  final $Res Function(_PieceLogInput) _then;

/// Create a copy of PieceLogInput
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? minutes = null,Object? mood = freezed,Object? tempoBpm = freezed,Object? note = freezed,}) {
  return _then(_PieceLogInput(
minutes: null == minutes ? _self.minutes : minutes // ignore: cast_nullable_to_non_nullable
as int,mood: freezed == mood ? _self.mood : mood // ignore: cast_nullable_to_non_nullable
as PieceMood?,tempoBpm: freezed == tempoBpm ? _self.tempoBpm : tempoBpm // ignore: cast_nullable_to_non_nullable
as int?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$PieceLog {

 int get sessionId; int? get songId; String get pieceTitle; int get minutes; PieceMood? get mood; int? get tempoBpm; String? get note; DateTime get loggedAt;
/// Create a copy of PieceLog
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PieceLogCopyWith<PieceLog> get copyWith => _$PieceLogCopyWithImpl<PieceLog>(this as PieceLog, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PieceLog&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.songId, songId) || other.songId == songId)&&(identical(other.pieceTitle, pieceTitle) || other.pieceTitle == pieceTitle)&&(identical(other.minutes, minutes) || other.minutes == minutes)&&(identical(other.mood, mood) || other.mood == mood)&&(identical(other.tempoBpm, tempoBpm) || other.tempoBpm == tempoBpm)&&(identical(other.note, note) || other.note == note)&&(identical(other.loggedAt, loggedAt) || other.loggedAt == loggedAt));
}


@override
int get hashCode => Object.hash(runtimeType,sessionId,songId,pieceTitle,minutes,mood,tempoBpm,note,loggedAt);

@override
String toString() {
  return 'PieceLog(sessionId: $sessionId, songId: $songId, pieceTitle: $pieceTitle, minutes: $minutes, mood: $mood, tempoBpm: $tempoBpm, note: $note, loggedAt: $loggedAt)';
}


}

/// @nodoc
abstract mixin class $PieceLogCopyWith<$Res>  {
  factory $PieceLogCopyWith(PieceLog value, $Res Function(PieceLog) _then) = _$PieceLogCopyWithImpl;
@useResult
$Res call({
 int sessionId, int? songId, String pieceTitle, int minutes, PieceMood? mood, int? tempoBpm, String? note, DateTime loggedAt
});




}
/// @nodoc
class _$PieceLogCopyWithImpl<$Res>
    implements $PieceLogCopyWith<$Res> {
  _$PieceLogCopyWithImpl(this._self, this._then);

  final PieceLog _self;
  final $Res Function(PieceLog) _then;

/// Create a copy of PieceLog
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sessionId = null,Object? songId = freezed,Object? pieceTitle = null,Object? minutes = null,Object? mood = freezed,Object? tempoBpm = freezed,Object? note = freezed,Object? loggedAt = null,}) {
  return _then(_self.copyWith(
sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as int,songId: freezed == songId ? _self.songId : songId // ignore: cast_nullable_to_non_nullable
as int?,pieceTitle: null == pieceTitle ? _self.pieceTitle : pieceTitle // ignore: cast_nullable_to_non_nullable
as String,minutes: null == minutes ? _self.minutes : minutes // ignore: cast_nullable_to_non_nullable
as int,mood: freezed == mood ? _self.mood : mood // ignore: cast_nullable_to_non_nullable
as PieceMood?,tempoBpm: freezed == tempoBpm ? _self.tempoBpm : tempoBpm // ignore: cast_nullable_to_non_nullable
as int?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,loggedAt: null == loggedAt ? _self.loggedAt : loggedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [PieceLog].
extension PieceLogPatterns on PieceLog {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PieceLog value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PieceLog() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PieceLog value)  $default,){
final _that = this;
switch (_that) {
case _PieceLog():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PieceLog value)?  $default,){
final _that = this;
switch (_that) {
case _PieceLog() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int sessionId,  int? songId,  String pieceTitle,  int minutes,  PieceMood? mood,  int? tempoBpm,  String? note,  DateTime loggedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PieceLog() when $default != null:
return $default(_that.sessionId,_that.songId,_that.pieceTitle,_that.minutes,_that.mood,_that.tempoBpm,_that.note,_that.loggedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int sessionId,  int? songId,  String pieceTitle,  int minutes,  PieceMood? mood,  int? tempoBpm,  String? note,  DateTime loggedAt)  $default,) {final _that = this;
switch (_that) {
case _PieceLog():
return $default(_that.sessionId,_that.songId,_that.pieceTitle,_that.minutes,_that.mood,_that.tempoBpm,_that.note,_that.loggedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int sessionId,  int? songId,  String pieceTitle,  int minutes,  PieceMood? mood,  int? tempoBpm,  String? note,  DateTime loggedAt)?  $default,) {final _that = this;
switch (_that) {
case _PieceLog() when $default != null:
return $default(_that.sessionId,_that.songId,_that.pieceTitle,_that.minutes,_that.mood,_that.tempoBpm,_that.note,_that.loggedAt);case _:
  return null;

}
}

}

/// @nodoc


class _PieceLog implements PieceLog {
  const _PieceLog({required this.sessionId, this.songId, required this.pieceTitle, required this.minutes, this.mood, this.tempoBpm, this.note, required this.loggedAt});
  

@override final  int sessionId;
@override final  int? songId;
@override final  String pieceTitle;
@override final  int minutes;
@override final  PieceMood? mood;
@override final  int? tempoBpm;
@override final  String? note;
@override final  DateTime loggedAt;

/// Create a copy of PieceLog
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PieceLogCopyWith<_PieceLog> get copyWith => __$PieceLogCopyWithImpl<_PieceLog>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PieceLog&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.songId, songId) || other.songId == songId)&&(identical(other.pieceTitle, pieceTitle) || other.pieceTitle == pieceTitle)&&(identical(other.minutes, minutes) || other.minutes == minutes)&&(identical(other.mood, mood) || other.mood == mood)&&(identical(other.tempoBpm, tempoBpm) || other.tempoBpm == tempoBpm)&&(identical(other.note, note) || other.note == note)&&(identical(other.loggedAt, loggedAt) || other.loggedAt == loggedAt));
}


@override
int get hashCode => Object.hash(runtimeType,sessionId,songId,pieceTitle,minutes,mood,tempoBpm,note,loggedAt);

@override
String toString() {
  return 'PieceLog(sessionId: $sessionId, songId: $songId, pieceTitle: $pieceTitle, minutes: $minutes, mood: $mood, tempoBpm: $tempoBpm, note: $note, loggedAt: $loggedAt)';
}


}

/// @nodoc
abstract mixin class _$PieceLogCopyWith<$Res> implements $PieceLogCopyWith<$Res> {
  factory _$PieceLogCopyWith(_PieceLog value, $Res Function(_PieceLog) _then) = __$PieceLogCopyWithImpl;
@override @useResult
$Res call({
 int sessionId, int? songId, String pieceTitle, int minutes, PieceMood? mood, int? tempoBpm, String? note, DateTime loggedAt
});




}
/// @nodoc
class __$PieceLogCopyWithImpl<$Res>
    implements _$PieceLogCopyWith<$Res> {
  __$PieceLogCopyWithImpl(this._self, this._then);

  final _PieceLog _self;
  final $Res Function(_PieceLog) _then;

/// Create a copy of PieceLog
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sessionId = null,Object? songId = freezed,Object? pieceTitle = null,Object? minutes = null,Object? mood = freezed,Object? tempoBpm = freezed,Object? note = freezed,Object? loggedAt = null,}) {
  return _then(_PieceLog(
sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as int,songId: freezed == songId ? _self.songId : songId // ignore: cast_nullable_to_non_nullable
as int?,pieceTitle: null == pieceTitle ? _self.pieceTitle : pieceTitle // ignore: cast_nullable_to_non_nullable
as String,minutes: null == minutes ? _self.minutes : minutes // ignore: cast_nullable_to_non_nullable
as int,mood: freezed == mood ? _self.mood : mood // ignore: cast_nullable_to_non_nullable
as PieceMood?,tempoBpm: freezed == tempoBpm ? _self.tempoBpm : tempoBpm // ignore: cast_nullable_to_non_nullable
as int?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,loggedAt: null == loggedAt ? _self.loggedAt : loggedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
