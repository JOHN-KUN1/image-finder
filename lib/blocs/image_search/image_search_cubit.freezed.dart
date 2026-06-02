// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'image_search_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ImageSearchState {

 ImageSearchStatus get status; List<Medium> get foundImages; int get processedCount; String get errorMessage;
/// Create a copy of ImageSearchState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ImageSearchStateCopyWith<ImageSearchState> get copyWith => _$ImageSearchStateCopyWithImpl<ImageSearchState>(this as ImageSearchState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ImageSearchState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.foundImages, foundImages)&&(identical(other.processedCount, processedCount) || other.processedCount == processedCount)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(foundImages),processedCount,errorMessage);

@override
String toString() {
  return 'ImageSearchState(status: $status, foundImages: $foundImages, processedCount: $processedCount, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $ImageSearchStateCopyWith<$Res>  {
  factory $ImageSearchStateCopyWith(ImageSearchState value, $Res Function(ImageSearchState) _then) = _$ImageSearchStateCopyWithImpl;
@useResult
$Res call({
 ImageSearchStatus status, List<Medium> foundImages, int processedCount, String errorMessage
});




}
/// @nodoc
class _$ImageSearchStateCopyWithImpl<$Res>
    implements $ImageSearchStateCopyWith<$Res> {
  _$ImageSearchStateCopyWithImpl(this._self, this._then);

  final ImageSearchState _self;
  final $Res Function(ImageSearchState) _then;

/// Create a copy of ImageSearchState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? foundImages = null,Object? processedCount = null,Object? errorMessage = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ImageSearchStatus,foundImages: null == foundImages ? _self.foundImages : foundImages // ignore: cast_nullable_to_non_nullable
as List<Medium>,processedCount: null == processedCount ? _self.processedCount : processedCount // ignore: cast_nullable_to_non_nullable
as int,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ImageSearchState].
extension ImageSearchStatePatterns on ImageSearchState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ImageSearchState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ImageSearchState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ImageSearchState value)  $default,){
final _that = this;
switch (_that) {
case _ImageSearchState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ImageSearchState value)?  $default,){
final _that = this;
switch (_that) {
case _ImageSearchState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ImageSearchStatus status,  List<Medium> foundImages,  int processedCount,  String errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ImageSearchState() when $default != null:
return $default(_that.status,_that.foundImages,_that.processedCount,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ImageSearchStatus status,  List<Medium> foundImages,  int processedCount,  String errorMessage)  $default,) {final _that = this;
switch (_that) {
case _ImageSearchState():
return $default(_that.status,_that.foundImages,_that.processedCount,_that.errorMessage);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ImageSearchStatus status,  List<Medium> foundImages,  int processedCount,  String errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _ImageSearchState() when $default != null:
return $default(_that.status,_that.foundImages,_that.processedCount,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _ImageSearchState implements ImageSearchState {
  const _ImageSearchState({required this.status, required final  List<Medium> foundImages, required this.processedCount, required this.errorMessage}): _foundImages = foundImages;
  

@override final  ImageSearchStatus status;
 final  List<Medium> _foundImages;
@override List<Medium> get foundImages {
  if (_foundImages is EqualUnmodifiableListView) return _foundImages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_foundImages);
}

@override final  int processedCount;
@override final  String errorMessage;

/// Create a copy of ImageSearchState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ImageSearchStateCopyWith<_ImageSearchState> get copyWith => __$ImageSearchStateCopyWithImpl<_ImageSearchState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ImageSearchState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._foundImages, _foundImages)&&(identical(other.processedCount, processedCount) || other.processedCount == processedCount)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_foundImages),processedCount,errorMessage);

@override
String toString() {
  return 'ImageSearchState(status: $status, foundImages: $foundImages, processedCount: $processedCount, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$ImageSearchStateCopyWith<$Res> implements $ImageSearchStateCopyWith<$Res> {
  factory _$ImageSearchStateCopyWith(_ImageSearchState value, $Res Function(_ImageSearchState) _then) = __$ImageSearchStateCopyWithImpl;
@override @useResult
$Res call({
 ImageSearchStatus status, List<Medium> foundImages, int processedCount, String errorMessage
});




}
/// @nodoc
class __$ImageSearchStateCopyWithImpl<$Res>
    implements _$ImageSearchStateCopyWith<$Res> {
  __$ImageSearchStateCopyWithImpl(this._self, this._then);

  final _ImageSearchState _self;
  final $Res Function(_ImageSearchState) _then;

/// Create a copy of ImageSearchState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? foundImages = null,Object? processedCount = null,Object? errorMessage = null,}) {
  return _then(_ImageSearchState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ImageSearchStatus,foundImages: null == foundImages ? _self._foundImages : foundImages // ignore: cast_nullable_to_non_nullable
as List<Medium>,processedCount: null == processedCount ? _self.processedCount : processedCount // ignore: cast_nullable_to_non_nullable
as int,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
