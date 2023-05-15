// ignore_for_file: use_build_context_synchronously

import 'package:democlass/constant.dart';
import 'package:democlass/homePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetStartedPage extends StatelessWidget {
  GetStartedPage({super.key});
  final FirebaseAuth authentication = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        systemOverlayStyle:
            SystemUiOverlayStyle(statusBarColor: Colors.blueGrey[100]),
        toolbarHeight: 0,
      ),
      backgroundColor: Colors.blueGrey[100],
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Expanded(child: SizedBox()),
            Text(
              'Get',
              style: textStyle,
            ),
            space,
            Text(
              'the Fastest',
              style: textStyle,
            ),
            space,
            Text(
              'Delivery',
              style: textStyle,
            ),
            space,
            Text(
              'website or app that allows customers to view the menu and place an order, and an admin interface that enables the restaurant to receive and fulfil customer orders.',
              style: textStyle1,
              textAlign: TextAlign.center,
            ),
            space,
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                shape: const CircleBorder(),
              ),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (cgf) => const HomePage()),
                    (route) => false);
              },
              child: const Icon(Icons.arrow_forward_ios_outlined),
            ),
            const Text('Get Started'),
            ElevatedButton(
              onPressed: () async {
                await signup(context);
              },
              child: const Text('Google SignIn'),
            ),
            const Expanded(
              child: SizedBox(),
            ),
            const Image(
              image: AssetImage('assets/deliveryboy.png'),
            )
          ],
        ),
      ),
    );
  }

  Future<void> signup(BuildContext context) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final AuthCredential authCredential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);

      // Getting users credential
      UserCredential result =
          await authentication.signInWithCredential(authCredential);
      User? user = result.user;

      if (user != null) {
        await saveUserDetails(
            name: user.displayName.toString(),
            photoUrl: user.photoURL.toString(),
            email: user.email.toString());
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const HomePage()));
// if result not null we simply call the MaterialpageRoute,
        // for go to the HomePage screen
      }
    }
  }

  saveUserDetails(
      {required String name,
      required String photoUrl,
      required String email}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('name', name);
    sharedPreferences.setString('photo', photoUrl);
    sharedPreferences.setString('mail', email);
  }
}
