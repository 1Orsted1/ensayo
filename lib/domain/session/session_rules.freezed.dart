// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_rules.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$StaleOutcome {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StaleOutcome);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'StaleOutcome()';
}


}

/// @nodoc
class $StaleOutcomeCopyWith<$Res>  {
$StaleOutcomeCopyWith(StaleOutcome _, $Res Function(StaleOutcome) __);
}


/// Adds pattern-matching-related methods to [StaleOutcome].
extension StaleOutcomePatterns on StaleOutcome {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Resume value)?  resume,TResult Function( _FinishAt value)?  finishAt,TResult Function( _Discard value)?  discard,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Resume() when resume != null:
return resume(_that);case _FinishAt() when finishAt != null:
return finishAt(_that);case _Discard() when discard != null:
return discard(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Resume value)  resume,required TResult Function( _FinishAt value)  finishAt,required TResult Function( _Discard value)  discard,}){
final _that = this;
switch (_that) {
case _Resume():
return resume(_that);case _FinishAt():
return finishAt(_that);case _Discard():
return discard(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Resume value)?  resume,TResult? Function( _FinishAt value)?  finishAt,TResult? Function( _Discard value)?  discard,}){
final _that = this;
switch (_that) {
case _Resume() when resume != null:
return resume(_that);case _FinishAt() when finishAt != null:
return finishAt(_that);case _Discard() when discard != null:
return discard(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  resume,TResult Function( DateTime at)?  finishAt,TResult Function()?  discard,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Resume() when resume != null:
return resume();case _FinishAt() when finishAt != null:
return finishAt(_that.at);case _Discard() when discard != null:
return discard();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  resume,required TResult Function( DateTime at)  finishAt,required TResult Function()  discard,}) {final _that = this;
switch (_that) {
case _Resume():
return resume();case _FinishAt():
return finishAt(_that.at);case _Discard():
return discard();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  resume,TResult? Function( DateTime at)?  finishAt,TResult? Function()?  discard,}) {final _that = this;
switch (_that) {
case _Resume() when resume != null:
return resume();case _FinishAt() when finishAt != null:
return finishAt(_that.at);case _Discard() when discard != null:
return discard();case _:
  return null;

}
}

}

/// @nodoc


class _Resume implements StaleOutcome {
  const _Resume();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Resume);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'StaleOutcome.resume()';
}


}




/// @nodoc


class _FinishAt implements StaleOutcome {
  const _FinishAt(this.at);
  

 final  DateTime at;

/// Create a copy of StaleOutcome
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FinishAtCopyWith<_FinishAt> get copyWith => __$FinishAtCopyWithImpl<_FinishAt>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FinishAt&&(identical(other.at, at) || other.at == at));
}


@override
int get hashCode => Object.hash(runtimeType,at);

@override
String toString() {
  return 'StaleOutcome.finishAt(at: $at)';
}


}

/// @nodoc
abstract mixin class _$FinishAtCopyWith<$Res> implements $StaleOutcomeCopyWith<$Res> {
  factory _$FinishAtCopyWith(_FinishAt value, $Res Function(_FinishAt) _then) = __$FinishAtCopyWithImpl;
@useResult
$Res call({
 DateTime at
});




}
/// @nodoc
class __$FinishAtCopyWithImpl<$Res>
    implements _$FinishAtCopyWith<$Res> {
  __$FinishAtCopyWithImpl(this._self, this._then);

  final _FinishAt _self;
  final $Res Function(_FinishAt) _then;

/// Create a copy of StaleOutcome
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? at = null,}) {
  return _then(_FinishAt(
null == at ? _self.at : at // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

/// @nodoc


class _Discard implements StaleOutcome {
  const _Discard();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Discard);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'StaleOutcome.discard()';
}


}




// dart format on
