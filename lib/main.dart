import 'package:flutter/material.dart';

import 'di/dependency_injection.dart';
import 'myapp.dart';

void main() {
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  Injector.configure(Flavor.MOCK);
  runApp(MyApp());
}
