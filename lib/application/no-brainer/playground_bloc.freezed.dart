// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'playground_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PlaygroundEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlaygroundEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PlaygroundEvent()';
}


}

/// @nodoc
class $PlaygroundEventCopyWith<$Res>  {
$PlaygroundEventCopyWith(PlaygroundEvent _, $Res Function(PlaygroundEvent) __);
}


/// Adds pattern-matching-related methods to [PlaygroundEvent].
extension PlaygroundEventPatterns on PlaygroundEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoopImplementationStarted value)?  loopImplementationStarted,TResult Function( TimerImplementationStarted value)?  timerImplementationStarted,TResult Function( SoLoudImplementationStarted value)?  soLoudImplementationStarted,TResult Function( IntervalChanged value)?  intervalChanged,TResult Function( Stopped value)?  stopped,TResult Function( RealDeal value)?  realDeal,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoopImplementationStarted() when loopImplementationStarted != null:
return loopImplementationStarted(_that);case TimerImplementationStarted() when timerImplementationStarted != null:
return timerImplementationStarted(_that);case SoLoudImplementationStarted() when soLoudImplementationStarted != null:
return soLoudImplementationStarted(_that);case IntervalChanged() when intervalChanged != null:
return intervalChanged(_that);case Stopped() when stopped != null:
return stopped(_that);case RealDeal() when realDeal != null:
return realDeal(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoopImplementationStarted value)  loopImplementationStarted,required TResult Function( TimerImplementationStarted value)  timerImplementationStarted,required TResult Function( SoLoudImplementationStarted value)  soLoudImplementationStarted,required TResult Function( IntervalChanged value)  intervalChanged,required TResult Function( Stopped value)  stopped,required TResult Function( RealDeal value)  realDeal,}){
final _that = this;
switch (_that) {
case LoopImplementationStarted():
return loopImplementationStarted(_that);case TimerImplementationStarted():
return timerImplementationStarted(_that);case SoLoudImplementationStarted():
return soLoudImplementationStarted(_that);case IntervalChanged():
return intervalChanged(_that);case Stopped():
return stopped(_that);case RealDeal():
return realDeal(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoopImplementationStarted value)?  loopImplementationStarted,TResult? Function( TimerImplementationStarted value)?  timerImplementationStarted,TResult? Function( SoLoudImplementationStarted value)?  soLoudImplementationStarted,TResult? Function( IntervalChanged value)?  intervalChanged,TResult? Function( Stopped value)?  stopped,TResult? Function( RealDeal value)?  realDeal,}){
final _that = this;
switch (_that) {
case LoopImplementationStarted() when loopImplementationStarted != null:
return loopImplementationStarted(_that);case TimerImplementationStarted() when timerImplementationStarted != null:
return timerImplementationStarted(_that);case SoLoudImplementationStarted() when soLoudImplementationStarted != null:
return soLoudImplementationStarted(_that);case IntervalChanged() when intervalChanged != null:
return intervalChanged(_that);case Stopped() when stopped != null:
return stopped(_that);case RealDeal() when realDeal != null:
return realDeal(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loopImplementationStarted,TResult Function()?  timerImplementationStarted,TResult Function()?  soLoudImplementationStarted,TResult Function( int intervalSeconds)?  intervalChanged,TResult Function()?  stopped,TResult Function()?  realDeal,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoopImplementationStarted() when loopImplementationStarted != null:
return loopImplementationStarted();case TimerImplementationStarted() when timerImplementationStarted != null:
return timerImplementationStarted();case SoLoudImplementationStarted() when soLoudImplementationStarted != null:
return soLoudImplementationStarted();case IntervalChanged() when intervalChanged != null:
return intervalChanged(_that.intervalSeconds);case Stopped() when stopped != null:
return stopped();case RealDeal() when realDeal != null:
return realDeal();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loopImplementationStarted,required TResult Function()  timerImplementationStarted,required TResult Function()  soLoudImplementationStarted,required TResult Function( int intervalSeconds)  intervalChanged,required TResult Function()  stopped,required TResult Function()  realDeal,}) {final _that = this;
switch (_that) {
case LoopImplementationStarted():
return loopImplementationStarted();case TimerImplementationStarted():
return timerImplementationStarted();case SoLoudImplementationStarted():
return soLoudImplementationStarted();case IntervalChanged():
return intervalChanged(_that.intervalSeconds);case Stopped():
return stopped();case RealDeal():
return realDeal();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loopImplementationStarted,TResult? Function()?  timerImplementationStarted,TResult? Function()?  soLoudImplementationStarted,TResult? Function( int intervalSeconds)?  intervalChanged,TResult? Function()?  stopped,TResult? Function()?  realDeal,}) {final _that = this;
switch (_that) {
case LoopImplementationStarted() when loopImplementationStarted != null:
return loopImplementationStarted();case TimerImplementationStarted() when timerImplementationStarted != null:
return timerImplementationStarted();case SoLoudImplementationStarted() when soLoudImplementationStarted != null:
return soLoudImplementationStarted();case IntervalChanged() when intervalChanged != null:
return intervalChanged(_that.intervalSeconds);case Stopped() when stopped != null:
return stopped();case RealDeal() when realDeal != null:
return realDeal();case _:
  return null;

}
}

}

