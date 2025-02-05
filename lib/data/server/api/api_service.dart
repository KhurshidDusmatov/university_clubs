import 'package:retrofit/retrofit.dart';
import 'package:univesity_clubs/data/server/auth_interceptor.dart';
import 'package:univesity_clubs/domain/entities/login/login_request.dart';
import 'package:univesity_clubs/domain/entities/login/login_response.dart';
import 'package:univesity_clubs/domain/entities/registration/register_request.dart';
import 'package:univesity_clubs/domain/entities/registration/register_response.dart';
import 'package:univesity_clubs/domain/entities/resend_sms/resend_sms_response.dart';
import 'package:univesity_clubs/domain/entities/verification/verification_request.dart';
import 'package:univesity_clubs/domain/entities/verification/verification_response.dart';
import 'api_constant.dart';
import 'package:dio/dio.dart';
part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(AuthInterceptor authInterceptor) {
    var options = BaseOptions(
        connectTimeout: Duration(milliseconds: ApiConst.CONNECTION_TIME),
        sendTimeout:Duration(milliseconds:ApiConst.SEND_TIME_OUT),
        baseUrl: ApiConst.Base_URl,
        headers: ApiConst.HEADERS);
    Dio dio = Dio(options);
    dio.interceptors
      ..add(authInterceptor)
      ..add(LogInterceptor(requestBody: true, responseBody: true));

    return _ApiService(dio);
  }

  // auth
  @POST(ApiConst.LOGIN)
  Stream<LoginResponse> login(@Body() LoginRequest request,  @Header('Accept-Language') String lang);
  @POST(ApiConst.VERIFICATION)
  Stream<VerificationResponse> verification(@Body() VerificationRequest request,  @Header('Accept-Language') String lang);
  @POST(ApiConst.REGISTRATION)
  Stream<RegisterResponse> registration(@Body() RegisterRequest request, @Header('Accept-Language') String lang);
  @PUT('${ApiConst.RESEND_SMS}/{phoneNumber}')
  Stream<ResendSmsResponse>resendSms(@Path('phoneNumber') String phoneNumber);

}
