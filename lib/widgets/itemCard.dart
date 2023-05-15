import 'package:democlass/constant.dart';
import 'package:flutter/material.dart';

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
