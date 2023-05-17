import 'package:democlass/constant.dart';
import 'package:democlass/viewItemDetails.dart';
import 'package:democlass/widgets/itemCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  bool isSelected = false;
  var name = '';
  var photo = '';
  var email = '';
  @override
  void initState() {
    super.initState();
    getDatas();
  }

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
      body: SingleChildScrollView(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(photo == ''
                      ? 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRiwVJV38db9e6c6qLcHw53zMFT9j81nnv13Go8rzlOSA&s'
                      : photo),
                  backgroundColor: Colors.amber[200],
                  /*  child: photo == ''
                      ? const Icon(Icons.person)
                      : Image(
                          image: NetworkImage(photo),
                        ), */
                ),
                const VerticalDivider(),
                FittedBox(
                  fit: BoxFit.contain,
                  child: Text(
                    name == ''
                        ? 'no name'
                        : 'Hey $name How Hungry Are You Today dsfgsdfg?',
                    /* style: textStyle1, */
                  ),
                ),
              ],
            ),
            // Text(email),
            space,
            space,
            Row(
              children: [
                Expanded(
                  child: TextField(
                    onChanged: (value) {
                      /*  setState(() {
                        print(value);
                      }); */
                    },
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: InputBorder.none,
                        hintText: 'What would you like to eat ?'),
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
            CarouselSlider(
              items: const [
                Image(
                  image: AssetImage('assets/pizza.png'),
                ),
                Image(
                  image: AssetImage('assets/shake.png'),
                ),
                Image(
                  image: AssetImage('assets/salad.png'),
                ),

                /* ItemsCard(
                    itemName: 'PIZZA',
                    asset: 'assets/pizza.png',
                    onTap: () {
                      setState(() {
                        pizzaSelected = true;
                        saladSelected = false;
                        shakeSelected = false;
                      });
                    }), */
              ],
              options: CarouselOptions(
                  scrollDirection: Axis.horizontal,
                  enableInfiniteScroll: false,
                  height: 200,
                  autoPlay: true),
            ),
            space,
            /*   Radio(
                value: 'value',
                groupValue: 'groupValue',
                onChanged: (c) {
                  
                },
                toggleable: true), */
            /*   Checkbox(
                fillColor: MaterialStateProperty.all(Colors.red),
                // fillColor: MaterialStateProperty.resolveWith<Color>,
                checkColor: Colors.red,
                value: isSelected,
                onChanged: (variable) {
                  setState(() {
                    isSelected = !isSelected;
                  });
                }), */
            /*    Text(
              'Choose Catogory',
              style: textStyle1,
            ), */

            const ExpansionTile(
              title: Text('More Items'),
              children: [
                Text('Item 1'),
                Text('Item 1'),
                Text('Item 1'),
                Text('Item 1'),
                Text('Item 1'),
                Text('Item 1'),
                Text('Item 1'),
              ],
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
            Container(
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
            )
          ],
        ),
      ),
    );
  }

  getDatas() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      name = preferences.getString('name').toString();
      email = preferences.getString('mail').toString();
      photo = preferences.getString('photo').toString();
    });
  }
}
