import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:univesity_clubs/domain/data/verification_data/verification_data.dart';

part 'verification_response.g.dart';

@JsonSerializable()
class VerificationResponse {
  int? code;
  bool? isError;
  String? message;
  VerificationData? data;
  VerificationResponse(this.code, this.isError,this.message, this.data);

  factory VerificationResponse.fromJson(Map<String, dynamic> json) =>
      _$VerificationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$VerificationResponseToJson(this);
}
