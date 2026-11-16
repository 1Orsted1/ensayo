// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'piece.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Piece {

 int? get id; String get title; String? get composer; PieceStatus get status; int? get targetBpm; Set<FocusTag> get tags;
/// Create a copy of Piece
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PieceCopyWith<Piece> get copyWith => _$PieceCopyWithImpl<Piece>(this as Piece, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Piece&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.composer, composer) || other.composer == composer)&&(identical(other.status, status) || other.status == status)&&(identical(other.targetBpm, targetBpm) || other.targetBpm == targetBpm)&&const DeepCollectionEquality().equals(other.tags, tags));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,composer,status,targetBpm,const DeepCollectionEquality().hash(tags));

@override
String toString() {
  return 'Piece(id: $id, title: $title, composer: $composer, status: $status, targetBpm: $targetBpm, tags: $tags)';
}


}

/// @nodoc
abstract mixin class $PieceCopyWith<$Res>  {
  factory $PieceCopyWith(Piece value, $Res Function(Piece) _then) = _$PieceCopyWithImpl;
@useResult
$Res call({
 int? id, String title, String? composer, PieceStatus status, int? targetBpm, Set<FocusTag> tags
});




}
/// @nodoc
class _$PieceCopyWithImpl<$Res>
    implements $PieceCopyWith<$Res> {
  _$PieceCopyWithImpl(this._self, this._then);

  final Piece _self;
  final $Res Function(Piece) _then;

/// Create a copy of Piece
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? title = null,Object? composer = freezed,Object? status = null,Object? targetBpm = freezed,Object? tags = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,composer: freezed == composer ? _self.composer : composer // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PieceStatus,targetBpm: freezed == targetBpm ? _self.targetBpm : targetBpm // ignore: cast_nullable_to_non_nullable
as int?,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as Set<FocusTag>,
  ));
}

}


/// Adds pattern-matching-related methods to [Piece].
extension PiecePatterns on Piece {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Piece value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Piece() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Piece value)  $default,){
final _that = this;
switch (_that) {
case _Piece():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Piece value)?  $default,){
final _that = this;
switch (_that) {
case _Piece() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String title,  String? composer,  PieceStatus status,  int? targetBpm,  Set<FocusTag> tags)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Piece() when $default != null:
return $default(_that.id,_that.title,_that.composer,_that.status,_that.targetBpm,_that.tags);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String title,  String? composer,  PieceStatus status,  int? targetBpm,  Set<FocusTag> tags)  $default,) {final _that = this;
switch (_that) {
case _Piece():
return $default(_that.id,_that.title,_that.composer,_that.status,_that.targetBpm,_that.tags);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String title,  String? composer,  PieceStatus status,  int? targetBpm,  Set<FocusTag> tags)?  $default,) {final _that = this;
switch (_that) {
case _Piece() when $default != null:
return $default(_that.id,_that.title,_that.composer,_that.status,_that.targetBpm,_that.tags);case _:
  return null;

}
}

}

/// @nodoc


class _Piece implements Piece {
  const _Piece({this.id, required this.title, this.composer, this.status = PieceStatus.learning, this.targetBpm, final  Set<FocusTag> tags = const <FocusTag>{}}): _tags = tags;
  

@override final  int? id;
@override final  String title;
@override final  String? composer;
@override@JsonKey() final  PieceStatus status;
@override final  int? targetBpm;
 final  Set<FocusTag> _tags;
@override@JsonKey() Set<FocusTag> get tags {
  if (_tags is EqualUnmodifiableSetView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_tags);
}


/// Create a copy of Piece
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PieceCopyWith<_Piece> get copyWith => __$PieceCopyWithImpl<_Piece>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Piece&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.composer, composer) || other.composer == composer)&&(identical(other.status, status) || other.status == status)&&(identical(other.targetBpm, targetBpm) || other.targetBpm == targetBpm)&&const DeepCollectionEquality().equals(other._tags, _tags));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,composer,status,targetBpm,const DeepCollectionEquality().hash(_tags));

@override
String toString() {
  return 'Piece(id: $id, title: $title, composer: $composer, status: $status, targetBpm: $targetBpm, tags: $tags)';
}


}

/// @nodoc
abstract mixin class _$PieceCopyWith<$Res> implements $PieceCopyWith<$Res> {
  factory _$PieceCopyWith(_Piece value, $Res Function(_Piece) _then) = __$PieceCopyWithImpl;
@override @useResult
$Res call({
 int? id, String title, String? composer, PieceStatus status, int? targetBpm, Set<FocusTag> tags
});




}
/// @nodoc
class __$PieceCopyWithImpl<$Res>
    implements _$PieceCopyWith<$Res> {
  __$PieceCopyWithImpl(this._self, this._then);

  final _Piece _self;
  final $Res Function(_Piece) _then;

/// Create a copy of Piece
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? title = null,Object? composer = freezed,Object? status = null,Object? targetBpm = freezed,Object? tags = null,}) {
  return _then(_Piece(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,composer: freezed == composer ? _self.composer : composer // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PieceStatus,targetBpm: freezed == targetBpm ? _self.targetBpm : targetBpm // ignore: cast_nullable_to_non_nullable
as int?,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as Set<FocusTag>,
  ));
}


}

// dart format on
