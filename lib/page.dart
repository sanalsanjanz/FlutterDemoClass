import 'package:democlass/page2.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PageOne extends StatelessWidget {
  PageOne({super.key});
  Widget space = const SizedBox(height: 20);
  final formkey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formkey,
            child: Column(
              children: [
                const InkWell(
                  child: Hero(
                    tag: 'img',
                    child: Image(
                      image: AssetImage('assets/image1.jpg'),
                    ),
                  ),
                ),
                space,
                TextFormField(
                  controller: usernameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please enter a value';
                    } else if (value.length < 3) {
                      return 'user name must have atleast 4 letters';
                    } else {
                      return null;
                    }
                  },
                  decoration: const InputDecoration(
                      hintText: 'User name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      )),
                ),
                space,
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                  ),
                ),
                space,
                SizedBox(
                  width: 100,
                  height: 45,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink,
                        shape: const StadiumBorder()),
                    onPressed: () async {
                      if (formkey.currentState!.validate()) {
                        await saveLogin(context);
                      }
                    },
                    child: const Text('Login'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future saveLogin(BuildContext context) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setBool('login', true);
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctc) => const PageTwo(),
      ),
    );
  }
}
