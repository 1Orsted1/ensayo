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
mixin _$PlanEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlanEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PlanEvent()';
}


}

/// @nodoc
class $PlanEventCopyWith<$Res>  {
$PlanEventCopyWith(PlanEvent _, $Res Function(PlanEvent) __);
}


/// Adds pattern-matching-related methods to [PlanEvent].
extension PlanEventPatterns on PlanEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _FilterChanged value)?  filterChanged,TResult Function( _PieceSaved value)?  pieceSaved,TResult Function( _PieceDeleted value)?  pieceDeleted,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _FilterChanged() when filterChanged != null:
return filterChanged(_that);case _PieceSaved() when pieceSaved != null:
return pieceSaved(_that);case _PieceDeleted() when pieceDeleted != null:
return pieceDeleted(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _FilterChanged value)  filterChanged,required TResult Function( _PieceSaved value)  pieceSaved,required TResult Function( _PieceDeleted value)  pieceDeleted,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _FilterChanged():
return filterChanged(_that);case _PieceSaved():
return pieceSaved(_that);case _PieceDeleted():
return pieceDeleted(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _FilterChanged value)?  filterChanged,TResult? Function( _PieceSaved value)?  pieceSaved,TResult? Function( _PieceDeleted value)?  pieceDeleted,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _FilterChanged() when filterChanged != null:
return filterChanged(_that);case _PieceSaved() when pieceSaved != null:
return pieceSaved(_that);case _PieceDeleted() when pieceDeleted != null:
return pieceDeleted(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( PlanFilter filter)?  filterChanged,TResult Function( Piece piece)?  pieceSaved,TResult Function( int id)?  pieceDeleted,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _FilterChanged() when filterChanged != null:
return filterChanged(_that.filter);case _PieceSaved() when pieceSaved != null:
return pieceSaved(_that.piece);case _PieceDeleted() when pieceDeleted != null:
return pieceDeleted(_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( PlanFilter filter)  filterChanged,required TResult Function( Piece piece)  pieceSaved,required TResult Function( int id)  pieceDeleted,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _FilterChanged():
return filterChanged(_that.filter);case _PieceSaved():
return pieceSaved(_that.piece);case _PieceDeleted():
return pieceDeleted(_that.id);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( PlanFilter filter)?  filterChanged,TResult? Function( Piece piece)?  pieceSaved,TResult? Function( int id)?  pieceDeleted,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _FilterChanged() when filterChanged != null:
return filterChanged(_that.filter);case _PieceSaved() when pieceSaved != null:
return pieceSaved(_that.piece);case _PieceDeleted() when pieceDeleted != null:
return pieceDeleted(_that.id);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements PlanEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PlanEvent.started()';
}


}




/// @nodoc


class _FilterChanged implements PlanEvent {
  const _FilterChanged(this.filter);
  

 final  PlanFilter filter;

/// Create a copy of PlanEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FilterChangedCopyWith<_FilterChanged> get copyWith => __$FilterChangedCopyWithImpl<_FilterChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FilterChanged&&(identical(other.filter, filter) || other.filter == filter));
}


@override
int get hashCode => Object.hash(runtimeType,filter);

@override
String toString() {
  return 'PlanEvent.filterChanged(filter: $filter)';
}


}

/// @nodoc
abstract mixin class _$FilterChangedCopyWith<$Res> implements $PlanEventCopyWith<$Res> {
  factory _$FilterChangedCopyWith(_FilterChanged value, $Res Function(_FilterChanged) _then) = __$FilterChangedCopyWithImpl;
@useResult
$Res call({
 PlanFilter filter
});




}
/// @nodoc
class __$FilterChangedCopyWithImpl<$Res>
    implements _$FilterChangedCopyWith<$Res> {
  __$FilterChangedCopyWithImpl(this._self, this._then);

  final _FilterChanged _self;
  final $Res Function(_FilterChanged) _then;

/// Create a copy of PlanEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? filter = null,}) {
  return _then(_FilterChanged(
null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as PlanFilter,
  ));
}


}

/// @nodoc


class _PieceSaved implements PlanEvent {
  const _PieceSaved(this.piece);
  

 final  Piece piece;

/// Create a copy of PlanEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PieceSavedCopyWith<_PieceSaved> get copyWith => __$PieceSavedCopyWithImpl<_PieceSaved>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PieceSaved&&(identical(other.piece, piece) || other.piece == piece));
}


@override
int get hashCode => Object.hash(runtimeType,piece);

@override
String toString() {
  return 'PlanEvent.pieceSaved(piece: $piece)';
}


}

/// @nodoc
abstract mixin class _$PieceSavedCopyWith<$Res> implements $PlanEventCopyWith<$Res> {
  factory _$PieceSavedCopyWith(_PieceSaved value, $Res Function(_PieceSaved) _then) = __$PieceSavedCopyWithImpl;
@useResult
$Res call({
 Piece piece
});


$PieceCopyWith<$Res> get piece;

}
/// @nodoc
class __$PieceSavedCopyWithImpl<$Res>
    implements _$PieceSavedCopyWith<$Res> {
  __$PieceSavedCopyWithImpl(this._self, this._then);

  final _PieceSaved _self;
  final $Res Function(_PieceSaved) _then;

/// Create a copy of PlanEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? piece = null,}) {
  return _then(_PieceSaved(
null == piece ? _self.piece : piece // ignore: cast_nullable_to_non_nullable
as Piece,
  ));
}

/// Create a copy of PlanEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PieceCopyWith<$Res> get piece {
  
  return $PieceCopyWith<$Res>(_self.piece, (value) {
    return _then(_self.copyWith(piece: value));
  });
}
}

/// @nodoc


class _PieceDeleted implements PlanEvent {
  const _PieceDeleted(this.id);
  

 final  int id;

/// Create a copy of PlanEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PieceDeletedCopyWith<_PieceDeleted> get copyWith => __$PieceDeletedCopyWithImpl<_PieceDeleted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PieceDeleted&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'PlanEvent.pieceDeleted(id: $id)';
}


}

/// @nodoc
abstract mixin class _$PieceDeletedCopyWith<$Res> implements $PlanEventCopyWith<$Res> {
  factory _$PieceDeletedCopyWith(_PieceDeleted value, $Res Function(_PieceDeleted) _then) = __$PieceDeletedCopyWithImpl;
@useResult
$Res call({
 int id
});




}
/// @nodoc
class __$PieceDeletedCopyWithImpl<$Res>
    implements _$PieceDeletedCopyWith<$Res> {
  __$PieceDeletedCopyWithImpl(this._self, this._then);

  final _PieceDeleted _self;
  final $Res Function(_PieceDeleted) _then;

/// Create a copy of PlanEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_PieceDeleted(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

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
