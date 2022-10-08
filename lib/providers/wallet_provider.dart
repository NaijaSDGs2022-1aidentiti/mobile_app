// To parse this JSON data, do
import 'dart:convert';

import 'package:flutter/widgets.dart';

import '../networkmanager/user.dart';

class WalletProvider extends ChangeNotifier {
  Future<List< dynamic>> createWallets() async {
    dynamic data;
    notifyListeners();

    try {
      var response = await UserAPI.create();
      var responseData = json.decode(response.body);

      notifyListeners();

      data = responseData;
    } catch (e) {
      notifyListeners();
      data = {'error': e};
    }
    return data;
  }
}
