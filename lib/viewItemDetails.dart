import 'package:democlass/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ViewItemDetails extends StatelessWidget {
  ViewItemDetails(
      {super.key,
      required this.rate,
      required this.imageLink,
      required this.itemName});
  String rate;
  String itemName;
  String imageLink;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black87,
            )),
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Colors.white),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Image(
              height: MediaQuery.of(context).size.height / 2.5,
              image: AssetImage(imageLink),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(left: 5, right: 5),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.blueGrey[100],
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                // color: Colors.red,
              ),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    space,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          itemName.toUpperCase(),
                          style: const TextStyle(
                              color: Colors.black45,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        Text(
                          'INR : $rate.00',
                          style: const TextStyle(
                              color: Colors.blueGrey,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ],
                    ),
                    space,
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.location_city_sharp),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Hotel Rahmath',
                          style: TextStyle(
                              color: Colors.deepOrange,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ],
                    ),
                    const Divider(),
                    Text(
                      'Overview',
                      style: textStyle1,
                    ),
                    const Divider(),
                    const Text(
                        '''This is supposed to show a rounded-edged container with a green left border 3px wide, and the child Text "This is a Container". However, it just shows a rounded-edged container with an invisible child and an invisible left border.
              
              When I take out the borderRadius object, the child Text and the green left border is visible, but introducing it hides the left border and child Text again.
              
              The major problem seems to be the custom left border, because using border: Border.all(width: 0) and borderRadius: BorderRadius.circular(10) makes the edges rounded as needed and also shows the child. But now I cant apply the green left border which is quite important in this particular setup.
              
              So is there something I'm doing wrong, or is this a bug in flutter, or is it just something that is not allowed?''')
                  ],
                ),
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff654E92)),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => const SizedBox(
                  height: 150,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              );
              /*  showBottomSheet(
                context: context,
                builder: (context) => Container(
                  child: const Text('Loading'),
                ),
              ); */
            },
            child: const Text('ORDER NOW'),
          ),
        ],
      ),
    );
  }
}
