// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verification_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerificationResponse _$VerificationResponseFromJson(
        Map<String, dynamic> json) =>
    VerificationResponse(
      (json['code'] as num?)?.toInt(),
      json['isError'] as bool?,
      json['message'] as String?,
      json['data'] == null
          ? null
          : VerificationData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VerificationResponseToJson(
        VerificationResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'isError': instance.isError,
      'message': instance.message,
      'data': instance.data,
    };
