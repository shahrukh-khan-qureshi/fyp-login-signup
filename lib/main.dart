import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:login_signup/screens/login.dart';
import 'package:login_signup/screens/signup.dart';
import 'package:login_signup/screens/splash_screen.dart';
import 'package:login_signup/screens/PatientDashboard';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static String storedPassword = "";
  static String storedEmail = "";

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login / Sign Up ',
      home: AnimatedSplashScreen(
          splash: Container(
            height: 1640,
            width: 720,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/splash.jpg'),
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          duration: 3000,
          splashTransition: SplashTransition.fadeTransition,
          backgroundColor: Colors.white,
          nextScreen: LoginPage()),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // initialRoute: '/splash',
      routes: {
        // '/splash': (context) => SplashScreen(),
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignUpPage(),
        '/dashboard': (context) => PatientDashboard(),
      },
    );
  }
}
