// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'metronome_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MetronomeEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MetronomeEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MetronomeEvent()';
}


}

/// @nodoc
class $MetronomeEventCopyWith<$Res>  {
$MetronomeEventCopyWith(MetronomeEvent _, $Res Function(MetronomeEvent) __);
}


/// Adds pattern-matching-related methods to [MetronomeEvent].
extension MetronomeEventPatterns on MetronomeEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initialize value)?  initialize,TResult Function( _Start value)?  start,TResult Function( _SetBpm value)?  setBpm,TResult Function( _Stop value)?  stop,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initialize() when initialize != null:
return initialize(_that);case _Start() when start != null:
return start(_that);case _SetBpm() when setBpm != null:
return setBpm(_that);case _Stop() when stop != null:
return stop(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initialize value)  initialize,required TResult Function( _Start value)  start,required TResult Function( _SetBpm value)  setBpm,required TResult Function( _Stop value)  stop,}){
final _that = this;
switch (_that) {
case _Initialize():
return initialize(_that);case _Start():
return start(_that);case _SetBpm():
return setBpm(_that);case _Stop():
return stop(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initialize value)?  initialize,TResult? Function( _Start value)?  start,TResult? Function( _SetBpm value)?  setBpm,TResult? Function( _Stop value)?  stop,}){
final _that = this;
switch (_that) {
case _Initialize() when initialize != null:
return initialize(_that);case _Start() when start != null:
return start(_that);case _SetBpm() when setBpm != null:
return setBpm(_that);case _Stop() when stop != null:
return stop(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initialize,TResult Function()?  start,TResult Function( int newBpm)?  setBpm,TResult Function()?  stop,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initialize() when initialize != null:
return initialize();case _Start() when start != null:
return start();case _SetBpm() when setBpm != null:
return setBpm(_that.newBpm);case _Stop() when stop != null:
return stop();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initialize,required TResult Function()  start,required TResult Function( int newBpm)  setBpm,required TResult Function()  stop,}) {final _that = this;
switch (_that) {
case _Initialize():
return initialize();case _Start():
return start();case _SetBpm():
return setBpm(_that.newBpm);case _Stop():
return stop();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initialize,TResult? Function()?  start,TResult? Function( int newBpm)?  setBpm,TResult? Function()?  stop,}) {final _that = this;
switch (_that) {
case _Initialize() when initialize != null:
return initialize();case _Start() when start != null:
return start();case _SetBpm() when setBpm != null:
return setBpm(_that.newBpm);case _Stop() when stop != null:
return stop();case _:
  return null;

}
}

}

/// @nodoc


class _Initialize implements MetronomeEvent {
  const _Initialize();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initialize);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MetronomeEvent.initialize()';
}


}




/// @nodoc


class _Start implements MetronomeEvent {
  const _Start();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Start);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MetronomeEvent.start()';
}


}




/// @nodoc


class _SetBpm implements MetronomeEvent {
  const _SetBpm({required this.newBpm});
  

 final  int newBpm;

/// Create a copy of MetronomeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetBpmCopyWith<_SetBpm> get copyWith => __$SetBpmCopyWithImpl<_SetBpm>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetBpm&&(identical(other.newBpm, newBpm) || other.newBpm == newBpm));
}


@override
int get hashCode => Object.hash(runtimeType,newBpm);

@override
String toString() {
  return 'MetronomeEvent.setBpm(newBpm: $newBpm)';
}


}

/// @nodoc
abstract mixin class _$SetBpmCopyWith<$Res> implements $MetronomeEventCopyWith<$Res> {
  factory _$SetBpmCopyWith(_SetBpm value, $Res Function(_SetBpm) _then) = __$SetBpmCopyWithImpl;
@useResult
$Res call({
 int newBpm
});




}
/// @nodoc
class __$SetBpmCopyWithImpl<$Res>
    implements _$SetBpmCopyWith<$Res> {
  __$SetBpmCopyWithImpl(this._self, this._then);

  final _SetBpm _self;
  final $Res Function(_SetBpm) _then;

/// Create a copy of MetronomeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? newBpm = null,}) {
  return _then(_SetBpm(
newBpm: null == newBpm ? _self.newBpm : newBpm // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _Stop implements MetronomeEvent {
  const _Stop();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Stop);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MetronomeEvent.stop()';
}


}




