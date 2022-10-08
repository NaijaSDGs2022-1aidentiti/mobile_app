

import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/views/navbar/navbar.dart';
import 'package:flutter_application_1/views/screens/dashboard/main.dart';
import 'package:flutter_application_1/views/screens/dashboard/sendCoin.dart/send.dart';
import 'package:flutter_application_1/views/screens/trade/order/buy_order.dart';
import 'package:flutter_application_1/views/screens/trade/order/confirm_buy.dart';

class AppRoutes {
 
  static const dashboard = '/dashboard';
static const navbar = '/navbar';
static const sendCoin = '/sendCoin';
static const buyOrder = '/buyOrder';
static const confirmBuy = '/confirmBuy';
  static Map<String, WidgetBuilder> routes() {
    return <String, WidgetBuilder>{
    AppRoutes.sendCoin: (context) => SendCoin(),
      AppRoutes.dashboard: (context) => DashMain(),
      AppRoutes.dashboard: (context) => DashMain(),
       AppRoutes.buyOrder: (context) => BuyOrder(),
        AppRoutes.confirmBuy: (context) => ConfirmBuy(),

      AppRoutes.navbar: (context) => NavBar(),
     
    };
  }
}
