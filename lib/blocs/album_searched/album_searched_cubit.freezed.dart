// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'album_searched_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AlbumSearchedState {

 bool get searchStarted; String get albumName;
/// Create a copy of AlbumSearchedState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AlbumSearchedStateCopyWith<AlbumSearchedState> get copyWith => _$AlbumSearchedStateCopyWithImpl<AlbumSearchedState>(this as AlbumSearchedState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AlbumSearchedState&&(identical(other.searchStarted, searchStarted) || other.searchStarted == searchStarted)&&(identical(other.albumName, albumName) || other.albumName == albumName));
}


@override
int get hashCode => Object.hash(runtimeType,searchStarted,albumName);

@override
String toString() {
  return 'AlbumSearchedState(searchStarted: $searchStarted, albumName: $albumName)';
}


}

/// @nodoc
abstract mixin class $AlbumSearchedStateCopyWith<$Res>  {
  factory $AlbumSearchedStateCopyWith(AlbumSearchedState value, $Res Function(AlbumSearchedState) _then) = _$AlbumSearchedStateCopyWithImpl;
@useResult
$Res call({
 bool searchStarted, String albumName
});




}
/// @nodoc
class _$AlbumSearchedStateCopyWithImpl<$Res>
    implements $AlbumSearchedStateCopyWith<$Res> {
  _$AlbumSearchedStateCopyWithImpl(this._self, this._then);

  final AlbumSearchedState _self;
  final $Res Function(AlbumSearchedState) _then;

/// Create a copy of AlbumSearchedState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? searchStarted = null,Object? albumName = null,}) {
  return _then(_self.copyWith(
searchStarted: null == searchStarted ? _self.searchStarted : searchStarted // ignore: cast_nullable_to_non_nullable
as bool,albumName: null == albumName ? _self.albumName : albumName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AlbumSearchedState].
extension AlbumSearchedStatePatterns on AlbumSearchedState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AlbumSearchedState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AlbumSearchedState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AlbumSearchedState value)  $default,){
final _that = this;
switch (_that) {
case _AlbumSearchedState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AlbumSearchedState value)?  $default,){
final _that = this;
switch (_that) {
case _AlbumSearchedState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool searchStarted,  String albumName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AlbumSearchedState() when $default != null:
return $default(_that.searchStarted,_that.albumName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool searchStarted,  String albumName)  $default,) {final _that = this;
switch (_that) {
case _AlbumSearchedState():
return $default(_that.searchStarted,_that.albumName);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool searchStarted,  String albumName)?  $default,) {final _that = this;
switch (_that) {
case _AlbumSearchedState() when $default != null:
return $default(_that.searchStarted,_that.albumName);case _:
  return null;

}
}

}

/// @nodoc


class _AlbumSearchedState implements AlbumSearchedState {
  const _AlbumSearchedState({required this.searchStarted, required this.albumName});
  

@override final  bool searchStarted;
@override final  String albumName;

/// Create a copy of AlbumSearchedState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AlbumSearchedStateCopyWith<_AlbumSearchedState> get copyWith => __$AlbumSearchedStateCopyWithImpl<_AlbumSearchedState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AlbumSearchedState&&(identical(other.searchStarted, searchStarted) || other.searchStarted == searchStarted)&&(identical(other.albumName, albumName) || other.albumName == albumName));
}


@override
int get hashCode => Object.hash(runtimeType,searchStarted,albumName);

@override
String toString() {
  return 'AlbumSearchedState(searchStarted: $searchStarted, albumName: $albumName)';
}


}

/// @nodoc
abstract mixin class _$AlbumSearchedStateCopyWith<$Res> implements $AlbumSearchedStateCopyWith<$Res> {
  factory _$AlbumSearchedStateCopyWith(_AlbumSearchedState value, $Res Function(_AlbumSearchedState) _then) = __$AlbumSearchedStateCopyWithImpl;
@override @useResult
$Res call({
 bool searchStarted, String albumName
});




}
/// @nodoc
class __$AlbumSearchedStateCopyWithImpl<$Res>
    implements _$AlbumSearchedStateCopyWith<$Res> {
  __$AlbumSearchedStateCopyWithImpl(this._self, this._then);

  final _AlbumSearchedState _self;
  final $Res Function(_AlbumSearchedState) _then;

/// Create a copy of AlbumSearchedState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? searchStarted = null,Object? albumName = null,}) {
  return _then(_AlbumSearchedState(
searchStarted: null == searchStarted ? _self.searchStarted : searchStarted // ignore: cast_nullable_to_non_nullable
as bool,albumName: null == albumName ? _self.albumName : albumName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