/// @nodoc


class LoopImplementationStarted implements PlaygroundEvent {
  const LoopImplementationStarted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoopImplementationStarted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PlaygroundEvent.loopImplementationStarted()';
}


}




/// @nodoc


class TimerImplementationStarted implements PlaygroundEvent {
  const TimerImplementationStarted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimerImplementationStarted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PlaygroundEvent.timerImplementationStarted()';
}


}




/// @nodoc


class SoLoudImplementationStarted implements PlaygroundEvent {
  const SoLoudImplementationStarted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SoLoudImplementationStarted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PlaygroundEvent.soLoudImplementationStarted()';
}


}




/// @nodoc


class IntervalChanged implements PlaygroundEvent {
  const IntervalChanged(this.intervalSeconds);
  

 final  int intervalSeconds;

/// Create a copy of PlaygroundEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IntervalChangedCopyWith<IntervalChanged> get copyWith => _$IntervalChangedCopyWithImpl<IntervalChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IntervalChanged&&(identical(other.intervalSeconds, intervalSeconds) || other.intervalSeconds == intervalSeconds));
}


@override
int get hashCode => Object.hash(runtimeType,intervalSeconds);

@override
String toString() {
  return 'PlaygroundEvent.intervalChanged(intervalSeconds: $intervalSeconds)';
}


}

/// @nodoc
abstract mixin class $IntervalChangedCopyWith<$Res> implements $PlaygroundEventCopyWith<$Res> {
  factory $IntervalChangedCopyWith(IntervalChanged value, $Res Function(IntervalChanged) _then) = _$IntervalChangedCopyWithImpl;
@useResult
$Res call({
 int intervalSeconds
});




}
/// @nodoc
class _$IntervalChangedCopyWithImpl<$Res>
    implements $IntervalChangedCopyWith<$Res> {
  _$IntervalChangedCopyWithImpl(this._self, this._then);

  final IntervalChanged _self;
  final $Res Function(IntervalChanged) _then;

/// Create a copy of PlaygroundEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? intervalSeconds = null,}) {
  return _then(IntervalChanged(
null == intervalSeconds ? _self.intervalSeconds : intervalSeconds // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class Stopped implements PlaygroundEvent {
  const Stopped();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Stopped);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PlaygroundEvent.stopped()';
}


}




/// @nodoc


class RealDeal implements PlaygroundEvent {
  const RealDeal();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RealDeal);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PlaygroundEvent.realDeal()';
}


}




/// @nodoc
mixin _$PlaygroundState {

 PlaygroundImplementation get activeImplementation; int get intervalSeconds; AudioSource? get audioSource;
/// Create a copy of PlaygroundState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlaygroundStateCopyWith<PlaygroundState> get copyWith => _$PlaygroundStateCopyWithImpl<PlaygroundState>(this as PlaygroundState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlaygroundState&&(identical(other.activeImplementation, activeImplementation) || other.activeImplementation == activeImplementation)&&(identical(other.intervalSeconds, intervalSeconds) || other.intervalSeconds == intervalSeconds)&&(identical(other.audioSource, audioSource) || other.audioSource == audioSource));
}


@override
int get hashCode => Object.hash(runtimeType,activeImplementation,intervalSeconds,audioSource);

@override
String toString() {
  return 'PlaygroundState(activeImplementation: $activeImplementation, intervalSeconds: $intervalSeconds, audioSource: $audioSource)';
}


}

