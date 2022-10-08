import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/constants/app_colors.dart';
import 'package:flutter_application_1/constants/app_routes.dart';

import '../../../constants/app_fonts.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // transparent status bar
        statusBarIconBrightness: Brightness.light // dark text for status bar
        ));
    final _getSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Pallete.primaryColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                SizedBox(
                  height: 22,
                ),
                Center(
                    child: Image.asset(
                  "assets/images/logo/name.png",
                  height: 55,
                )),
              ],
            ),
            Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Signin with', style: AppFonts.smallWhite),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () => {
                        Navigator.of(context)
                            .pushReplacementNamed(AppRoutes.navbar)
                      },
                      child: Container(
                        decoration: new BoxDecoration(
                            color: Color.fromARGB(255, 255, 237, 237),
                            borderRadius: const BorderRadius.only(
                              topLeft: const Radius.circular(100.0),
                              topRight: const Radius.circular(40.0),
                              bottomLeft: const Radius.circular(100.0),
                              bottomRight: const Radius.circular(40.0),
                            )),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            "assets/images/icons/g.png",
                            height: 55,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 24,
                    ),
                    Text('Or'),
                    SizedBox(
                      width: 24,
                    ),
                    GestureDetector(
                      onTap: () => {
                        Navigator.of(context)
                            .pushReplacementNamed(AppRoutes.navbar)
                      },
                      child: Container(
                        decoration: new BoxDecoration(
                            color: Color.fromARGB(255, 255, 255, 255),
                            borderRadius: const BorderRadius.only(
                              topLeft: const Radius.circular(40.0),
                              topRight: const Radius.circular(100.0),
                              bottomLeft: const Radius.circular(40.0),
                              bottomRight: const Radius.circular(100.0),
                            )),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            "assets/images/icons/one.png",
                            height: 55,
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Don\'t have an account? ',
                        style: AppFonts.smallWhite),
                    Text('SignUp', style: AppFonts.smallWhiteBold),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
