// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterResponse _$RegisterResponseFromJson(Map<String, dynamic> json) =>
    RegisterResponse(
      (json['code'] as num?)?.toInt(),
      json['isError'] as bool?,
      json['message'] as String?,
      json['data'],
    );

Map<String, dynamic> _$RegisterResponseToJson(RegisterResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'isError': instance.isError,
      'message': instance.message,
      'data': instance.data,
    };
