// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ai_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AiResponse implements DiagnosticableTreeMixin {

 String get content;
/// Create a copy of AiResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AiResponseCopyWith<AiResponse> get copyWith => _$AiResponseCopyWithImpl<AiResponse>(this as AiResponse, _$identity);

  /// Serializes this AiResponse to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AiResponse'))
    ..add(DiagnosticsProperty('content', content));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AiResponse&&(identical(other.content, content) || other.content == content));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,content);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AiResponse(content: $content)';
}


}

/// @nodoc
abstract mixin class $AiResponseCopyWith<$Res>  {
  factory $AiResponseCopyWith(AiResponse value, $Res Function(AiResponse) _then) = _$AiResponseCopyWithImpl;
@useResult
$Res call({
 String content
});




}
/// @nodoc
class _$AiResponseCopyWithImpl<$Res>
    implements $AiResponseCopyWith<$Res> {
  _$AiResponseCopyWithImpl(this._self, this._then);

  final AiResponse _self;
  final $Res Function(AiResponse) _then;

/// Create a copy of AiResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? content = null,}) {
  return _then(_self.copyWith(
content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AiResponse].
extension AiResponsePatterns on AiResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AiResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AiResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AiResponse value)  $default,){
final _that = this;
switch (_that) {
case _AiResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AiResponse value)?  $default,){
final _that = this;
switch (_that) {
case _AiResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String content)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AiResponse() when $default != null:
return $default(_that.content);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String content)  $default,) {final _that = this;
switch (_that) {
case _AiResponse():
return $default(_that.content);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String content)?  $default,) {final _that = this;
switch (_that) {
case _AiResponse() when $default != null:
return $default(_that.content);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _AiResponse with DiagnosticableTreeMixin implements AiResponse {
  const _AiResponse({required this.content});
  factory _AiResponse.fromJson(Map<String, dynamic> json) => _$AiResponseFromJson(json);

@override final  String content;

/// Create a copy of AiResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AiResponseCopyWith<_AiResponse> get copyWith => __$AiResponseCopyWithImpl<_AiResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AiResponseToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AiResponse'))
    ..add(DiagnosticsProperty('content', content));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AiResponse&&(identical(other.content, content) || other.content == content));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,content);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AiResponse(content: $content)';
}


}

/// @nodoc
abstract mixin class _$AiResponseCopyWith<$Res> implements $AiResponseCopyWith<$Res> {
  factory _$AiResponseCopyWith(_AiResponse value, $Res Function(_AiResponse) _then) = __$AiResponseCopyWithImpl;
@override @useResult
$Res call({
 String content
});




}
/// @nodoc
class __$AiResponseCopyWithImpl<$Res>
    implements _$AiResponseCopyWith<$Res> {
  __$AiResponseCopyWithImpl(this._self, this._then);

  final _AiResponse _self;
  final $Res Function(_AiResponse) _then;

/// Create a copy of AiResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? content = null,}) {
  return _then(_AiResponse(
content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
