import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/shared/success.dart';
import 'package:provider/provider.dart';
import '../constants/app_routes.dart';
import '../models/create_wallet_model.dart';
import '../providers/wallet_provider.dart';
import '../shared/app_utils.dart';
import '../shared/db.dart';

class TransferDoneUtil {
  static var status1 = false;

  static Future create(
    BuildContext context,
  ) async {
    var show = await IsKYC().getOnce();
    var createWallet = <CreateWallet>[];
    // await UserPrefrences.saveEmail(data['email']);
    final Map<String, dynamic> serverErrorResult = {
      'status': false,
      'message': 'Sorry, something went wrong. Contact the Admin',
    };
    // await UserPrefrences.saveEmail(data['email']);

    AppUtils.showLoader(context);

    Provider.of<WalletProvider>(context, listen: false)
        .createWallets()
        .then((value) {
      // print(value);
      Iterable list = value;
      createWallet = list.map((model) => CreateWallet.fromJson(model)).toList();
      print(createWallet[0].note);
      String? day;

      day = createWallet[0].note;
      Navigator.of(context).pop();
    });
  }

  static Future transfer(
    BuildContext context,
  ) async {
    AppUtils.showLoader(context);

    Future.delayed(
      const Duration(milliseconds: 2000),
      () {
        Navigator.of(context).pop();
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => Success(
                    head: 'Transfer Done', body: '', buttonText: 'Home')));
      },
    );
  }
}
