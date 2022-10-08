import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/shared/selectBank.dart';

import '../constants/app_colors.dart';
import '../constants/app_fonts.dart';
import 'choose.dart';
import 'loader.dart';


class AppUtils {
  static dynamic showAlertDialogKYCID(
    BuildContext context,
    Widget icon,
    String header,
    String contentText,

    Function()? confirmFunction,
  ) {
    // set up the buttons
    Widget cancelButton = Container(
        width: MediaQuery.of(context).size.width,
        child: OutlinedButton(
            child: Text(
              'No',
              style: AppFonts.body1.copyWith(color: Pallete.primaryColor,fontSize: 14),
            ),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              side: const BorderSide(color: Pallete.primaryColor, width: 1),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              primary: Pallete.primaryColor,
              textStyle: const TextStyle(
                  color: Pallete.primaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            onPressed: ()=> Navigator.of(context).pop()));

    Widget confirmButton = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: OutlinedButton(
          child: Text(
            'Yes',
            style: AppFonts.body1.copyWith(color: Colors.white,fontSize: 14),
          ),
          style: OutlinedButton.styleFrom(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            padding: EdgeInsets.symmetric(vertical: 16),
            primary: Colors.white,
            backgroundColor: Pallete.primaryColor,
           
            textStyle: const TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          onPressed: confirmFunction),
    );

    Widget text = Text(
      header,
      textAlign: TextAlign.center,
      style: AppFonts.body1.copyWith(fontWeight: FontWeight.w600),
    );

    // content
    Widget content = Text(
      contentText,
      style: AppFonts.body1
          .copyWith(fontSize: 13, color: Color.fromARGB(255, 89, 89, 89)),
      textAlign: TextAlign.center,
    );

    // set up the AlertDialog
    dynamic alert = Platform.isIOS
        ? CupertinoAlertDialog(
            title: icon,
            content: content,
            actions: [
              Padding(
                padding: const EdgeInsets.only(left:8.0,right: 8,bottom: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    text,confirmButton,
                    cancelButton,
                  
                  ],
                ),
              )
            ],
          )
        : AlertDialog(
            title: icon,
            content: content,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(14),
              ),
            ),
            backgroundColor: const Color.fromRGBO(242, 242, 242, 1),
            actions: [
              Padding(
                padding: const EdgeInsets.only(bottom:8.0,left: 8,right: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    text,confirmButton,
                    cancelButton,
           
                  ],
                ),
              )
            ],
          );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  static dynamic singleDialog(
    BuildContext context,
    Widget? icon,
    String contentText,
    String cancelText,
    Function()? confirmFunction,
  ) {
    // set up the buttons
    Widget Button = TextButton(
      child: Text(
        cancelText,
        style: AppFonts.body1.copyWith(
            color: Pallete.primaryColor, fontSize: 14, fontWeight: FontWeight.w400),
      ),
      onPressed: confirmFunction,
    );

    Widget title = Center(child: icon);

    // content
    Widget content = Text(
      contentText,
      style: AppFonts.body1.copyWith(fontSize: 13),
      textAlign: TextAlign.center,
    );

    // set up the AlertDialog
    dynamic alert = Platform.isIOS
        ? CupertinoAlertDialog(
            title: title,
            content: content,
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Button,
                ],
              )
            ],
          )
        : AlertDialog(
            title: title,
            content: content,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(14),
              ),
            ),
            backgroundColor: const Color.fromRGBO(242, 242, 242, 1),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Button,
                ],
              )
            ],
          );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  static dynamic showErrorDialog(
    BuildContext context,
    String titleText,
    String contentText,
    String cancelText,
  ) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text(
        cancelText,
        style: AppFonts.body1
            .copyWith(color: Pallete.primaryColor, fontSize: 12),
      ),
      onPressed: () => Navigator.of(context).pop(),
    );

    // title
    Widget title = Center(
      child: Text(
        titleText,
        style: AppFonts.body1.copyWith(
          fontWeight: FontWeight.w600,
          fontSize: 17,
        ),
        textAlign: TextAlign.center,
      ),
    );

    // content
    Widget content = Text(
      contentText,
      style: AppFonts.body1.copyWith(fontSize: 13),
      textAlign: TextAlign.center,
    );

    // set up the AlertDialog
    dynamic alert = Platform.isIOS
        ? CupertinoAlertDialog(
            title: title,
            content: content,
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  cancelButton,
                ],
              )
            ],
          )
        : AlertDialog(
            title: title,
            content: content,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(14),
              ),
            ),
            backgroundColor: const Color.fromRGBO(242, 242, 242, 1),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  cancelButton,
                ],
              )
            ],
          );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  static showSnackBar(String pin, context, text) {
    final snackBar = SnackBar(
      duration: const Duration(seconds: 4),
      content: SizedBox(
        height: 20.0,
        width: 10,
        child: Center(
          child: Text(
            text,
            style: AppFonts.body1.copyWith(color: Colors.white),
          ),
        ),
      ),
      backgroundColor: Pallete.primaryColor,
    );
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  static dynamic showAlertDialog(
    BuildContext context,
    Widget? icon,
    // String titleText,
    String contentText,
    String confirmText,
    String cancelText,
    Function()? confirmFunction,
  ) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text(
        cancelText,
        style: AppFonts.body1
            .copyWith(color: Pallete.primaryColor, fontSize: 12),
      ),
      onPressed: () => Navigator.of(context).pop(),
    );

    Widget confirmButton = TextButton(
      child: Text(
        confirmText,
        style: AppFonts.body1.copyWith(
            fontWeight: FontWeight.w600,
            color: Pallete.primaryColor,
            fontSize: 14),
      ),
      onPressed: confirmFunction,
    );

    // title
    Widget title = Center(child: icon);

    // content
    Widget content = Text(
      contentText,
      style: AppFonts.body1.copyWith(fontSize: 13),
      textAlign: TextAlign.center,
    );

    // set up the AlertDialog
    dynamic alert = Platform.isIOS
        ? CupertinoAlertDialog(
            title: title,
            content: content,
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  cancelButton,
                  confirmButton,
                ],
              )
            ],
          )
        : AlertDialog(
            title: title,
            content: content,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(14),
              ),
            ),
            backgroundColor: const Color.fromRGBO(242, 242, 242, 1),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  cancelButton,
                  confirmButton,
                ],
              )
            ],
          );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  static void showLoader(context) {
    showDialog(
      context: context,
      builder: (ctx) => const Loader(),
    );
  }
  static void showID(context) {
    showDialog(
      context: context,
      builder: (ctx) => const IDPopup(),
    );
  }

    static void showBanks(context) {
    showDialog(
      context: context,
      builder: (ctx) =>  AllBanks(),
    );
  }



  static bool checkValidEmail(value) {
    if (RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value)) {
      return true;
    } else {
      return false;
    }
  }
}
