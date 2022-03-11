import 'dart:async';
import 'package:meta/meta.dart';

import '../../di/dependency_injection.dart';
import '../../model/login.dart';
import '../../model/otp.dart';
import '../../services/abstract/i_otp_service.dart';
import '../../services/network_service_response.dart';

class UserLoginViewModel {
  String phoneNumber;
  late String otp;
  bool otpResult = false;
  late NetworkServiceResponse apiResult;
  IOTPService otpRepo = new Injector().otpService;

  //for otp
  UserLoginViewModel({required this.phoneNumber});

  //for login
  UserLoginViewModel.withOTP({required this.phoneNumber, required this.otp});

  Future<Null> getOtp(String phoneNumber) async {
    NetworkServiceResponse<CreateOTPResponse> result =
        await otpRepo.createOTP(phoneNumber);
    this.otpResult = result.success;
    this.apiResult = result;
  }

  Future<Null> performLogin(UserLoginViewModel userLogin) async {
    NetworkServiceResponse<OTPResponse> result =
        await otpRepo.fetchOTPLoginResponse(
            Login(phonenumber: userLogin.phoneNumber, otp: userLogin.otp));
    this.apiResult = result;
  }
}
