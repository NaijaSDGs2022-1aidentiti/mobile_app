import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/component/buttons.dart';
import 'package:flutter_application_1/constants/app_colors.dart';

class SendCoin extends StatelessWidget {
  const SendCoin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(color: Pallete.backgroundColor,
          child:Column(children: [
            BackButtonWithHeader(text: 'SendCoin'),
            Container(color: Pallete.primary2,height: 0.05,width: double.infinity,)
          ],) ,)
        

        
      ],),
    );
  }
}