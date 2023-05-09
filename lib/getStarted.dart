import 'package:democlass/constant.dart';
import 'package:democlass/homePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

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
}
