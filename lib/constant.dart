import 'package:flutter/material.dart';

TextStyle textStyle =
    const TextStyle(fontSize: 26, fontWeight: FontWeight.bold);
TextStyle itemStyle = const TextStyle(
    fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87);
TextStyle textStyle1 = const TextStyle(fontSize: 16);
Widget space = const SizedBox(
  height: 10,
);
/* // function to implement the google signin

// creating firebase instance
final FirebaseAuth auth = FirebaseAuth.instance;

Future<void> signup(BuildContext context) async {
	final GoogleSignIn googleSignIn = GoogleSignIn();
	final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
	if (googleSignInAccount != null) {
	final GoogleSignInAuthentication googleSignInAuthentication =
		await googleSignInAccount.authentication;
	final AuthCredential authCredential = GoogleAuthProvider.credential(
		idToken: googleSignInAuthentication.idToken,
		accessToken: googleSignInAuthentication.accessToken);
	
	// Getting users credential
	UserCredential result = await auth.signInWithCredential(authCredential);
	User user = result.user;
	
	if (result != null) {
		Navigator.pushReplacement(
			context, MaterialPageRoute(builder: (context) => HomePage()));
	} // if result not null we simply call the MaterialpageRoute,
		// for go to the HomePage screen
	}
}
 */