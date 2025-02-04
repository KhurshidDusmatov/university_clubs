
import 'package:freezed_annotation/freezed_annotation.dart';


part 'verification_data.g.dart';

@JsonSerializable()
class VerificationData {
  String? id;
  String? name;
  String? surname;
  String? fatherName;
  String? birthDate;
  String? photo;
  String? phone;
  List<String>? roles;
  String? token;


  VerificationData(
      {this.id,
        this.name,
        this.surname,
        this.fatherName,
        this.birthDate,
        this.photo,
        this.phone,
        this.roles,
        this.token});

  factory VerificationData.fromJson(Map<String, dynamic> json) =>
      _$VerificationDataFromJson(json);

  Map<String, dynamic> toJson() => _$VerificationDataToJson(this);
}


