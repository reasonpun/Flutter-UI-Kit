import 'package:flutter/material.dart';

class LoginProvider extends InheritedWidget {
  final Function validationErrorCallback;
  final Widget child;

  LoginProvider({
    required this.validationErrorCallback,
    required this.child,
  }) : super(child: child);

  static LoginProvider? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<LoginProvider>();

  @override
  bool updateShouldNotify(LoginProvider oldWidget) =>
      validationErrorCallback != oldWidget.validationErrorCallback;
}
