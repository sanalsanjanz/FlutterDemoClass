import 'dart:async';

import 'package:democlass/getStarted.dart';
import 'package:democlass/page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      getLogin();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[200],
      body: Center(
        child: Lottie.asset('assets/loading.json'),
      ),
    );
  }

  getLogin() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var status = sharedPreferences.getBool('login');
    if (status == true) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (cjd) => GetStartedPage()),
          (route) => false);

      /* Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctc) => const PageTwo(),
        ),
      ); */
    } else {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (cjd) => PageOne()), (route) => false);
    }
  }
}
