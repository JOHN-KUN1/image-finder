// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'found_images_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FoundImagesState {

 List<Medium> get images;
/// Create a copy of FoundImagesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FoundImagesStateCopyWith<FoundImagesState> get copyWith => _$FoundImagesStateCopyWithImpl<FoundImagesState>(this as FoundImagesState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FoundImagesState&&const DeepCollectionEquality().equals(other.images, images));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(images));

@override
String toString() {
  return 'FoundImagesState(images: $images)';
}


}

/// @nodoc
abstract mixin class $FoundImagesStateCopyWith<$Res>  {
  factory $FoundImagesStateCopyWith(FoundImagesState value, $Res Function(FoundImagesState) _then) = _$FoundImagesStateCopyWithImpl;
@useResult
$Res call({
 List<Medium> images
});




}
/// @nodoc
class _$FoundImagesStateCopyWithImpl<$Res>
    implements $FoundImagesStateCopyWith<$Res> {
  _$FoundImagesStateCopyWithImpl(this._self, this._then);

  final FoundImagesState _self;
  final $Res Function(FoundImagesState) _then;

/// Create a copy of FoundImagesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? images = null,}) {
  return _then(_self.copyWith(
images: null == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<Medium>,
  ));
}

}


/// Adds pattern-matching-related methods to [FoundImagesState].
extension FoundImagesStatePatterns on FoundImagesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FoundImagesState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FoundImagesState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FoundImagesState value)  $default,){
final _that = this;
switch (_that) {
case _FoundImagesState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FoundImagesState value)?  $default,){
final _that = this;
switch (_that) {
case _FoundImagesState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Medium> images)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FoundImagesState() when $default != null:
return $default(_that.images);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Medium> images)  $default,) {final _that = this;
switch (_that) {
case _FoundImagesState():
return $default(_that.images);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Medium> images)?  $default,) {final _that = this;
switch (_that) {
case _FoundImagesState() when $default != null:
return $default(_that.images);case _:
  return null;

}
}

}

/// @nodoc


class _FoundImagesState implements FoundImagesState {
  const _FoundImagesState({required final  List<Medium> images}): _images = images;
  

 final  List<Medium> _images;
@override List<Medium> get images {
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_images);
}


/// Create a copy of FoundImagesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FoundImagesStateCopyWith<_FoundImagesState> get copyWith => __$FoundImagesStateCopyWithImpl<_FoundImagesState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FoundImagesState&&const DeepCollectionEquality().equals(other._images, _images));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_images));

@override
String toString() {
  return 'FoundImagesState(images: $images)';
}


}

/// @nodoc
abstract mixin class _$FoundImagesStateCopyWith<$Res> implements $FoundImagesStateCopyWith<$Res> {
  factory _$FoundImagesStateCopyWith(_FoundImagesState value, $Res Function(_FoundImagesState) _then) = __$FoundImagesStateCopyWithImpl;
@override @useResult
$Res call({
 List<Medium> images
});




}
/// @nodoc
class __$FoundImagesStateCopyWithImpl<$Res>
    implements _$FoundImagesStateCopyWith<$Res> {
  __$FoundImagesStateCopyWithImpl(this._self, this._then);

  final _FoundImagesState _self;
  final $Res Function(_FoundImagesState) _then;

/// Create a copy of FoundImagesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? images = null,}) {
  return _then(_FoundImagesState(
images: null == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<Medium>,
  ));
}


}

// dart format on
