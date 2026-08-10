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
mixin _$MetricsState implements DiagnosticableTreeMixin {

 MetricsData get data; bool get isLoading;
/// Create a copy of MetricsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MetricsStateCopyWith<MetricsState> get copyWith => _$MetricsStateCopyWithImpl<MetricsState>(this as MetricsState, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'MetricsState'))
    ..add(DiagnosticsProperty('data', data))..add(DiagnosticsProperty('isLoading', isLoading));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MetricsState&&(identical(other.data, data) || other.data == data)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading));
}


@override
int get hashCode => Object.hash(runtimeType,data,isLoading);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'MetricsState(data: $data, isLoading: $isLoading)';
}


}

/// @nodoc
abstract mixin class $MetricsStateCopyWith<$Res>  {
  factory $MetricsStateCopyWith(MetricsState value, $Res Function(MetricsState) _then) = _$MetricsStateCopyWithImpl;
@useResult
$Res call({
 MetricsData data, bool isLoading
});


$MetricsDataCopyWith<$Res> get data;

}
/// @nodoc
class _$MetricsStateCopyWithImpl<$Res>
    implements $MetricsStateCopyWith<$Res> {
  _$MetricsStateCopyWithImpl(this._self, this._then);

  final MetricsState _self;
  final $Res Function(MetricsState) _then;

/// Create a copy of MetricsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,Object? isLoading = null,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as MetricsData,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of MetricsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MetricsDataCopyWith<$Res> get data {
  
  return $MetricsDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( MetricsData data,  bool isLoading)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MetricsState() when $default != null:
return $default(_that.data,_that.isLoading);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( MetricsData data,  bool isLoading)  $default,) {final _that = this;
switch (_that) {
case _MetricsState():
return $default(_that.data,_that.isLoading);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( MetricsData data,  bool isLoading)?  $default,) {final _that = this;
switch (_that) {
case _MetricsState() when $default != null:
return $default(_that.data,_that.isLoading);case _:
  return null;

}
}

}

/// @nodoc


class _MetricsState with DiagnosticableTreeMixin implements MetricsState {
  const _MetricsState({required this.data, this.isLoading = false});
  

@override final  MetricsData data;
@override@JsonKey() final  bool isLoading;

/// Create a copy of MetricsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MetricsStateCopyWith<_MetricsState> get copyWith => __$MetricsStateCopyWithImpl<_MetricsState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'MetricsState'))
    ..add(DiagnosticsProperty('data', data))..add(DiagnosticsProperty('isLoading', isLoading));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MetricsState&&(identical(other.data, data) || other.data == data)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading));
}


@override
int get hashCode => Object.hash(runtimeType,data,isLoading);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'MetricsState(data: $data, isLoading: $isLoading)';
}


}

/// @nodoc
abstract mixin class _$MetricsStateCopyWith<$Res> implements $MetricsStateCopyWith<$Res> {
  factory _$MetricsStateCopyWith(_MetricsState value, $Res Function(_MetricsState) _then) = __$MetricsStateCopyWithImpl;
@override @useResult
$Res call({
 MetricsData data, bool isLoading
});


@override $MetricsDataCopyWith<$Res> get data;

}
/// @nodoc
class __$MetricsStateCopyWithImpl<$Res>
    implements _$MetricsStateCopyWith<$Res> {
  __$MetricsStateCopyWithImpl(this._self, this._then);

  final _MetricsState _self;
  final $Res Function(_MetricsState) _then;

/// Create a copy of MetricsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,Object? isLoading = null,}) {
  return _then(_MetricsState(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as MetricsData,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of MetricsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MetricsDataCopyWith<$Res> get data {
  
  return $MetricsDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}

// dart format on
