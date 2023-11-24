import 'dart:developer';

import 'package:chat_app/api/apis.dart';
import 'package:chat_app/screens/auth/login_screen.dart';
import 'package:chat_app/screens/home_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../main.dart';
import 'package:flutter/widgets.dart';

// splash screen
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(milliseconds: 1500), () {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle(statusBarColor: Colors.white));

      if (APIs.auth.currentUser != null) {
        log('\nUser:${APIs.auth.currentUser}');

        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const HomeScreen()));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const LoginScreen()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
              top: mq.height * .20,
              width: mq.width * 0.5,
              child: Image.asset('images/icon.png')),
          Positioned(
              bottom: mq.height * .20,
              child: const Text('Made By Chirag Gautam 💙',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 22, color: Color.fromARGB(255, 60, 58, 58)))),
        ],
      ),
    );
  }
}
