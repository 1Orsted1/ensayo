// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'theme_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ThemeEvent implements DiagnosticableTreeMixin {




@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ThemeEvent'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ThemeEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ThemeEvent()';
}


}

/// @nodoc
class $ThemeEventCopyWith<$Res>  {
$ThemeEventCopyWith(ThemeEvent _, $Res Function(ThemeEvent) __);
}


/// Adds pattern-matching-related methods to [ThemeEvent].
extension ThemeEventPatterns on ThemeEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _GetTheme value)?  getTheme,TResult Function( _SetTheme value)?  setTheme,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetTheme() when getTheme != null:
return getTheme(_that);case _SetTheme() when setTheme != null:
return setTheme(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _GetTheme value)  getTheme,required TResult Function( _SetTheme value)  setTheme,}){
final _that = this;
switch (_that) {
case _GetTheme():
return getTheme(_that);case _SetTheme():
return setTheme(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _GetTheme value)?  getTheme,TResult? Function( _SetTheme value)?  setTheme,}){
final _that = this;
switch (_that) {
case _GetTheme() when getTheme != null:
return getTheme(_that);case _SetTheme() when setTheme != null:
return setTheme(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  getTheme,TResult Function( SelectedTheme selectedTheme)?  setTheme,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GetTheme() when getTheme != null:
return getTheme();case _SetTheme() when setTheme != null:
return setTheme(_that.selectedTheme);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  getTheme,required TResult Function( SelectedTheme selectedTheme)  setTheme,}) {final _that = this;
switch (_that) {
case _GetTheme():
return getTheme();case _SetTheme():
return setTheme(_that.selectedTheme);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  getTheme,TResult? Function( SelectedTheme selectedTheme)?  setTheme,}) {final _that = this;
switch (_that) {
case _GetTheme() when getTheme != null:
return getTheme();case _SetTheme() when setTheme != null:
return setTheme(_that.selectedTheme);case _:
  return null;

}
}

}

/// @nodoc


class _GetTheme with DiagnosticableTreeMixin implements ThemeEvent {
  const _GetTheme();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ThemeEvent.getTheme'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetTheme);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ThemeEvent.getTheme()';
}


}




/// @nodoc


class _SetTheme with DiagnosticableTreeMixin implements ThemeEvent {
  const _SetTheme({required this.selectedTheme});
  

 final  SelectedTheme selectedTheme;

/// Create a copy of ThemeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetThemeCopyWith<_SetTheme> get copyWith => __$SetThemeCopyWithImpl<_SetTheme>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ThemeEvent.setTheme'))
    ..add(DiagnosticsProperty('selectedTheme', selectedTheme));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetTheme&&(identical(other.selectedTheme, selectedTheme) || other.selectedTheme == selectedTheme));
}


@override
int get hashCode => Object.hash(runtimeType,selectedTheme);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ThemeEvent.setTheme(selectedTheme: $selectedTheme)';
}


}

/// @nodoc
abstract mixin class _$SetThemeCopyWith<$Res> implements $ThemeEventCopyWith<$Res> {
  factory _$SetThemeCopyWith(_SetTheme value, $Res Function(_SetTheme) _then) = __$SetThemeCopyWithImpl;
@useResult
$Res call({
 SelectedTheme selectedTheme
});




}
/// @nodoc
class __$SetThemeCopyWithImpl<$Res>
    implements _$SetThemeCopyWith<$Res> {
  __$SetThemeCopyWithImpl(this._self, this._then);

  final _SetTheme _self;
  final $Res Function(_SetTheme) _then;

/// Create a copy of ThemeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? selectedTheme = null,}) {
  return _then(_SetTheme(
selectedTheme: null == selectedTheme ? _self.selectedTheme : selectedTheme // ignore: cast_nullable_to_non_nullable
as SelectedTheme,
  ));
}


}

/// @nodoc
mixin _$ThemeState implements DiagnosticableTreeMixin {

 SelectedTheme get selectedTheme;
/// Create a copy of ThemeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ThemeStateCopyWith<ThemeState> get copyWith => _$ThemeStateCopyWithImpl<ThemeState>(this as ThemeState, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ThemeState'))
    ..add(DiagnosticsProperty('selectedTheme', selectedTheme));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ThemeState&&(identical(other.selectedTheme, selectedTheme) || other.selectedTheme == selectedTheme));
}


@override
int get hashCode => Object.hash(runtimeType,selectedTheme);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ThemeState(selectedTheme: $selectedTheme)';
}


}

/// @nodoc
abstract mixin class $ThemeStateCopyWith<$Res>  {
  factory $ThemeStateCopyWith(ThemeState value, $Res Function(ThemeState) _then) = _$ThemeStateCopyWithImpl;
@useResult
$Res call({
 SelectedTheme selectedTheme
});




}
/// @nodoc
class _$ThemeStateCopyWithImpl<$Res>
    implements $ThemeStateCopyWith<$Res> {
  _$ThemeStateCopyWithImpl(this._self, this._then);

  final ThemeState _self;
  final $Res Function(ThemeState) _then;

/// Create a copy of ThemeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? selectedTheme = null,}) {
  return _then(_self.copyWith(
selectedTheme: null == selectedTheme ? _self.selectedTheme : selectedTheme // ignore: cast_nullable_to_non_nullable
as SelectedTheme,
  ));
}

}


/// Adds pattern-matching-related methods to [ThemeState].
extension ThemeStatePatterns on ThemeState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Initial value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Initial value)  $default,){
final _that = this;
switch (_that) {
case _Initial():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Initial value)?  $default,){
final _that = this;
switch (_that) {
case _Initial() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SelectedTheme selectedTheme)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when $default != null:
return $default(_that.selectedTheme);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SelectedTheme selectedTheme)  $default,) {final _that = this;
switch (_that) {
case _Initial():
return $default(_that.selectedTheme);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SelectedTheme selectedTheme)?  $default,) {final _that = this;
switch (_that) {
case _Initial() when $default != null:
return $default(_that.selectedTheme);case _:
  return null;

}
}

}

/// @nodoc


class _Initial with DiagnosticableTreeMixin implements ThemeState {
  const _Initial({required this.selectedTheme});
  

@override final  SelectedTheme selectedTheme;

/// Create a copy of ThemeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InitialCopyWith<_Initial> get copyWith => __$InitialCopyWithImpl<_Initial>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ThemeState'))
    ..add(DiagnosticsProperty('selectedTheme', selectedTheme));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial&&(identical(other.selectedTheme, selectedTheme) || other.selectedTheme == selectedTheme));
}


@override
int get hashCode => Object.hash(runtimeType,selectedTheme);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ThemeState(selectedTheme: $selectedTheme)';
}


}

/// @nodoc
abstract mixin class _$InitialCopyWith<$Res> implements $ThemeStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) _then) = __$InitialCopyWithImpl;
@override @useResult
$Res call({
 SelectedTheme selectedTheme
});




}
/// @nodoc
class __$InitialCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(this._self, this._then);

  final _Initial _self;
  final $Res Function(_Initial) _then;

/// Create a copy of ThemeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? selectedTheme = null,}) {
  return _then(_Initial(
selectedTheme: null == selectedTheme ? _self.selectedTheme : selectedTheme // ignore: cast_nullable_to_non_nullable
as SelectedTheme,
  ));
}


}

// dart format on
