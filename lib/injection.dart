import 'package:get/get.dart';
import 'package:univesity_clubs/domain/use_case/login/login_use_case.dart';
import 'package:univesity_clubs/domain/use_case/verification/verification_use_case.dart';
import 'controller/main/main_controller.dart';
import 'data/server/api/api_service.dart';
import 'data/server/auth_interceptor.dart';
import 'data/storage/auth/auth_holder.dart';
import 'data/storage/auth/auth_prefs.dart';

class DIService {
  static Future<void> init() async {
    Get.lazyPut<AuthHolder>(() => AuthPrefs(), fenix: true);
    Get.lazyPut<ApiService>(() => ApiService(Get.find<AuthInterceptor>()), fenix: true);
    Get.lazyPut<AuthInterceptor>(() => AuthInterceptor(Get.find<AuthHolder>()), fenix: true);
    /// controllers
    Get.lazyPut<MainController>(() => MainController(), fenix: true);
    /// use case
    Get.lazyPut<LoginUseCase>(() => LoginUseCase(Get.find()), fenix: true);
    Get.lazyPut<VerificationUseCase>(() => VerificationUseCase(Get.find()), fenix: true);
  }
}



