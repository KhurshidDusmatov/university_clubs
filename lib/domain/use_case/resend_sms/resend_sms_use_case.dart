import 'package:rxdart/rxdart.dart';
import 'package:univesity_clubs/domain/entities/resend_sms/resend_sms_response.dart';
import '../../../data/server/api/api_service.dart';
import '../../../data/server/error_parser.dart';
import '../../data/result/result.dart';

class ResendSmsUseCase {
  final ApiService _service;

  ResendSmsUseCase(this._service);

  Stream<Result<ResendSmsResponse>> invokeResendSms(String phone) =>
      _service
          .resendSms(phone)
          .map((response) {
        return Result.content(response);
      })
          .onErrorReturnWith(
              (error, stackTrace) => Result.error(ErrorParser.parse(error)))
          .startWith(const Result.loading());


}
