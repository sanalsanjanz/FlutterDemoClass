import 'package:democlass/homePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  Login({super.key});
  TextEditingController emailAddress = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextField(
            controller: emailAddress,
          ),
          TextField(
            controller: password,
          ),
          ElevatedButton(
              onPressed: () async {
                await googleSignin(context);
              },
              child: const Text('SignUp'))
        ],
      ),
    );
  }

  Future createAccount(BuildContext context) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: emailAddress.text,
            password: password.text,
          )
          .then((value) => Navigator.of(context)
              .push(MaterialPageRoute(builder: (ctn) => const HomePage())));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  googleSignin(BuildContext context) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: emailAddress.text, password: password.text)
          .then((value) => Navigator.of(context)
              .push(MaterialPageRoute(builder: (ctn) => const HomePage())));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }
}
