
import 'package:flutter/material.dart';

import '../widget/buy_item.dart';

class Buy extends StatefulWidget {
  Buy({Key? key}) : super(key: key);

  @override
  State<Buy> createState() => _BuyState();
}

class _BuyState extends State<Buy> {
  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return BuyItem(lead: 'Buy',);
      },
    );
  }
}
