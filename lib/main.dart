import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:web_app/screens/login_screen.dart';
import 'package:web_app/screens/rough.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.black,
          primarySwatch: Palette.kToDark,
          iconTheme: IconThemeData(
            color: Colors.black,
          )),
      home: LoginScreen(),
      // home: ExpenseList(),
    );
  }
}

class Palette {
  static const MaterialColor kToDark = const MaterialColor(
    0xff181818, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    const <int, Color>{
      50: Color(0x00ffffff), //10%
      100: Color(0x00e8e8e8), //20%
      200: Color(0x00d1d1d1), //30%
      300: Color(0x00bababa), //40%
      400: Color(0x00a3a3a3), //50%
      500: Color(0x008c8c8c), //60%
      600: Color(0x00747474), //70%
      700: Color(0x005d5d5d), //80%
      800: Color(0x00464646), //90%
      900: Color(0x002f2f2f), 1000: Color(0x00181818), //100%
    },
  );
}