/// @nodoc
abstract mixin class $PlaygroundStateCopyWith<$Res>  {
  factory $PlaygroundStateCopyWith(PlaygroundState value, $Res Function(PlaygroundState) _then) = _$PlaygroundStateCopyWithImpl;
@useResult
$Res call({
 PlaygroundImplementation activeImplementation, int intervalSeconds, AudioSource? audioSource
});




}
/// @nodoc
class _$PlaygroundStateCopyWithImpl<$Res>
    implements $PlaygroundStateCopyWith<$Res> {
  _$PlaygroundStateCopyWithImpl(this._self, this._then);

  final PlaygroundState _self;
  final $Res Function(PlaygroundState) _then;

/// Create a copy of PlaygroundState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? activeImplementation = null,Object? intervalSeconds = null,Object? audioSource = freezed,}) {
  return _then(_self.copyWith(
activeImplementation: null == activeImplementation ? _self.activeImplementation : activeImplementation // ignore: cast_nullable_to_non_nullable
as PlaygroundImplementation,intervalSeconds: null == intervalSeconds ? _self.intervalSeconds : intervalSeconds // ignore: cast_nullable_to_non_nullable
as int,audioSource: freezed == audioSource ? _self.audioSource : audioSource // ignore: cast_nullable_to_non_nullable
as AudioSource?,
  ));
}

}


/// Adds pattern-matching-related methods to [PlaygroundState].
extension PlaygroundStatePatterns on PlaygroundState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlaygroundState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlaygroundState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlaygroundState value)  $default,){
final _that = this;
switch (_that) {
case _PlaygroundState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlaygroundState value)?  $default,){
final _that = this;
switch (_that) {
case _PlaygroundState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PlaygroundImplementation activeImplementation,  int intervalSeconds,  AudioSource? audioSource)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlaygroundState() when $default != null:
return $default(_that.activeImplementation,_that.intervalSeconds,_that.audioSource);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PlaygroundImplementation activeImplementation,  int intervalSeconds,  AudioSource? audioSource)  $default,) {final _that = this;
switch (_that) {
case _PlaygroundState():
return $default(_that.activeImplementation,_that.intervalSeconds,_that.audioSource);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PlaygroundImplementation activeImplementation,  int intervalSeconds,  AudioSource? audioSource)?  $default,) {final _that = this;
switch (_that) {
case _PlaygroundState() when $default != null:
return $default(_that.activeImplementation,_that.intervalSeconds,_that.audioSource);case _:
  return null;

}
}

}

/// @nodoc


class _PlaygroundState implements PlaygroundState {
  const _PlaygroundState({this.activeImplementation = PlaygroundImplementation.none, this.intervalSeconds = 1, this.audioSource});
  

@override@JsonKey() final  PlaygroundImplementation activeImplementation;
@override@JsonKey() final  int intervalSeconds;
@override final  AudioSource? audioSource;

/// Create a copy of PlaygroundState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlaygroundStateCopyWith<_PlaygroundState> get copyWith => __$PlaygroundStateCopyWithImpl<_PlaygroundState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlaygroundState&&(identical(other.activeImplementation, activeImplementation) || other.activeImplementation == activeImplementation)&&(identical(other.intervalSeconds, intervalSeconds) || other.intervalSeconds == intervalSeconds)&&(identical(other.audioSource, audioSource) || other.audioSource == audioSource));
}


@override
int get hashCode => Object.hash(runtimeType,activeImplementation,intervalSeconds,audioSource);

@override
String toString() {
  return 'PlaygroundState(activeImplementation: $activeImplementation, intervalSeconds: $intervalSeconds, audioSource: $audioSource)';
}


}

/// @nodoc
abstract mixin class _$PlaygroundStateCopyWith<$Res> implements $PlaygroundStateCopyWith<$Res> {
  factory _$PlaygroundStateCopyWith(_PlaygroundState value, $Res Function(_PlaygroundState) _then) = __$PlaygroundStateCopyWithImpl;
@override @useResult
$Res call({
 PlaygroundImplementation activeImplementation, int intervalSeconds, AudioSource? audioSource
});




}
/// @nodoc
class __$PlaygroundStateCopyWithImpl<$Res>
    implements _$PlaygroundStateCopyWith<$Res> {
  __$PlaygroundStateCopyWithImpl(this._self, this._then);

  final _PlaygroundState _self;
  final $Res Function(_PlaygroundState) _then;

/// Create a copy of PlaygroundState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? activeImplementation = null,Object? intervalSeconds = null,Object? audioSource = freezed,}) {
  return _then(_PlaygroundState(
activeImplementation: null == activeImplementation ? _self.activeImplementation : activeImplementation // ignore: cast_nullable_to_non_nullable
as PlaygroundImplementation,intervalSeconds: null == intervalSeconds ? _self.intervalSeconds : intervalSeconds // ignore: cast_nullable_to_non_nullable
as int,audioSource: freezed == audioSource ? _self.audioSource : audioSource // ignore: cast_nullable_to_non_nullable
as AudioSource?,
  ));
}


}

// dart format on
