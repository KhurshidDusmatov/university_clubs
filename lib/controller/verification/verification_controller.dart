import 'package:bormi/controller/base/base_controller.dart';
import 'package:bormi/controller/home/home_controller.dart';
import 'package:bormi/controller/main/main_controller.dart';
import 'package:bormi/data/tools/service/connectivity_service/connection.dart';
import 'package:bormi/domain/entities/verification/verification_request.dart';
import 'package:bormi/domain/use_case/verification/verification_use_case.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:univesity_clubs/controller/base/base_controller.dart';
import 'package:univesity_clubs/controller/main/main_controller.dart';
import 'package:univesity_clubs/data/tools/const/string.dart';
import 'package:univesity_clubs/data/tools/service/connectivity_service/connection.dart';
import 'package:univesity_clubs/domain/entities/verification/verification_request.dart';
import 'package:univesity_clubs/domain/use_case/verification/verification_use_case.dart';
import 'package:univesity_clubs/view/widgets/snackbar.dart';
import '../../data/storage/auth/auth_holder.dart';

class VerificationController extends BaseController with CodeAutoFill{
  bool isLoading = false;
  var isEnd = false.obs;
  var smsCode=''.obs;
  bool timerFinished=false;
  bool invalidCode=false;
  var messageOtpCode=''.obs;
  String? appSignature;
  TextEditingController codeController = TextEditingController();
  CountdownController countdownController = CountdownController(autoStart: true);
  ResendSmsUseCase resendSmsUseCase;
  VerificationUseCase verificationUseCase;
  VerificationController(this.verificationUseCase, this.resendSmsUseCase);

  @override
  void codeUpdated() {
    Get.log('Code updated');
    update();
  }

  @override
  void onInit() {
    super.onInit();
    listenOtp();
  }
  void listenOtp() async{
    await SmsAutoFill().listenForCode();
  }
  void setSmsCode(String code){
    smsCode.value=code;
    update();
  }
  @override
  void dispose() {
    super.dispose();
    SmsAutoFill().unregisterListener();
  }

  Future<void> startTimer() async {
    timerFinished=false;
    countdownController.start();
    update();
  }
  void stopTimer(){
    countdownController.isCompleted=true;
  }
  void changeCode(String code){
    smsCode.value=code;
    update();
  }

  Future<void> verification ()async{

    if (await CheckNet().checkInternet() == false) {
      Get.snackbar(Strings.appName, Strings.noInternet);
      return;
    }
    //#check field completeness
    if (smsCode.isEmpty) {
      Get.snackbar(Strings.appName, Strings.requiredField);
      return;
    }
    VerificationRequest request =VerificationRequest(Get.find<AuthHolder>().phone,smsCode.value);
    verificationUseCase.invoke(request).listen((event) {
      event.when(
          loading: (){
            isLoading=true;
            update();
          },
          content: (content) async {

            final value = content.toJson();
            if(value['isError']==true){
              Get.snackbar(Strings.appName.tr, value['message'].toString());
            }else if(value['isError']==false){
              Get.find<AuthHolder>().name=content.data?.name??'';
              Get.find<AuthHolder>().authToken=content.data?.token??'';
              Get.find<AuthHolder>().roleList=content.data?.roles??[];
              if (content.data?.phone?.startsWith('+') ?? false) {
                Get.find<AuthHolder>().phone=(content.data?.phone?.substring(1))??'';
              } else {
                Get.find<AuthHolder>().phone=content.data?.phone ?? '';
              }
              Get.find<MainController>().update();
              Get.offAllNamed('/');
            } else {
              Get.snackbar(Strings.appName.tr, Strings.unKnownError);
              return ;
            }
            update();
          },
          error: (error) async {
            if(error=="401"){
              Get.log('ERRORRRR BODYYY::::$error');
              return;
            }
            showSnackBar(text: error.toString());
          }

      );
    }) ..onDone(() {
      isLoading = false;
      update();
    })
      ..addTo(subscribe);
  }

  Future<void> resendSms ()async{

    if (await CheckNet().checkInternet() == false) {
      Get.snackbar(Strings.appName.tr, Strings.noInternet.tr);
      return;
    }

    resendSmsUseCase.invokeResendSms(Get.find<AuthHolder>().phone).listen((event) {
      event.when(
          loading: (){
            isLoading=true;
            update();
          },
          content: (content) async {

            final value = content.toJson();
            if(value['isError']==true){
              Get.snackbar(Strings.appName.tr, value['message'].toString());
            }else if(value['isError']==false){

            } else {
              Get.snackbar(Strings.appName.tr, Strings.unKnownError);
              return ;
            }
            update();
          },
          error: (error) async {
            if (error == "401") {
              print('ERORRRR BODYYY::::$error');
              return;
            }
            showSnackBar(text: error.toString());
          }

      );
    }) ..onDone(() {
      isLoading = false;
      update();
    })
      ..addTo(subscribe);
  }
}
