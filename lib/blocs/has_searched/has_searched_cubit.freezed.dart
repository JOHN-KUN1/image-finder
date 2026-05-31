// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'has_searched_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HasSearchedState {

 bool get hasSearched;
/// Create a copy of HasSearchedState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HasSearchedStateCopyWith<HasSearchedState> get copyWith => _$HasSearchedStateCopyWithImpl<HasSearchedState>(this as HasSearchedState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HasSearchedState&&(identical(other.hasSearched, hasSearched) || other.hasSearched == hasSearched));
}


@override
int get hashCode => Object.hash(runtimeType,hasSearched);

@override
String toString() {
  return 'HasSearchedState(hasSearched: $hasSearched)';
}


}

/// @nodoc
abstract mixin class $HasSearchedStateCopyWith<$Res>  {
  factory $HasSearchedStateCopyWith(HasSearchedState value, $Res Function(HasSearchedState) _then) = _$HasSearchedStateCopyWithImpl;
@useResult
$Res call({
 bool hasSearched
});




}
/// @nodoc
class _$HasSearchedStateCopyWithImpl<$Res>
    implements $HasSearchedStateCopyWith<$Res> {
  _$HasSearchedStateCopyWithImpl(this._self, this._then);

  final HasSearchedState _self;
  final $Res Function(HasSearchedState) _then;

/// Create a copy of HasSearchedState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? hasSearched = null,}) {
  return _then(_self.copyWith(
hasSearched: null == hasSearched ? _self.hasSearched : hasSearched // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [HasSearchedState].
extension HasSearchedStatePatterns on HasSearchedState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HasSearchedState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HasSearchedState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HasSearchedState value)  $default,){
final _that = this;
switch (_that) {
case _HasSearchedState():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HasSearchedState value)?  $default,){
final _that = this;
switch (_that) {
case _HasSearchedState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool hasSearched)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HasSearchedState() when $default != null:
return $default(_that.hasSearched);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool hasSearched)  $default,) {final _that = this;
switch (_that) {
case _HasSearchedState():
return $default(_that.hasSearched);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool hasSearched)?  $default,) {final _that = this;
switch (_that) {
case _HasSearchedState() when $default != null:
return $default(_that.hasSearched);case _:
  return null;

}
}

}

/// @nodoc


class _HasSearchedState implements HasSearchedState {
  const _HasSearchedState({required this.hasSearched});
  

@override final  bool hasSearched;

/// Create a copy of HasSearchedState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HasSearchedStateCopyWith<_HasSearchedState> get copyWith => __$HasSearchedStateCopyWithImpl<_HasSearchedState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HasSearchedState&&(identical(other.hasSearched, hasSearched) || other.hasSearched == hasSearched));
}


@override
int get hashCode => Object.hash(runtimeType,hasSearched);

@override
String toString() {
  return 'HasSearchedState(hasSearched: $hasSearched)';
}


}

/// @nodoc
abstract mixin class _$HasSearchedStateCopyWith<$Res> implements $HasSearchedStateCopyWith<$Res> {
  factory _$HasSearchedStateCopyWith(_HasSearchedState value, $Res Function(_HasSearchedState) _then) = __$HasSearchedStateCopyWithImpl;
@override @useResult
$Res call({
 bool hasSearched
});




}
/// @nodoc
class __$HasSearchedStateCopyWithImpl<$Res>
    implements _$HasSearchedStateCopyWith<$Res> {
  __$HasSearchedStateCopyWithImpl(this._self, this._then);

  final _HasSearchedState _self;
  final $Res Function(_HasSearchedState) _then;

/// Create a copy of HasSearchedState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? hasSearched = null,}) {
  return _then(_HasSearchedState(
hasSearched: null == hasSearched ? _self.hasSearched : hasSearched // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
