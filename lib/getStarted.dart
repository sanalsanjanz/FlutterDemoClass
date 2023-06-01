// ignore_for_file: use_build_context_synchronously

import 'package:democlass/constant.dart';
import 'package:democlass/homePage.dart';
import 'package:democlass/widgets/loading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class GetStartedPage extends StatefulWidget {
  const GetStartedPage({super.key});

  @override
  State<GetStartedPage> createState() => _GetStartedPageState();
}

class _GetStartedPageState extends State<GetStartedPage> {
  final FirebaseAuth authentication = FirebaseAuth.instance;

  bool isMalayalam = false;

  bool isEnglish = false;

  bool isHindi = false;

  bool isTamil = false;

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
              style: GoogleFonts.actor(fontSize: 16, color: Colors.black),
              textAlign: TextAlign.center,
            ),
            space,
            /*   AnimatedTextKit(animatedTexts: [
              ColorizeAnimatedText(
                'Demo',
                speed: const Duration(seconds: 2),
                colors: [Colors.red, Colors.blue],
                textStyle:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ]) */
            //  AnimatedText(text: 'Demo', duration: const Duration(seconds: 2)),
            /*   ,
            const SpinKitSpinningLines(
              color: Colors.orange,
            ), */
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                shape: const StadiumBorder(),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ChoiceChip(
                    onSelected: (value) {
                      setState(() {
                        isMalayalam = value;
                        isEnglish = false;
                      });
                    },
                    label: const Text('Malayalam'),
                    selected: isMalayalam),
                ChoiceChip(
                    onSelected: (value) {
                      setState(() {
                        isEnglish = value;
                        isMalayalam = false;
                      });
                    },
                    label: const Text('English'),
                    selected: isEnglish),
                ChoiceChip(label: const Text('Hindi'), selected: isHindi),
                ChoiceChip(label: const Text('Tamil'), selected: isTamil),
              ],
            ),

            /*   ElevatedButton(
              onPressed: () async {
                await _launchUrl();
                // await signup(context);
              },
              child: const Text('Google SignIn'),
            ), */
            const Expanded(
              child: Image(
                image: AssetImage('assets/deliveryboy.png'),
              ),
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
      ProgressDialog.show(context: context);
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final AuthCredential authCredential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);

      // Getting users credential
      UserCredential result =
          await authentication.signInWithCredential(authCredential);
      User? user = result.user;
      ProgressDialog.hide(context);
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

  Future<void> _launchUrl() async {
    var uri = Uri.parse('https://www.flipkart.com/');

    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $uri');
    }
  }
}
