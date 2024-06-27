import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skhuthon_app/screen/Login/loginScreen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context, child) => MaterialApp(
        theme: ThemeData(fontFamily: "NaNumPen", useMaterial3: true),
        title: 'SweetLittleKitty',
        home: LoginScreen(),
      ),
    );
  }
}
