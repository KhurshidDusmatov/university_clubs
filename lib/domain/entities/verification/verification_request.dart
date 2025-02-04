
import 'package:freezed_annotation/freezed_annotation.dart';

part 'verification_request.g.dart';

@JsonSerializable()
class VerificationRequest {
  String? phone;
  String? code;

  VerificationRequest( this.phone,this.code);

  factory VerificationRequest.fromJson(Map<String, dynamic> json) =>
      _$VerificationRequestFromJson(json);

  Map<String, dynamic> toJson() => _$VerificationRequestToJson(this);
}
