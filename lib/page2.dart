import 'package:flutter/material.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Center(child: Text('data')),
            ),
            Card(
              child: ListTile(
                onTap: () {},
                // tileColor: Colors.red,
                title: const Text('Item One'),
                subtitle: const Text('item details'),
              ),
            ),
            const Card(
              child: ListTile(
                // tileColor: Colors.red,
                title: Text('Item Two'),
                subtitle: Text('item details'),
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(),
      backgroundColor: const Color.fromARGB(255, 234, 236, 238),
      body: Column(
        children: const [
          Hero(
            tag: 'img',
            child: Image(
              image: AssetImage('assets/image1.jpg'),
            ),
          ),
          CircleAvatar(
            radius: 70,
            backgroundImage: AssetImage('assets/image1.jpg'),
          )
        ],
      ),
    );
  }
}
