// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SessionEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SessionEvent()';
}


}

/// @nodoc
class $SessionEventCopyWith<$Res>  {
$SessionEventCopyWith(SessionEvent _, $Res Function(SessionEvent) __);
}


/// Adds pattern-matching-related methods to [SessionEvent].
extension SessionEventPatterns on SessionEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Restored value)?  restored,TResult Function( _StartRequested value)?  startRequested,TResult Function( _PieceLogged value)?  pieceLogged,TResult Function( _PieceSkipped value)?  pieceSkipped,TResult Function( _FinishRequested value)?  finishRequested,TResult Function( _DiscardRequested value)?  discardRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Restored() when restored != null:
return restored(_that);case _StartRequested() when startRequested != null:
return startRequested(_that);case _PieceLogged() when pieceLogged != null:
return pieceLogged(_that);case _PieceSkipped() when pieceSkipped != null:
return pieceSkipped(_that);case _FinishRequested() when finishRequested != null:
return finishRequested(_that);case _DiscardRequested() when discardRequested != null:
return discardRequested(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Restored value)  restored,required TResult Function( _StartRequested value)  startRequested,required TResult Function( _PieceLogged value)  pieceLogged,required TResult Function( _PieceSkipped value)  pieceSkipped,required TResult Function( _FinishRequested value)  finishRequested,required TResult Function( _DiscardRequested value)  discardRequested,}){
final _that = this;
switch (_that) {
case _Restored():
return restored(_that);case _StartRequested():
return startRequested(_that);case _PieceLogged():
return pieceLogged(_that);case _PieceSkipped():
return pieceSkipped(_that);case _FinishRequested():
return finishRequested(_that);case _DiscardRequested():
return discardRequested(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Restored value)?  restored,TResult? Function( _StartRequested value)?  startRequested,TResult? Function( _PieceLogged value)?  pieceLogged,TResult? Function( _PieceSkipped value)?  pieceSkipped,TResult? Function( _FinishRequested value)?  finishRequested,TResult? Function( _DiscardRequested value)?  discardRequested,}){
final _that = this;
switch (_that) {
case _Restored() when restored != null:
return restored(_that);case _StartRequested() when startRequested != null:
return startRequested(_that);case _PieceLogged() when pieceLogged != null:
return pieceLogged(_that);case _PieceSkipped() when pieceSkipped != null:
return pieceSkipped(_that);case _FinishRequested() when finishRequested != null:
return finishRequested(_that);case _DiscardRequested() when discardRequested != null:
return discardRequested(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  restored,TResult Function()?  startRequested,TResult Function( PieceLogInput input)?  pieceLogged,TResult Function()?  pieceSkipped,TResult Function()?  finishRequested,TResult Function()?  discardRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Restored() when restored != null:
return restored();case _StartRequested() when startRequested != null:
return startRequested();case _PieceLogged() when pieceLogged != null:
return pieceLogged(_that.input);case _PieceSkipped() when pieceSkipped != null:
return pieceSkipped();case _FinishRequested() when finishRequested != null:
return finishRequested();case _DiscardRequested() when discardRequested != null:
return discardRequested();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  restored,required TResult Function()  startRequested,required TResult Function( PieceLogInput input)  pieceLogged,required TResult Function()  pieceSkipped,required TResult Function()  finishRequested,required TResult Function()  discardRequested,}) {final _that = this;
switch (_that) {
case _Restored():
return restored();case _StartRequested():
return startRequested();case _PieceLogged():
return pieceLogged(_that.input);case _PieceSkipped():
return pieceSkipped();case _FinishRequested():
return finishRequested();case _DiscardRequested():
return discardRequested();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  restored,TResult? Function()?  startRequested,TResult? Function( PieceLogInput input)?  pieceLogged,TResult? Function()?  pieceSkipped,TResult? Function()?  finishRequested,TResult? Function()?  discardRequested,}) {final _that = this;
switch (_that) {
case _Restored() when restored != null:
return restored();case _StartRequested() when startRequested != null:
return startRequested();case _PieceLogged() when pieceLogged != null:
return pieceLogged(_that.input);case _PieceSkipped() when pieceSkipped != null:
return pieceSkipped();case _FinishRequested() when finishRequested != null:
return finishRequested();case _DiscardRequested() when discardRequested != null:
return discardRequested();case _:
  return null;

}
}

}

/// @nodoc


class _Restored implements SessionEvent {
  const _Restored();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Restored);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SessionEvent.restored()';
}


}




/// @nodoc


class _StartRequested implements SessionEvent {
  const _StartRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StartRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SessionEvent.startRequested()';
}


}




/// @nodoc


class _PieceLogged implements SessionEvent {
  const _PieceLogged(this.input);
  

 final  PieceLogInput input;

/// Create a copy of SessionEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PieceLoggedCopyWith<_PieceLogged> get copyWith => __$PieceLoggedCopyWithImpl<_PieceLogged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PieceLogged&&(identical(other.input, input) || other.input == input));
}


