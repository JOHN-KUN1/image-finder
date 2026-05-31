// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'searching_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SearchingState {

 bool get isSearching;
/// Create a copy of SearchingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchingStateCopyWith<SearchingState> get copyWith => _$SearchingStateCopyWithImpl<SearchingState>(this as SearchingState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchingState&&(identical(other.isSearching, isSearching) || other.isSearching == isSearching));
}


@override
int get hashCode => Object.hash(runtimeType,isSearching);

@override
String toString() {
  return 'SearchingState(isSearching: $isSearching)';
}


}

/// @nodoc
abstract mixin class $SearchingStateCopyWith<$Res>  {
  factory $SearchingStateCopyWith(SearchingState value, $Res Function(SearchingState) _then) = _$SearchingStateCopyWithImpl;
@useResult
$Res call({
 bool isSearching
});




}
/// @nodoc
class _$SearchingStateCopyWithImpl<$Res>
    implements $SearchingStateCopyWith<$Res> {
  _$SearchingStateCopyWithImpl(this._self, this._then);

  final SearchingState _self;
  final $Res Function(SearchingState) _then;

/// Create a copy of SearchingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isSearching = null,}) {
  return _then(_self.copyWith(
isSearching: null == isSearching ? _self.isSearching : isSearching // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [SearchingState].
extension SearchingStatePatterns on SearchingState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchingState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchingState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchingState value)  $default,){
final _that = this;
switch (_that) {
case _SearchingState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchingState value)?  $default,){
final _that = this;
switch (_that) {
case _SearchingState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isSearching)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchingState() when $default != null:
return $default(_that.isSearching);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isSearching)  $default,) {final _that = this;
switch (_that) {
case _SearchingState():
return $default(_that.isSearching);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isSearching)?  $default,) {final _that = this;
switch (_that) {
case _SearchingState() when $default != null:
return $default(_that.isSearching);case _:
  return null;

}
}

}

/// @nodoc


class _SearchingState implements SearchingState {
  const _SearchingState({required this.isSearching});
  

@override final  bool isSearching;

/// Create a copy of SearchingState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchingStateCopyWith<_SearchingState> get copyWith => __$SearchingStateCopyWithImpl<_SearchingState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchingState&&(identical(other.isSearching, isSearching) || other.isSearching == isSearching));
}


@override
int get hashCode => Object.hash(runtimeType,isSearching);

@override
String toString() {
  return 'SearchingState(isSearching: $isSearching)';
}


}

/// @nodoc
abstract mixin class _$SearchingStateCopyWith<$Res> implements $SearchingStateCopyWith<$Res> {
  factory _$SearchingStateCopyWith(_SearchingState value, $Res Function(_SearchingState) _then) = __$SearchingStateCopyWithImpl;
@override @useResult
$Res call({
 bool isSearching
});




}
/// @nodoc
class __$SearchingStateCopyWithImpl<$Res>
    implements _$SearchingStateCopyWith<$Res> {
  __$SearchingStateCopyWithImpl(this._self, this._then);

  final _SearchingState _self;
  final $Res Function(_SearchingState) _then;

/// Create a copy of SearchingState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isSearching = null,}) {
  return _then(_SearchingState(
isSearching: null == isSearching ? _self.isSearching : isSearching // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
