import 'package:flutter/material.dart';


import '../component/buttons.dart';
import '../constants/app_colors.dart';
import '../constants/app_fonts.dart';


class SendCrypto extends StatelessWidget {
  const SendCrypto({Key? key}) : super(key: key);

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
              Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  height: _getSize.height * 0.5,
                  //width: _getSize.width * 0.95,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12.0, horizontal: 4),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset(
                          'assets/images/icons/shield.png',
                          width: 80,
                          color: Pallete.primaryColor,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            children: [
                              Text(
                                'Identity Provider',
                                style: AppFonts.body1.copyWith(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Text(
                                  'You can supply your identity to 1aidentity service through the tradition system already in place by providing your National ID or BVN(Nigeria only) or you can fill in  our bio-data form   and supply a photo from any government issued means of verification.',
                                  textAlign: TextAlign.center,
                                  style: AppFonts.body1.copyWith(fontSize: 11),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 32.0,
                          ),
                          child: ButtonWithFuction(
                              text: 'Get data from ID'.toUpperCase(),
                              onPressed: () {
                                Navigator.of(context).pop();
                              }),
                        ),
                        GestureDetector(
                          onTap: (() => Navigator.of(context).pop()),
                          child: Container(
                            child: Text(
                              'Cancel',
                              style: AppFonts.body1
                                  .copyWith(fontWeight: FontWeight.w600),
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
            ]),
      ),
    );
  }
}