@override
int get hashCode => Object.hash(runtimeType,input);

@override
String toString() {
  return 'SessionEvent.pieceLogged(input: $input)';
}


}

/// @nodoc
abstract mixin class _$PieceLoggedCopyWith<$Res> implements $SessionEventCopyWith<$Res> {
  factory _$PieceLoggedCopyWith(_PieceLogged value, $Res Function(_PieceLogged) _then) = __$PieceLoggedCopyWithImpl;
@useResult
$Res call({
 PieceLogInput input
});


$PieceLogInputCopyWith<$Res> get input;

}
/// @nodoc
class __$PieceLoggedCopyWithImpl<$Res>
    implements _$PieceLoggedCopyWith<$Res> {
  __$PieceLoggedCopyWithImpl(this._self, this._then);

  final _PieceLogged _self;
  final $Res Function(_PieceLogged) _then;

/// Create a copy of SessionEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? input = null,}) {
  return _then(_PieceLogged(
null == input ? _self.input : input // ignore: cast_nullable_to_non_nullable
as PieceLogInput,
  ));
}

/// Create a copy of SessionEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PieceLogInputCopyWith<$Res> get input {
  
  return $PieceLogInputCopyWith<$Res>(_self.input, (value) {
    return _then(_self.copyWith(input: value));
  });
}
}

/// @nodoc


class _PieceSkipped implements SessionEvent {
  const _PieceSkipped();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PieceSkipped);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SessionEvent.pieceSkipped()';
}


}




/// @nodoc


class _FinishRequested implements SessionEvent {
  const _FinishRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FinishRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SessionEvent.finishRequested()';
}


}




/// @nodoc


class _DiscardRequested implements SessionEvent {
  const _DiscardRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DiscardRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SessionEvent.discardRequested()';
}


}




/// @nodoc
mixin _$SessionState {

 SessionStatus get status; PracticeSession? get session; List<Piece> get queue; int get currentIndex; DateTime get currentSince; SessionActionStatus get actionStatus; SessionFailure? get failure;
/// Create a copy of SessionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionStateCopyWith<SessionState> get copyWith => _$SessionStateCopyWithImpl<SessionState>(this as SessionState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionState&&(identical(other.status, status) || other.status == status)&&(identical(other.session, session) || other.session == session)&&const DeepCollectionEquality().equals(other.queue, queue)&&(identical(other.currentIndex, currentIndex) || other.currentIndex == currentIndex)&&(identical(other.currentSince, currentSince) || other.currentSince == currentSince)&&(identical(other.actionStatus, actionStatus) || other.actionStatus == actionStatus)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,status,session,const DeepCollectionEquality().hash(queue),currentIndex,currentSince,actionStatus,failure);

@override
String toString() {
  return 'SessionState(status: $status, session: $session, queue: $queue, currentIndex: $currentIndex, currentSince: $currentSince, actionStatus: $actionStatus, failure: $failure)';
}


}

/// @nodoc
abstract mixin class $SessionStateCopyWith<$Res>  {
  factory $SessionStateCopyWith(SessionState value, $Res Function(SessionState) _then) = _$SessionStateCopyWithImpl;
@useResult
$Res call({
 SessionStatus status, PracticeSession? session, List<Piece> queue, int currentIndex, DateTime currentSince, SessionActionStatus actionStatus, SessionFailure? failure
});


$PracticeSessionCopyWith<$Res>? get session;

}
/// @nodoc
class _$SessionStateCopyWithImpl<$Res>
    implements $SessionStateCopyWith<$Res> {
  _$SessionStateCopyWithImpl(this._self, this._then);

  final SessionState _self;
  final $Res Function(SessionState) _then;

/// Create a copy of SessionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? session = freezed,Object? queue = null,Object? currentIndex = null,Object? currentSince = null,Object? actionStatus = null,Object? failure = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SessionStatus,session: freezed == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as PracticeSession?,queue: null == queue ? _self.queue : queue // ignore: cast_nullable_to_non_nullable
as List<Piece>,currentIndex: null == currentIndex ? _self.currentIndex : currentIndex // ignore: cast_nullable_to_non_nullable
as int,currentSince: null == currentSince ? _self.currentSince : currentSince // ignore: cast_nullable_to_non_nullable
as DateTime,actionStatus: null == actionStatus ? _self.actionStatus : actionStatus // ignore: cast_nullable_to_non_nullable
as SessionActionStatus,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as SessionFailure?,
  ));
}
/// Create a copy of SessionState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PracticeSessionCopyWith<$Res>? get session {
    if (_self.session == null) {
    return null;
  }

  return $PracticeSessionCopyWith<$Res>(_self.session!, (value) {
    return _then(_self.copyWith(session: value));
  });
}
}


