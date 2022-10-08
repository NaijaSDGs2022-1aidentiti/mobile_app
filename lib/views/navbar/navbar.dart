
import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/views/screens/dashboard/main.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_images.dart';
import '../../constants/app_routes.dart';
import '../screens/profile/profile.dart';
import '../screens/trade/trade.dart';




class NavBar extends StatefulWidget {
  NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar>{
  //set current tab to starting index
  int currentTab = 0;

  //this is a list of all screents passed into a list that takes widget
  final List<Widget> screens = [
    DashMain(),
    Profile(),
    Trade(),
    Profile(),
    Profile(),
  ];



//declaring pagestorage state
  final PageStorageBucket Bucket = PageStorageBucket();

  Widget currentScreen = DashMain();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Pallete.backgroundColor,
        body:
            //this page storage bucket helps to store each page state in memory
            PageStorage(bucket: Bucket, child: currentScreen),
        // floatingActionButton: FloatingActionButton(
        //   backgroundColor: Color(0xFF0095ff),
        //   child: Icon(Icons.telegram_rounded),
        //   onPressed: () {
        //     Navigator.of(context).pushNamed(AppRoutes.dashboard);
        //   },
        // ),
        // //floating action button placed at the center of he navbar
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

        //set bottomnavbar
        bottomNavigationBar: BottomAppBar(
            //asign shape to navabr
            color:Pallete.primary2,
            shape: CircularNotchedRectangle(),
            //set shape to 10px round
            notchMargin: 2,
            child: Container(
              height: 60,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MaterialButton(
                          minWidth: 40,
                          onPressed: () {
                            setState(() {
                              currentScreen = DashMain();
                              currentTab = 0;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                AppImages.home,
                                color: currentTab == 0
                                    ? Colors.white
                                    : Color(0x7C171A1C),
                                width: 20,
                                height: 20,
                              ),SizedBox(height: 4,),
                              Text('Home',
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: currentTab == 0
                                        ? Colors.white
                                    : Color(0x7C171A1C),
                                  )),
                            ],
                          ),
                        ),
                        MaterialButton(
                          minWidth: 40,
                          onPressed: () {
                            setState(() {
                              currentScreen = Trade();
                              currentTab = 1;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                AppImages.buysell,
                                color: currentTab == 1
                                     ? Colors.white
                                    : Color(0x7C171A1C),
                                width: 20,
                                height: 20,
                              ),SizedBox(height: 4,),
                              Text('Buy/Sell',
                                  style: TextStyle(
                                    fontSize: 11,
                                      color: currentTab == 1
                                          ? Colors.white
                                    : Color(0x7C171A1C),)),
                            ],
                          ),
                        ),
                      ],
                    ),
                    MaterialButton(
                          minWidth: 40,
                          onPressed: () {
                            setState(() {
                              currentScreen = Trade();
                              currentTab = 5;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                             Icon(Icons.file_copy,
                               
                                color: currentTab == 5
                                     ? Colors.white
                                    : Color(0x7C171A1C),
                               size: 20,
                               
                              ),SizedBox(height: 4,),
                              Text('Orders',
                                  style: TextStyle(
                                    fontSize: 11,
                                      color: currentTab == 5
                                          ? Colors.white
                                    : Color(0x7C171A1C),)),
                            ],
                          ),
                        ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MaterialButton(
                          minWidth: 40,
                          onPressed: () {
                            setState(() {
                              currentScreen = Profile();
                              currentTab = 2;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.speaker_phone_rounded, color: currentTab == 2
                                     ? Colors.white
                                    : Color(0x7C171A1C),
                                size: 20,
                                ),
                             SizedBox(height: 4,),
                              Text('Ads',
                                  style: TextStyle(
                                    fontSize: 11,
                                      color: currentTab == 2
                                           ? Colors.white
                                    :Color(0x7C171A1C),)),
                            ],
                          ),
                        ),
                        MaterialButton(
                          minWidth: 40,
                          onPressed: () {
                            setState(() {
                              currentScreen = Profile();
                              currentTab = 4;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                            Image.asset(
                                AppImages.profile,
                                color: currentTab == 4
                                     ? Colors.white
                                    : Color(0x7C171A1C),
                                width: 20,
                                height: 20,
                              ),SizedBox(height: 4,),
                              Text('Profile',
                                  style: TextStyle(
                                    fontSize: 11,
                                      color: currentTab == 4
                                           ? Colors.white
                                    : Color(0x7C171A1C),)),
                            ],
                          ),
                        ),
                      ],
                    )
                  ]),
            )));
  }
}
