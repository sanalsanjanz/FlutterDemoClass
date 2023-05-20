import 'dart:async';

import 'package:democlass/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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
    return const Scaffold(
      backgroundColor: Colors.purple,
      body: Center(
          child: SpinKitFoldingCube(
        color: Colors.white,
      )),
    );
  }

  getLogin() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var status = sharedPreferences.getBool('login');
    if (status == true) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (cjd) => const Search()),
          (route) => false);

      /* Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctc) => const PageTwo(),
        ),
      ); */
    } else {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (cjd) => const Search()),
          (route) => false);
    }
  }
}
