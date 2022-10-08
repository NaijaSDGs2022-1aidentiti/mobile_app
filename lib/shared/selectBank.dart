import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/transfer_done.dart';

import '../component/buttons.dart';
import '../component/input_field.dart';
import '../constants/app_colors.dart';
import '../constants/app_fonts.dart';

class AllBanks extends StatefulWidget {
  AllBanks({Key? key}) : super(key: key);

  @override
  State<AllBanks> createState() => _AllBanksState();
}

class _AllBanksState extends State<AllBanks> {
  var isPicked = true;
  @override
  void initState() {
    setState(() {
      isPicked;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _getSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0x1F000000),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              isPicked ? PayTo(_getSize, context) : ToWhom(_getSize, context),
            ]),
      ),
    );
  }

  Container ToWhom(Size _getSize, BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(5)),
        height: _getSize.height * 0.5,
        //width: _getSize.width * 0.95,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              'assets/images/icons/shield.png',
              width: 70,
              color: Pallete.primaryColor,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Text(
                    'You will transfer ',
                    style: AppFonts.body1.copyWith(
                        color: Pallete.text,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                  Text(
                    '50,000',
                    style: AppFonts.body1.copyWith(
                        color: Pallete.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    ' to ',
                    style: AppFonts.body1.copyWith(
                        color: Pallete.text,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    width: _getSize.width * 0.35,
                    child: Text(
                      'ADEKUNLE EMMANUEL OKPEKI',
                      style: AppFonts.body1.copyWith(
                          color: Pallete.primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 32.0, vertical: 1),
              child: ButtonWithFuction(
                  text: 'Pay'.toUpperCase(),
                  onPressed: () {
                    TransferDoneUtil.transfer(context);
                  }),
            ),
            GestureDetector(
              onTap: (() => Navigator.of(context).pop()),
              child: Container(
                child: Text(
                  'cancel',
                  style: AppFonts.cancel
                      .copyWith(fontWeight: FontWeight.w600, fontSize: 16),
                ),
              ),
            )
          ],
        ));
  }

  Container PayTo(Size _getSize, BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(5)),
        height: _getSize.height * 0.5,
        //width: _getSize.width * 0.95,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 4),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    Text(
                      'Enter account number and select beneficiary bank to continue',
                      style: AppFonts.body1.copyWith(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    CustomInput2(
                        type: "number",
                        hint: 'Enter account number',
                        onSaved: (value) {}),
                    SizedBox(
                      height: _getSize.height * 0.025,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0, bottom: 4),
                          child: Text(
                            'Select beneficiary bank',
                            textAlign: TextAlign.center,
                            style: AppFonts.bodyText.copyWith(
                                fontSize: 14, fontWeight: FontWeight.w600),
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 244, 250, 253),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          width: MediaQuery.of(context).size.width,
                          height: _getSize.height * 0.21,
                          child: Container(
                            height: _getSize.height * 0.17,
                            child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                physics: BouncingScrollPhysics(),
                                itemCount: 10,
                                itemBuilder: (BuildContext context, int i) {
                                  return Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              isPicked = !isPicked;
                                            });
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  const Icon(
                                                    Icons.hail,
                                                    color: Colors.orangeAccent,
                                                    size: 24,
                                                  ),
                                                  const SizedBox(
                                                    width: 4,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'GTB',
                                                        style: AppFonts
                                                            .headerBlack,
                                                      ),
                                                      Text(
                                                        'Guaranteed Trust Bank',
                                                        style: AppFonts
                                                            .smallWhite
                                                            .copyWith(
                                                                color: Color(
                                                                    0xFF466371),
                                                                fontSize: 12),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Image.asset(
                                                    "assets/images/icons/ngn.png",
                                                    height: 16,
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Container(
                                          width: _getSize.width * 0.7,
                                          height: 0.4,
                                          color: Pallete.text.withOpacity(0.5),
                                        )
                                      ],
                                    ),
                                  );
                                }),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: (() => Navigator.of(context).pop()),
                child: Container(
                  child: Text(
                    'cancel',
                    style: AppFonts.cancel
                        .copyWith(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
