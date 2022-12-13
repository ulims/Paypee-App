import 'package:flutter/material.dart';
import 'package:paypee/shared/constants/colors.dart';

final welcome = TweenAnimationBuilder(
  tween: Tween<double>(begin: 0, end: 1),
  duration: const Duration(milliseconds: 500),
  curve: Curves.easeIn,
  builder: (BuildContext context, double val, Widget? child) {
    return Opacity(
      opacity: val,
      child: Padding(
        padding: EdgeInsets.only(top: val * 10),
        child: child,
      ),
    );
  },
  child: const Text(
    'Welcome Back',
    textAlign: TextAlign.center,
    style: TextStyle(
        fontFamily: 'Mabry-Pro',
        fontSize: 24,
        fontWeight: FontWeight.w900,
        color: textColor100,
        height: 1.32),
  ),
);

final subText = TweenAnimationBuilder(
  tween: Tween<double>(begin: 0, end: 1),
  duration: const Duration(milliseconds: 500),
  curve: Curves.easeIn,
  builder: (BuildContext context, double val, Widget? child) {
    return Opacity(
      opacity: val,
      child: Padding(
        padding: EdgeInsets.only(top: val * 5),
        child: child,
      ),
    );
  },
  child: const Text(
    'We are happy to see your financial progress',
    textAlign: TextAlign.center,
    style: TextStyle(
        fontFamily: 'Mabry-Pro',
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: textColor80,
        ),
  ),
);

final emoji = TweenAnimationBuilder(
  tween: Tween<double>(begin: 0, end: 1),
  duration: const Duration(milliseconds: 500),
  curve: Curves.easeIn,
  builder: (BuildContext context, double val, Widget? child) {
    return Opacity(
      opacity: val,
      child: Padding(
        padding: EdgeInsets.only(top: val * 10),
        child: child,
      ),
    );
  },
  child: const Text(
    '👋',
    textAlign: TextAlign.center,
    style: TextStyle(
        fontFamily: 'Mabry-Pro',
        fontSize: 15,
        fontWeight: FontWeight.w900,
        color: textColor100,
        height: 1.32),
  ),
);

final create = TweenAnimationBuilder(
  tween: Tween<double>(begin: 0, end: 1),
  duration: const Duration(milliseconds: 500),
  curve: Curves.easeIn,
  builder: (BuildContext context, double val, Widget? child) {
    return Opacity(
      opacity: val,
      child: Padding(
        padding: EdgeInsets.only(top: val * 10),
        child: child,
      ),
    );
  },
  child: const Text(
    'Create an Account',
    textAlign: TextAlign.center,
    style: TextStyle(
        fontFamily: 'Mabry-Pro',
        fontSize: 24,
        fontWeight: FontWeight.w900,
        color: textColor100,
        height: 1.32),
  ),
);

final subText1 = TweenAnimationBuilder(
  tween: Tween<double>(begin: 0, end: 1),
  duration: const Duration(milliseconds: 500),
  curve: Curves.easeIn,
  builder: (BuildContext context, double val, Widget? child) {
    return Opacity(
      opacity: val,
      child: Padding(
        padding: EdgeInsets.only(top: val * 5),
        child: child,
      ),
    );
  },
  child: const Text(
    'We are happy to have you here.Join the freedom',
    textAlign: TextAlign.center,
    style: TextStyle(
        fontFamily: 'Mabry-Pro',
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: textColor80,
        ),
  ),
);
final subText2 = TweenAnimationBuilder(
  tween: Tween<double>(begin: 0, end: 1),
  duration: const Duration(milliseconds: 500),
  curve: Curves.easeIn,
  builder: (BuildContext context, double val, Widget? child) {
    return Opacity(
      opacity: val,
      child: Padding(
        padding: EdgeInsets.only(top: val * 5),
        child: child,
      ),
    );
  },
  child: const Text(
    'Let’s get to know more about  you',
    textAlign: TextAlign.center,
    style: TextStyle(
        fontFamily: 'Mabry-Pro',
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: textColor80,
        ),
  ),
);

final usertext = TweenAnimationBuilder(
  tween: Tween<double>(begin: 0, end: 1),
  duration: const Duration(milliseconds: 500),
  curve: Curves.easeIn,
  builder: (BuildContext context, double val, Widget? child) {
    return Opacity(
      opacity: val,
      child: Padding(
        padding: EdgeInsets.only(top: val * 10),
        child: child,
      ),
    );
  },
  child: const Text(
    'Username',
    textAlign: TextAlign.center,
    style: TextStyle(
        fontFamily: 'Mabry-Pro',
        fontSize: 24,
        fontWeight: FontWeight.w900,
        color: textColor100,
        height: 1.32),
  ),
);

final emoji1 = TweenAnimationBuilder(
  tween: Tween<double>(begin: 0, end: 1),
  duration: const Duration(milliseconds: 500),
  curve: Curves.easeIn,
  builder: (BuildContext context, double val, Widget? child) {
    return Opacity(
      opacity: val,
      child: Padding(
        padding: EdgeInsets.only(top: val * 10),
        child: child,
      ),
    );
  },
  child: const Text(
    '😎',
    textAlign: TextAlign.center,
    style: TextStyle(
        fontFamily: 'Mabry-Pro',
        fontSize: 15,
        fontWeight: FontWeight.w900,
        color: textColor100,
        height: 1.32),
  ),
);

