import 'dart:async';

import 'package:rxdart/rxdart.dart';

import '../../model/fetch_process.dart';
import '../viewmodel/user_login_view_model.dart';

class LoginBloc {
  final otpController = StreamController<UserLoginViewModel>();
  final loginController = StreamController<UserLoginViewModel>();
  final apiController = BehaviorSubject<FetchProcess>();
  final otpResendController = StreamController<bool>();
  final otpResultController = BehaviorSubject<bool>();

  Sink<UserLoginViewModel> get otpSink => otpController.sink;

  Sink<UserLoginViewModel> get loginSink => otpController.sink;

  Sink<bool> get resendOtpSink => otpResendController.sink;

  Stream<bool> get otpResult => otpResultController.stream;

  Stream<FetchProcess> get apiResult => apiController.stream;

  LoginBloc() {
    otpController.stream.listen(apiCall);
    otpResendController.stream.listen(resendOtp);
    loginController.stream.listen(apiCall);
  }

  void apiCall(UserLoginViewModel userLogin) async {
    FetchProcess process = new FetchProcess(loading: true);
    //for progress loading
    apiController.add(process);
    if (userLogin.otp == null) {
      process.type = ApiType.performOTP;
      await userLogin.getOtp(userLogin.phoneNumber);
      otpResultController.add(userLogin.otpResult);
    } else {
      process.type = ApiType.performLogin;
      await userLogin.performLogin(userLogin);
    }

    process.loading = false;
    process.response = userLogin.apiResult;
    //for error dialog
    apiController.add(process);
  }

  void resendOtp(bool flag) {
    otpResultController.add(false);
  }

  void dispose() {
    otpController.close();
    otpResendController.close();
    apiController.close();
    otpResultController.close();
    loginController.close();
  }
}
