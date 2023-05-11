import 'package:democlass/constant.dart';
import 'package:democlass/viewItemDetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool pizzaSelected = true;
  bool saladSelected = true;
  bool shakeSelected = true;
  var rateofPizza = '500';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*   bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.home),la)
      ]), */
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(
        elevation: 0,
        systemOverlayStyle:
            SystemUiOverlayStyle(statusBarColor: Colors.blueGrey[100]),
        toolbarHeight: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
              IconButton(
                tooltip: 'Search',
                onPressed: () {
                  print('search');
                },
                icon: const Icon(Icons.search),
              ),
            ],
          ),
          space,
          Text(
            'Choose Catogory',
            style: textStyle1,
          ),
          space,
          SizedBox(
            height: 200,
            child: ListView(
              padding: const EdgeInsets.all(8),
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: [
                ItemsCard(
                    itemName: 'PIZZA',
                    asset: 'assets/pizza.png',
                    onTap: () {
                      setState(() {
                        pizzaSelected = true;
                        saladSelected = false;
                        shakeSelected = false;
                      });
                    }),
                ItemsCard(
                    itemName: 'SALAD',
                    asset: 'assets/salad.png',
                    onTap: () {
                      setState(() {
                        pizzaSelected = false;
                        saladSelected = true;
                        shakeSelected = false;
                      });
                    }),
                ItemsCard(
                    itemName: 'SHAKES',
                    asset: 'assets/shake.png',
                    onTap: () {
                      setState(() {
                        pizzaSelected = false;
                        saladSelected = false;
                        shakeSelected = true;
                      });
                    })
              ],
            ),
          ),
          // space,
          Container(
            padding: const EdgeInsets.only(right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {
                      setState(() {
                        pizzaSelected = true;
                        saladSelected = true;
                        shakeSelected = true;
                      });
                    },
                    child: const Text('View All'))
              ],
            ),
          ),
          // space,
          Expanded(
            child: Container(
              color: Colors.black38,
              // height: 300,
              child: ListView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(5),
                // crossAxisSpacing: 10.0,
                // mainAxisSpacing: 10.0,
                shrinkWrap: true,
                // crossAxisCount: 2,
                children: [
                  Visibility(
                    visible: pizzaSelected,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: SizedBox(
                        height: 150,
                        // color: Colors.blue,
                        child: Column(
                          children: [
                            const Flexible(
                              child: Image(
                                  height: 80,
                                  image: AssetImage('assets/pizza.png')),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.currency_rupee_outlined,
                                  size: 15,
                                ),
                                Text(rateofPizza)
                              ],
                            ),
                            Text(
                              'Italian Pizza',
                              style: itemStyle,
                            ),
                            const Divider(
                              height: 2,
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (ctx) => ViewItemDetails(
                                          rate: rateofPizza,
                                          imageLink: 'assets/pizza.png',
                                          itemName: 'Italian Pizza'),
                                    ),
                                  );
                                },
                                child: const Text('Details'))
                          ],
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: shakeSelected,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: SizedBox(
                        height: 150,
                        // color: Colors.blue,
                        child: Column(
                          children: [
                            const Flexible(
                              child: Image(
                                  height: 80,
                                  image: AssetImage('assets/shake.png')),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.currency_rupee_outlined,
                                  size: 15,
                                ),
                                Text('400')
                              ],
                            ),
                            Text(
                              'Sharja Shake',
                              style: itemStyle,
                            ),
                            const Divider(
                              height: 2,
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (ctx) => ViewItemDetails(
                                        rate: '400',
                                        imageLink: 'assets/shake.png',
                                        itemName: 'Sharja Shake'),
                                  ),
                                );
                              },
                              child: const Text('Details'),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: saladSelected,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: SizedBox(
                        height: 150,
                        // color: Colors.blue,
                        child: Column(
                          children: [
                            const Flexible(
                              child: Image(
                                  height: 80,
                                  image: AssetImage('assets/salad.png')),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.currency_rupee_outlined,
                                  size: 15,
                                ),
                                Text('100')
                              ],
                            ),
                            Text(
                              'Fruits Salad',
                              style: itemStyle,
                            ),
                            const Divider(
                              height: 2,
                            ),
                            TextButton(
                                onPressed: () {}, child: const Text('Details'))
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ItemsCard extends StatelessWidget {
  ItemsCard(
      {super.key,
      required this.itemName,
      required this.asset,
      required this.onTap});
  String itemName;
  String asset;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: SizedBox(
            height: double.maxFinite,
            width: 150,
            child: Column(
              children: [
                Image(
                  image: AssetImage(asset),
                ),
                /*  Divider(
                  height: 5,
                ), */
                Text(
                  itemName,
                  style: itemStyle,
                )
              ],
            )),
      ),
    );
  }
}
