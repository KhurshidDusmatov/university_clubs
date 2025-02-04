import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart';
import 'package:univesity_clubs/data/server/api/api_service.dart';
import 'package:univesity_clubs/data/server/error_parser.dart';
import 'package:univesity_clubs/domain/data/result/result.dart';
import 'package:univesity_clubs/domain/entities/registration/register_request.dart';
import 'package:univesity_clubs/domain/entities/registration/register_response.dart';


class RegisterUseCase {
  final ApiService _service;

  RegisterUseCase(this._service);

  Stream<Result<RegisterResponse>>? invoke(RegisterRequest request) => _service
      .registration(request, "UZ")
      .map((response) {
    return Result.content(response);
  })
      .onErrorReturnWith(
          (error, stackTrace) => Result.error(ErrorParser.parse(error)))
      .startWith(const Result.loading());
}