final subText3 = TweenAnimationBuilder(
  tween: Tween<double>(begin: 0, end: 1),
  duration: const Duration(milliseconds: 500),
  curve: Curves.easeIn,
  builder: (BuildContext context, double val, Widget? child) {
    return Opacity(
      opacity: val,
      child: Padding(
        padding: EdgeInsets.only(top: val * 5),
        child: child,
      ),
    );
  },
  child: const Text(
    'Please enter your email address to reset password',
    textAlign: TextAlign.center,
    style: TextStyle(
        fontFamily: 'Mabry-Pro',
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: textColor80,
        ),
  ),
);


final activity = TweenAnimationBuilder(
  tween: Tween<double>(begin: 0, end: 1),
  duration: const Duration(milliseconds: 500),
  curve: Curves.easeIn,
  builder: (BuildContext context, double val, Widget? child) {
    return Opacity(
      opacity: val,
      child: Padding(
        padding: EdgeInsets.only(top: val * 10),
        child: child,
      ),
    );
  },
  child: const Text(
    'No transaction yet',
    textAlign: TextAlign.center,
    style: TextStyle(
        fontFamily: 'Mabry-Pro',
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: textColor100,
        ),
  ),
);

final paysave = TweenAnimationBuilder(
  tween: Tween<double>(begin: 0, end: 1),
  duration: const Duration(milliseconds: 500),
  curve: Curves.easeIn,
  builder: (BuildContext context, double val, Widget? child) {
    return Opacity(
      opacity: val,
      child: Padding(
        padding: EdgeInsets.only(top: val * 8),
        child: child,
      ),
    );
  },
  child: const Text(
    'PaySave',
    textAlign: TextAlign.center,
    style: TextStyle(
        fontFamily: 'Mabry-Pro',
        fontSize: 24,
        fontWeight: FontWeight.w900,
        color: textColor100,
        ),
  ),
);

final paysave2 = TweenAnimationBuilder(
  tween: Tween<double>(begin: 0, end: 1),
  duration: const Duration(milliseconds: 600),
  curve: Curves.easeIn,
  builder: (BuildContext context, double val, Widget? child) {
    return Opacity(
      opacity: val,
      child: Padding(
        padding: EdgeInsets.only(top: val * 10),
        child: child,
      ),
    );
  },
  child: const Text(
    'Express your creativity with using our appa using our primitive',
    textAlign: TextAlign.center,
    style: TextStyle(
        fontFamily: 'Mabry-Pro',
        fontSize: 16,
        height: 1.45,
        fontWeight: FontWeight.w400,
        color: textColor60,
        ),
  ),
);

final payvest = TweenAnimationBuilder(
  tween: Tween<double>(begin: 0, end: 1),
  duration: const Duration(milliseconds: 600),
  curve: Curves.easeIn,
  builder: (BuildContext context, double val, Widget? child) {
    return Opacity(
      opacity: val,
      child: Padding(
        padding: EdgeInsets.only(top: val * 8),
        child: child,
      ),
    );
  },
  child: const Text(
    'PayInvest',
    textAlign: TextAlign.center,
    style: TextStyle(
        fontFamily: 'Mabry-Pro',
        fontSize: 24,
        height: 1.45,
        fontWeight: FontWeight.w900,
        color: textColor100,
        ),
  ),
);

final noNotificationtext = TweenAnimationBuilder(
  tween: Tween<double>(begin: 0, end: 1),
  duration: const Duration(milliseconds: 500),
  curve: Curves.easeIn,
  builder: (BuildContext context, double val, Widget? child) {
    return Opacity(
      opacity: val,
      child: Padding(
        padding: EdgeInsets.only(top: val * 10),
        child: child,
      ),
    );
  },
  child: const Text(
    'No notifcation yet',
    textAlign: TextAlign.center,
    style: TextStyle(
        fontFamily: 'Mabry-Pro',
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: textColor100,
        ),
  ),
);

final amountText = TweenAnimationBuilder(
  tween: Tween<double>(begin: 0, end: 1),
  duration: const Duration(milliseconds: 500),
  curve: Curves.easeIn,
  builder: (BuildContext context, double val, Widget? child) {
    return Opacity(
      opacity: val,
      child: Padding(
        padding: EdgeInsets.only(top: val * 10),
        child: child,
      ),
    );
  },
  child: const Text(
    'Amount',
    textAlign: TextAlign.center,
    style: TextStyle(
        fontFamily: 'Mabry-Pro',
        fontSize: 13,
        fontWeight: FontWeight.w400,
        color: textColor60,
        ),
  ),
);


final changePass = TweenAnimationBuilder(
  tween: Tween<double>(begin: 0, end: 1),
  duration: const Duration(milliseconds: 600),
  curve: Curves.easeIn,
  builder: (BuildContext context, double val, Widget? child) {
    return Opacity(
      opacity: val,
      child: Padding(
        padding: EdgeInsets.only(top: val * 8),
        child: child,
      ),
    );
  },
  child: const Text(
    'Change password',
    textAlign: TextAlign.center,
    style: TextStyle(
        fontFamily: 'Mabry-Pro',
        fontSize: 24,
        height: 1.45,
        fontWeight: FontWeight.w900,
        color: textColor100,
        ),
  ),
);

final passText = TweenAnimationBuilder(
  tween: Tween<double>(begin: 0, end: 1),
  duration: const Duration(milliseconds: 600),
  curve: Curves.easeIn,
  builder: (BuildContext context, double val, Widget? child) {
    return Opacity(
      opacity: val,
      child: Padding(
        padding: EdgeInsets.only(top: val * 8),
        child: child,
      ),
    );
  },
  child: const Text(
    'We will send a password reset link to your registered email',
    textAlign: TextAlign.center,
    style: TextStyle(
        fontFamily: 'Mabry-Pro',
        fontSize: 15,
        height: 1.45,
        fontWeight: FontWeight.w400,
        color: textColor80,
        ),
  ),
);

