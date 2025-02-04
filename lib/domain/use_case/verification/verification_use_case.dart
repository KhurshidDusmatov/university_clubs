import 'package:rxdart/rxdart.dart';
import 'package:univesity_clubs/domain/entities/verification/verification_response.dart';
import '../../../data/server/api/api_service.dart';
import '../../../data/server/error_parser.dart';
import '../../data/result/result.dart';
import '../../entities/verification/verification_request.dart';

class VerificationUseCase {
  final ApiService _service;

  VerificationUseCase(this._service);

  Stream<Result<VerificationResponse>> invoke(VerificationRequest request) => _service
      .verification(request, 'UZ')
      .map((response) {
    return Result.content(response);
  })
      .onErrorReturnWith(
          (error, stackTrace) => Result.error(ErrorParser.parse(error)))
      .startWith(const Result.loading());
}
