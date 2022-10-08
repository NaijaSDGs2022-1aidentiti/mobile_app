
import 'package:flutter/material.dart';
import '../constants/app_routes.dart';
import '../shared/app_utils.dart';


class RegisterUtil {
  static Future register( BuildContext context,
     ) async {

      AppUtils.showLoader(context);
      // '';

  

      Future.delayed(Duration(milliseconds: 2000), () {
        Navigator.of(context).pop();
       
           
             AppUtils.showID(context);
          },
        );
      
    }
  }


