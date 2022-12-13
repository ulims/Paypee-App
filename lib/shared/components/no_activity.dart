import 'package:flutter/material.dart';
import 'package:paypee/shared/components/animated_text.dart';
import 'package:paypee/shared/components/textstyles.dart';

final noActivity = Column(
  children: [
    Center(child: SizedBox(
      height: 80,
      width: 80,
      child: Image.asset('assets/images/no_Ad.png')
      ),),
      activity
  ],
);


final noEarning = Column(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    Center(child: SizedBox(
      height: 80,
      width: 80,
      child: Image.asset('assets/images/no_Ad.png')
      ),),
      const Text('No investment yet', style: medium16,)
  ],
);

final noNotification = Column(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    Center(child: SizedBox(
      height: 80,
      width: 80,
      child: Image.asset('assets/images/Bell.png')
      ),),
     noNotificationtext
  ],
);

