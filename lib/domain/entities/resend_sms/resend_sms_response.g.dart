// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resend_sms_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResendSmsResponse _$ResendSmsResponseFromJson(Map<String, dynamic> json) =>
    ResendSmsResponse(
      (json['code'] as num?)?.toInt(),
      json['isError'] as bool?,
      json['message'] as String?,
      json['data'],
    );

Map<String, dynamic> _$ResendSmsResponseToJson(ResendSmsResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'isError': instance.isError,
      'message': instance.message,
      'data': instance.data,
    };
