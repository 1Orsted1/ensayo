// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plan_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PlanState {

 List<Piece> get pieces; PlanFilter get filter; PlanLoadStatus get loadStatus; PlanActionStatus get actionStatus;
/// Create a copy of PlanState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlanStateCopyWith<PlanState> get copyWith => _$PlanStateCopyWithImpl<PlanState>(this as PlanState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlanState&&const DeepCollectionEquality().equals(other.pieces, pieces)&&(identical(other.filter, filter) || other.filter == filter)&&(identical(other.loadStatus, loadStatus) || other.loadStatus == loadStatus)&&(identical(other.actionStatus, actionStatus) || other.actionStatus == actionStatus));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(pieces),filter,loadStatus,actionStatus);

@override
String toString() {
  return 'PlanState(pieces: $pieces, filter: $filter, loadStatus: $loadStatus, actionStatus: $actionStatus)';
}


}

/// @nodoc
abstract mixin class $PlanStateCopyWith<$Res>  {
  factory $PlanStateCopyWith(PlanState value, $Res Function(PlanState) _then) = _$PlanStateCopyWithImpl;
@useResult
$Res call({
 List<Piece> pieces, PlanFilter filter, PlanLoadStatus loadStatus, PlanActionStatus actionStatus
});




}
/// @nodoc
class _$PlanStateCopyWithImpl<$Res>
    implements $PlanStateCopyWith<$Res> {
  _$PlanStateCopyWithImpl(this._self, this._then);

  final PlanState _self;
  final $Res Function(PlanState) _then;

/// Create a copy of PlanState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pieces = null,Object? filter = null,Object? loadStatus = null,Object? actionStatus = null,}) {
  return _then(_self.copyWith(
pieces: null == pieces ? _self.pieces : pieces // ignore: cast_nullable_to_non_nullable
as List<Piece>,filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as PlanFilter,loadStatus: null == loadStatus ? _self.loadStatus : loadStatus // ignore: cast_nullable_to_non_nullable
as PlanLoadStatus,actionStatus: null == actionStatus ? _self.actionStatus : actionStatus // ignore: cast_nullable_to_non_nullable
as PlanActionStatus,
  ));
}

}


/// Adds pattern-matching-related methods to [PlanState].
extension PlanStatePatterns on PlanState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlanState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlanState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlanState value)  $default,){
final _that = this;
switch (_that) {
case _PlanState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlanState value)?  $default,){
final _that = this;
switch (_that) {
case _PlanState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Piece> pieces,  PlanFilter filter,  PlanLoadStatus loadStatus,  PlanActionStatus actionStatus)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlanState() when $default != null:
return $default(_that.pieces,_that.filter,_that.loadStatus,_that.actionStatus);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Piece> pieces,  PlanFilter filter,  PlanLoadStatus loadStatus,  PlanActionStatus actionStatus)  $default,) {final _that = this;
switch (_that) {
case _PlanState():
return $default(_that.pieces,_that.filter,_that.loadStatus,_that.actionStatus);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Piece> pieces,  PlanFilter filter,  PlanLoadStatus loadStatus,  PlanActionStatus actionStatus)?  $default,) {final _that = this;
switch (_that) {
case _PlanState() when $default != null:
return $default(_that.pieces,_that.filter,_that.loadStatus,_that.actionStatus);case _:
  return null;

}
}

}

/// @nodoc


class _PlanState extends PlanState {
  const _PlanState({final  List<Piece> pieces = const <Piece>[], this.filter = PlanFilter.all, this.loadStatus = PlanLoadStatus.loading, this.actionStatus = PlanActionStatus.idle}): _pieces = pieces,super._();
  

 final  List<Piece> _pieces;
@override@JsonKey() List<Piece> get pieces {
  if (_pieces is EqualUnmodifiableListView) return _pieces;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_pieces);
}

@override@JsonKey() final  PlanFilter filter;
@override@JsonKey() final  PlanLoadStatus loadStatus;
@override@JsonKey() final  PlanActionStatus actionStatus;

/// Create a copy of PlanState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlanStateCopyWith<_PlanState> get copyWith => __$PlanStateCopyWithImpl<_PlanState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlanState&&const DeepCollectionEquality().equals(other._pieces, _pieces)&&(identical(other.filter, filter) || other.filter == filter)&&(identical(other.loadStatus, loadStatus) || other.loadStatus == loadStatus)&&(identical(other.actionStatus, actionStatus) || other.actionStatus == actionStatus));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_pieces),filter,loadStatus,actionStatus);

@override
String toString() {
  return 'PlanState(pieces: $pieces, filter: $filter, loadStatus: $loadStatus, actionStatus: $actionStatus)';
}


}

/// @nodoc
abstract mixin class _$PlanStateCopyWith<$Res> implements $PlanStateCopyWith<$Res> {
  factory _$PlanStateCopyWith(_PlanState value, $Res Function(_PlanState) _then) = __$PlanStateCopyWithImpl;
@override @useResult
$Res call({
 List<Piece> pieces, PlanFilter filter, PlanLoadStatus loadStatus, PlanActionStatus actionStatus
});




}
/// @nodoc
class __$PlanStateCopyWithImpl<$Res>
    implements _$PlanStateCopyWith<$Res> {
  __$PlanStateCopyWithImpl(this._self, this._then);

  final _PlanState _self;
  final $Res Function(_PlanState) _then;

/// Create a copy of PlanState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pieces = null,Object? filter = null,Object? loadStatus = null,Object? actionStatus = null,}) {
  return _then(_PlanState(
pieces: null == pieces ? _self._pieces : pieces // ignore: cast_nullable_to_non_nullable
as List<Piece>,filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as PlanFilter,loadStatus: null == loadStatus ? _self.loadStatus : loadStatus // ignore: cast_nullable_to_non_nullable
as PlanLoadStatus,actionStatus: null == actionStatus ? _self.actionStatus : actionStatus // ignore: cast_nullable_to_non_nullable
as PlanActionStatus,
  ));
}


}

// dart format on
