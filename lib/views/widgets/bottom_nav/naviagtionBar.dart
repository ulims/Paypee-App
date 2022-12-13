import 'dart:developer';

import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:paypee/shared/components/textstyles.dart';
import 'package:paypee/shared/constants/colors.dart';
import 'package:paypee/views/screens/navigation/account.dart';
import 'package:paypee/views/screens/navigation/activity.dart';
import 'package:paypee/views/screens/navigation/home.dart';
import 'package:paypee/views/screens/navigation/investment.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  void initState() {
    FirebaseMessaging.onMessage.listen(
      (RemoteMessage message) {
        debugPrint("onMessage:");
        log("onMessage: $message");
        Flushbar(
          flushbarPosition: FlushbarPosition.TOP,
          flushbarStyle: FlushbarStyle.FLOATING,
          titleText: Text(message.notification?.title ?? "",style: input,),
          messageText: Text(message.notification?.body ?? "",style: input,),
        );
        final snackBar = SnackBar(
            content: Column(
          children: [
            Text(message.notification?.title ?? ""),
            Text(message.notification?.body ?? ""),
          ],
        ));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
    );
    super.initState();
  }

  final List<Widget> _naviagtionScreens = const [
    Home(),
    Investment(),
    Activity(),
    Account()
  ];

  int selectedIndex = 0;
  void onItemTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: _naviagtionScreens,
      ),
      bottomNavigationBar: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: faint2.withOpacity(0.5),
              offset: const Offset(
                0.0,
                -0.4,
              ),
              blurRadius: 0,
            )
          ]),
          child: BottomNavigationBar(
            backgroundColor: background,
            elevation: 1.0,
            fixedColor: primaryColor,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            unselectedItemColor: textColor40,
            iconSize: 22,
            selectedLabelStyle: selectedlabelTextstyle,
            unselectedLabelStyle:
                selectedlabelTextstyle.copyWith(color: textColor40),
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                  label: 'Home',
                  icon: SizedBox(
                    height: 22,
                    width: 22,
                    child: Image.asset(
                      'assets/images/home_active.png',
                    ),
                  ),
                  activeIcon: SizedBox(
                    height: 22,
                    width: 22,
                    child: Image.asset('assets/images/home.png'),
                  )),
              BottomNavigationBarItem(
                  label: 'Investment',
                  icon: SizedBox(
                    height: 22,
                    width: 22,
                    child: Image.asset('assets/images/wallet_inactive.png'),
                  ),
                  activeIcon: SizedBox(
                    height: 22,
                    width: 22,
                    child: Image.asset('assets/images/wallet_active.png'),
                  )),
              BottomNavigationBarItem(
                  label: 'Activity',
                  icon: SizedBox(
                    height: 22,
                    width: 22,
                    child: Image.asset('assets/images/activity.png'),
                  ),
                  activeIcon: SizedBox(
                    height: 22,
                    width: 22,
                    child: Image.asset('assets/images/activity_active.png'),
                  )),
              BottomNavigationBarItem(
                  label: 'Account',
                  icon: SizedBox(
                    height: 22,
                    width: 22,
                    child: Image.asset('assets/images/account.png'),
                  ),
                  activeIcon: SizedBox(
                    height: 22,
                    width: 22,
                    child: Image.asset('assets/images/account_active.png'),
                  )),
            ],
            currentIndex: selectedIndex,
            onTap: onItemTap,
          )),
    );
  }
}
