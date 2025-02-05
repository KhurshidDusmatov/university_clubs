import 'package:get/get.dart';
import '../../storage/auth/auth_holder.dart';

class ApiConst {
  static const CONNECTION_TIME = 20000;
  static const SEND_TIME_OUT = 20000;
  static const String Base_URl = "https://api.bormi.uz";

  static  Map<String,String> HEADERS = {
    'Content-type' : 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer ${Get.find<AuthHolder>().authToken}',
    'Accept-Language': "UZ",
  };

  static Map<String, String> QUERY = {
    "page": "0",
    "size": "50",
  };

  static const String LOGIN = "/api/v1/auth/login";
  static const String REGISTRATION = "/api/v1/auth/registration";
  static const String VERIFICATION = "/api/v1/auth/verify";
  static const String RESEND_SMS = "/api/v1/auth/resend/sms";

}