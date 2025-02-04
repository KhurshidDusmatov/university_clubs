import 'package:univesity_clubs/data/server/api/api_service.dart';
import 'package:univesity_clubs/data/server/error_parser.dart';
import 'package:univesity_clubs/domain/data/result/result.dart';
import 'package:univesity_clubs/domain/entities/login/login_response.dart';
import '../../entities/login/login_request.dart';
import 'package:rxdart/rxdart.dart';
import 'package:get/get.dart';

class LoginUseCase {
  final ApiService _service;

  LoginUseCase(this._service);

  Stream<Result<LoginResponse>> invoke(LoginRequest request) => _service
      .login(request, 'UZ')
      .map((response) {
        return Result.content(response);
      })
      .onErrorReturnWith(
          (error, stackTrace) => Result.error(ErrorParser.parse(error)))
      .startWith(const Result.loading());
}
