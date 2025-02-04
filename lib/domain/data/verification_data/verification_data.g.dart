// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verification_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerificationData _$VerificationDataFromJson(Map<String, dynamic> json) =>
    VerificationData(
      id: json['id'] as String?,
      name: json['name'] as String?,
      surname: json['surname'] as String?,
      fatherName: json['fatherName'] as String?,
      birthDate: json['birthDate'] as String?,
      photo: json['photo'] as String?,
      phone: json['phone'] as String?,
      roles:
          (json['roles'] as List<dynamic>?)?.map((e) => e as String).toList(),
      token: json['token'] as String?,
    );

Map<String, dynamic> _$VerificationDataToJson(VerificationData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'surname': instance.surname,
      'fatherName': instance.fatherName,
      'birthDate': instance.birthDate,
      'photo': instance.photo,
      'phone': instance.phone,
      'roles': instance.roles,
      'token': instance.token,
    };
