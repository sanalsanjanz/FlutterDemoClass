import 'package:democlass/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(
        elevation: 0,
        systemOverlayStyle:
            SystemUiOverlayStyle(statusBarColor: Colors.blueGrey[100]),
        toolbarHeight: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.amber[200],
                  child: const Icon(Icons.person),
                ),
                const VerticalDivider(),
                Text(
                  'How Hungry Are You Today ?',
                  style: textStyle1,
                ),
              ],
            ),
            space,
            space,
            Row(
              children: [
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: InputBorder.none,
                        hintText: 'What would ypu like to eat ?'),
                  ),
                ),
                IconButton(onPressed: () {}, icon: const Icon(Icons.search))
              ],
            ),
            Row(
              children: const [Card()],
            )
          ],
        ),
      ),
    );
  }
}