/// @nodoc
mixin _$MetronomeState {

 int get beatCount; int get bpm;
/// Create a copy of MetronomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MetronomeStateCopyWith<MetronomeState> get copyWith => _$MetronomeStateCopyWithImpl<MetronomeState>(this as MetronomeState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MetronomeState&&(identical(other.beatCount, beatCount) || other.beatCount == beatCount)&&(identical(other.bpm, bpm) || other.bpm == bpm));
}


@override
int get hashCode => Object.hash(runtimeType,beatCount,bpm);

@override
String toString() {
  return 'MetronomeState(beatCount: $beatCount, bpm: $bpm)';
}


}

/// @nodoc
abstract mixin class $MetronomeStateCopyWith<$Res>  {
  factory $MetronomeStateCopyWith(MetronomeState value, $Res Function(MetronomeState) _then) = _$MetronomeStateCopyWithImpl;
@useResult
$Res call({
 int beatCount, int bpm
});




}
/// @nodoc
class _$MetronomeStateCopyWithImpl<$Res>
    implements $MetronomeStateCopyWith<$Res> {
  _$MetronomeStateCopyWithImpl(this._self, this._then);

  final MetronomeState _self;
  final $Res Function(MetronomeState) _then;

/// Create a copy of MetronomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? beatCount = null,Object? bpm = null,}) {
  return _then(_self.copyWith(
beatCount: null == beatCount ? _self.beatCount : beatCount // ignore: cast_nullable_to_non_nullable
as int,bpm: null == bpm ? _self.bpm : bpm // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [MetronomeState].
extension MetronomeStatePatterns on MetronomeState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MetronomeState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MetronomeState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MetronomeState value)  $default,){
final _that = this;
switch (_that) {
case _MetronomeState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MetronomeState value)?  $default,){
final _that = this;
switch (_that) {
case _MetronomeState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int beatCount,  int bpm)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MetronomeState() when $default != null:
return $default(_that.beatCount,_that.bpm);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int beatCount,  int bpm)  $default,) {final _that = this;
switch (_that) {
case _MetronomeState():
return $default(_that.beatCount,_that.bpm);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int beatCount,  int bpm)?  $default,) {final _that = this;
switch (_that) {
case _MetronomeState() when $default != null:
return $default(_that.beatCount,_that.bpm);case _:
  return null;

}
}

}

/// @nodoc


class _MetronomeState implements MetronomeState {
  const _MetronomeState({required this.beatCount, required this.bpm});
  

@override final  int beatCount;
@override final  int bpm;

/// Create a copy of MetronomeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MetronomeStateCopyWith<_MetronomeState> get copyWith => __$MetronomeStateCopyWithImpl<_MetronomeState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MetronomeState&&(identical(other.beatCount, beatCount) || other.beatCount == beatCount)&&(identical(other.bpm, bpm) || other.bpm == bpm));
}


@override
int get hashCode => Object.hash(runtimeType,beatCount,bpm);

@override
String toString() {
  return 'MetronomeState(beatCount: $beatCount, bpm: $bpm)';
}


}

/// @nodoc
abstract mixin class _$MetronomeStateCopyWith<$Res> implements $MetronomeStateCopyWith<$Res> {
  factory _$MetronomeStateCopyWith(_MetronomeState value, $Res Function(_MetronomeState) _then) = __$MetronomeStateCopyWithImpl;
@override @useResult
$Res call({
 int beatCount, int bpm
});




}
/// @nodoc
class __$MetronomeStateCopyWithImpl<$Res>
    implements _$MetronomeStateCopyWith<$Res> {
  __$MetronomeStateCopyWithImpl(this._self, this._then);

  final _MetronomeState _self;
  final $Res Function(_MetronomeState) _then;

/// Create a copy of MetronomeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? beatCount = null,Object? bpm = null,}) {
  return _then(_MetronomeState(
beatCount: null == beatCount ? _self.beatCount : beatCount // ignore: cast_nullable_to_non_nullable
as int,bpm: null == bpm ? _self.bpm : bpm // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
