import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/component/buttons.dart';
import 'package:flutter_application_1/component/input_field.dart';
import 'package:flutter_application_1/constants/app_colors.dart';
import 'package:flutter_application_1/constants/app_fonts.dart';
import 'package:flutter_application_1/networkmanager/user.dart';
import 'package:flutter_application_1/providers/wallet_provider.dart';
import 'package:flutter_application_1/utils/bank_transfer_util.dart';
import 'package:flutter_application_1/utils/register_util.dart';
import 'package:flutter_application_1/utils/transfer_done.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../../models/create_wallet_model.dart';

class DashMain extends StatefulWidget {
  DashMain({Key? key}) : super(key: key);

  @override
  State<DashMain> createState() => _DashMainState();
}

class _DashMainState extends State<DashMain> {
  var createWallet = <CreateWallet>[];
  Uint8List? _bytez;

  @override
  void initState() {
    // TODO: implement initState

    setState(() {
      Provider.of<WalletProvider>(context, listen: false)
          .createWallets()
          .then((value) {
        // print(value);
        Iterable list = value;

        createWallet =
            list.map((model) => CreateWallet.fromJson(model)).toList();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

      Provider.of<WalletProvider>(context, listen: false)
          .createWallets()
          .then((value) {

        // print(value);
        Iterable list = value;
    setState(() {
        createWallet =
            list.map((model) => CreateWallet.fromJson(model)).toList();
      });
    });

    final _getSize = MediaQuery.of(context).size;
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // transparent status bar
        statusBarIconBrightness: Brightness.dark // dark text for status bar
        ));
    return Scaffold(
      backgroundColor: Pallete.backgroundColor,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: _getSize.height * 0.35,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.notifications_outlined,
                            color: Color(0xFF79808A),
                          ),
                          Text(
                            'NGN 2,000,000',
                            style: AppFonts.headerBlack
                                .copyWith(color: Pallete.black, fontSize: 24),
                          ),
                          Icon(
                            Icons.tune_outlined,
                            color: Color(0xFF79808A),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Lottie.asset("assets/images/icons/trans.json",
                              height: 75),
                          Column(
                            children: [
                              Text(
                                'Make direct transfer to any account in Nigeria',
                                style: AppFonts.smallWhite.copyWith(
                                    color: Color.fromARGB(255, 0, 170, 68)),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              CustomInput2(
                                  type: "number",
                                  hint: 'Enter amount to pay',
                                  onSaved: (value) {}),
                            ],
                          ),
                          const SizedBox(
                            height: 14,
                          ),
                          SizedBox(
                              width: _getSize.width * 0.35,
                              child: ButtonWithFuction(
                                  text: 'Make Transfer',
                                  onPressed: () {
                                    // BankTransferUtil.transfer(context);
                                  })),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Multichain-Wallet',
                        style: AppFonts.smallWhite
                            .copyWith(color: Color.fromARGB(255, 88, 92, 100)),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Container(
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                width: MediaQuery.of(context).size.width,
                height: _getSize.height * 0.55,
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    physics: BouncingScrollPhysics(),
                    itemCount: createWallet.length,
                    itemBuilder: (BuildContext context, int i) {
                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.memory(
                                  base64Decode(createWallet[i].img!),
                                  height: 35,
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 130,
                                      child: Text(
                                        createWallet[i].wallet!,
                                        overflow: TextOverflow.ellipsis,
                                        style: AppFonts.headerBlack,
                                      ),
                                    ),
                                    Text(
                                      '+101%',
                                      style: AppFonts.smallWhite.copyWith(
                                          color: Pallete.primaryColor),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  '0.04MTC',
                                  style: AppFonts.smallWhite.copyWith(
                                      color: Color.fromARGB(255, 70, 99, 113),
                                      fontSize: 18),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '5000 NGN',
                                      style: AppFonts.smallWhite.copyWith(
                                          color:
                                              Color.fromARGB(255, 5, 106, 57)),
                                    ),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Image.asset(
                                      "assets/images/icons/ngn.png",
                                      height: 16,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
