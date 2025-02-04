
import 'package:freezed_annotation/freezed_annotation.dart';

part 'resend_sms_response.g.dart';

@JsonSerializable()
class ResendSmsResponse {
  int? code;
  bool? isError;
  String? message;
  dynamic data;
  ResendSmsResponse(this.code, this.isError,this.message, this.data);

  factory ResendSmsResponse.fromJson(Map<String, dynamic> json) =>
      _$ResendSmsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ResendSmsResponseToJson(this);
}