/// Adds pattern-matching-related methods to [SessionState].
extension SessionStatePatterns on SessionState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SessionState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SessionState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SessionState value)  $default,){
final _that = this;
switch (_that) {
case _SessionState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SessionState value)?  $default,){
final _that = this;
switch (_that) {
case _SessionState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SessionStatus status,  PracticeSession? session,  List<Piece> queue,  int currentIndex,  DateTime currentSince,  SessionActionStatus actionStatus,  SessionFailure? failure)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SessionState() when $default != null:
return $default(_that.status,_that.session,_that.queue,_that.currentIndex,_that.currentSince,_that.actionStatus,_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SessionStatus status,  PracticeSession? session,  List<Piece> queue,  int currentIndex,  DateTime currentSince,  SessionActionStatus actionStatus,  SessionFailure? failure)  $default,) {final _that = this;
switch (_that) {
case _SessionState():
return $default(_that.status,_that.session,_that.queue,_that.currentIndex,_that.currentSince,_that.actionStatus,_that.failure);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SessionStatus status,  PracticeSession? session,  List<Piece> queue,  int currentIndex,  DateTime currentSince,  SessionActionStatus actionStatus,  SessionFailure? failure)?  $default,) {final _that = this;
switch (_that) {
case _SessionState() when $default != null:
return $default(_that.status,_that.session,_that.queue,_that.currentIndex,_that.currentSince,_that.actionStatus,_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class _SessionState extends SessionState {
  const _SessionState({this.status = SessionStatus.restoring, this.session, final  List<Piece> queue = const <Piece>[], this.currentIndex = 0, required this.currentSince, this.actionStatus = SessionActionStatus.idle, this.failure}): _queue = queue,super._();
  

@override@JsonKey() final  SessionStatus status;
@override final  PracticeSession? session;
 final  List<Piece> _queue;
@override@JsonKey() List<Piece> get queue {
  if (_queue is EqualUnmodifiableListView) return _queue;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_queue);
}

@override@JsonKey() final  int currentIndex;
@override final  DateTime currentSince;
@override@JsonKey() final  SessionActionStatus actionStatus;
@override final  SessionFailure? failure;

/// Create a copy of SessionState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SessionStateCopyWith<_SessionState> get copyWith => __$SessionStateCopyWithImpl<_SessionState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SessionState&&(identical(other.status, status) || other.status == status)&&(identical(other.session, session) || other.session == session)&&const DeepCollectionEquality().equals(other._queue, _queue)&&(identical(other.currentIndex, currentIndex) || other.currentIndex == currentIndex)&&(identical(other.currentSince, currentSince) || other.currentSince == currentSince)&&(identical(other.actionStatus, actionStatus) || other.actionStatus == actionStatus)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,status,session,const DeepCollectionEquality().hash(_queue),currentIndex,currentSince,actionStatus,failure);

@override
String toString() {
  return 'SessionState(status: $status, session: $session, queue: $queue, currentIndex: $currentIndex, currentSince: $currentSince, actionStatus: $actionStatus, failure: $failure)';
}


}

/// @nodoc
abstract mixin class _$SessionStateCopyWith<$Res> implements $SessionStateCopyWith<$Res> {
  factory _$SessionStateCopyWith(_SessionState value, $Res Function(_SessionState) _then) = __$SessionStateCopyWithImpl;
@override @useResult
$Res call({
 SessionStatus status, PracticeSession? session, List<Piece> queue, int currentIndex, DateTime currentSince, SessionActionStatus actionStatus, SessionFailure? failure
});


@override $PracticeSessionCopyWith<$Res>? get session;

}
/// @nodoc
class __$SessionStateCopyWithImpl<$Res>
    implements _$SessionStateCopyWith<$Res> {
  __$SessionStateCopyWithImpl(this._self, this._then);

  final _SessionState _self;
  final $Res Function(_SessionState) _then;

/// Create a copy of SessionState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? session = freezed,Object? queue = null,Object? currentIndex = null,Object? currentSince = null,Object? actionStatus = null,Object? failure = freezed,}) {
  return _then(_SessionState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SessionStatus,session: freezed == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as PracticeSession?,queue: null == queue ? _self._queue : queue // ignore: cast_nullable_to_non_nullable
as List<Piece>,currentIndex: null == currentIndex ? _self.currentIndex : currentIndex // ignore: cast_nullable_to_non_nullable
as int,currentSince: null == currentSince ? _self.currentSince : currentSince // ignore: cast_nullable_to_non_nullable
as DateTime,actionStatus: null == actionStatus ? _self.actionStatus : actionStatus // ignore: cast_nullable_to_non_nullable
as SessionActionStatus,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as SessionFailure?,
  ));
}

/// Create a copy of SessionState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PracticeSessionCopyWith<$Res>? get session {
    if (_self.session == null) {
    return null;
  }

  return $PracticeSessionCopyWith<$Res>(_self.session!, (value) {
    return _then(_self.copyWith(session: value));
  });
}
}

// dart format on
