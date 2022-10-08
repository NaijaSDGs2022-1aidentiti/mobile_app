
import 'package:flutter/material.dart';

import '../../../../component/buttons.dart';
import '../../../../constants/app_colors.dart';
import '../../../../constants/app_fonts.dart';
import '../../../../constants/app_routes.dart';

class BuyItem extends StatelessWidget {
   String lead='';
 BuyItem({Key? key,required this.lead}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _getSize=MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 8),
      child: Container(
        decoration: BoxDecoration(
            color: Pallete.black.withOpacity(0.04),
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipOval(
                  child: Image.asset(
                    'assets/images/icons/g.png',
                    width: 28,
                  ),
                ),SizedBox(width: 8,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'chizoba',
                      style: AppFonts.body1.copyWith(fontSize: 14),
                    ),
                    Text(
                      'completed rate :78%',
                      style:
                          AppFonts.body1.copyWith(color: Pallete.black),
                    ),SizedBox(height: 12,),
                    Row(mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              '0.015 EK0 Token =',
                              style: AppFonts.body1.copyWith(color: Pallete.black,fontSize: 12),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right:16.0),
                              child: Row(
                                children: [
                                  Icon(Icons.bolt_rounded),
                                  Text(
                                    '100 watts',
                                    style: AppFonts.body1.copyWith(color: Color(0xFFD2AC47),fontWeight: FontWeight.w700),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                       SizedBox
                        (width: _getSize.width*0.25,),
                      
                       SizedBox
                        (width: _getSize.width*0.3,
                        height:  _getSize.height*0.06,
                          child: ButtonWithFuction(text: 'Buy', onPressed: (){
                           Navigator.pushNamed(
                context,
                AppRoutes.buyOrder);
              
               
                          }))
                      ],
                    ),SizedBox(height: 12,),
                    Text(
                      'Limit 100 - 750 Watts',
                      style:
                          AppFonts.body1.copyWith(color: Pallete.black,fontSize: 12),
                    ),
                  ],
                )
              ]),
        ),
      ),
    );
  }
}
