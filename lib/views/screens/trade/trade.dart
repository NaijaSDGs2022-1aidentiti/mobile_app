
import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/screens/trade/tab_content/buy.dart';
import 'package:flutter_application_1/views/screens/trade/tab_content/sell.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_fonts.dart';


class Trade extends StatefulWidget {
  Trade({Key? key}) : super(key: key);

  @override
  State<Trade> createState() => _TradeState();
}

class _TradeState extends State<Trade> with SingleTickerProviderStateMixin {
  // We need a TabController to control the selected tab programmatically
  late final _tabController = TabController(length: 2, vsync: this);
 String balance = '';

  check() async {
   
    // var mBalance = await UserPrefrences.showBalance();
     
    setState(() {
     ;
     // balance=mBalance;
    });
  }

  @override
  void initState() {
    check();

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final _getSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Pallete.backgroundColor,
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:16.0,vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                       // Image.asset(AppImages.eko,width: 30,),SizedBox(width: 4,),
                        Text('$balance EKT',style: AppFonts.body1.copyWith(fontSize: 14,color: Pallete.black))
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.search,
                          size: 18,
                        ),SizedBox(width: 4,),
                        Icon(
                          Icons.filter_alt,
                          size: 18,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                color: Pallete.backgroundColor,
                child:TabBar(
               labelStyle: AppFonts.body1.copyWith(fontSize: 14),
                controller: _tabController,
              physics: BouncingScrollPhysics(),
              unselectedLabelColor: Colors.grey[400],
              indicatorColor: Pallete.primaryColor,
              labelColor: Pallete.primaryColor,
                  tabs: [
                    Tab(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8),
                        child: Text('Buy',
                            textAlign: TextAlign.center,
                        )
                      ),
                    ),
                    Tab(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8),
                        child: Text('Sell',
                            textAlign: TextAlign.center,
                          ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(0),
                          topRight: Radius.circular(0)),
                      color: Colors.white),
                  height: _getSize.height,
                  child: TabBarView(
                    children: [Buy(), Sell()],
                    controller: _tabController,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
