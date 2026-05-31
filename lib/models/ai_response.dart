import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ai_response.freezed.dart';
part 'ai_response.g.dart';

@freezed
sealed class AiResponse with _$AiResponse{
  @JsonSerializable(explicitToJson: true)
  const factory AiResponse({
    required String content
  }) = _AiResponse;

  factory AiResponse.fromJson(Map<String, dynamic> json) => _$AiResponseFromJson(json);
}