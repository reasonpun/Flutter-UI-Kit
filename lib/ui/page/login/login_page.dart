import 'package:flutter/material.dart';

import '../../../inherited/login_provider.dart';
import '../../../utils/uidata.dart';
import '../../widgets/login_background.dart';
import 'login_one/login_widget.dart';

enum LoginValidationType { phone, otp }

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  final scaffoldState = GlobalKey<ScaffoldState>();
  Widget loginScaffold() => LoginProvider(
        validationErrorCallback: showValidationError,
        child: Scaffold(
          key: scaffoldState,
          backgroundColor: Color(0xffeeeeee),
          body: Stack(
            fit: StackFit.expand,
            children: <Widget>[LoginBackground(), LoginWidgets()],
          ),
        ),
      );

  showValidationError(LoginValidationType type) {
    scaffoldState.currentState?.showSnackBar(SnackBar(
      content: Text(type == LoginValidationType.phone
          ? UIData.enter_valid_number
          : UIData.enter_valid_otp),
      duration: Duration(seconds: 2),
    ));
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return loginScaffold();
  }
}
