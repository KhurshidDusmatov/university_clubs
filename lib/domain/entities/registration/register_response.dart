import 'package:freezed_annotation/freezed_annotation.dart';
part 'register_response.g.dart';

@JsonSerializable()
class RegisterResponse {
  int? code;
  bool? isError;
  String? message;
  dynamic data;
  RegisterResponse(this.code, this.isError,this.message, this.data);

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterResponseToJson(this);
}