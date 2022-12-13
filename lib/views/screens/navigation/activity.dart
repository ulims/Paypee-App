import 'package:flutter/material.dart';
import 'package:paypee/shared/components/no_activity.dart';
import 'package:paypee/shared/components/textstyles.dart';
import 'package:paypee/shared/constants/colors.dart';

class Activity extends StatefulWidget {
  const Activity({Key? key}) : super(key: key);

  @override
  State<Activity> createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: background,
    appBar: PreferredSize(
    preferredSize: const Size.fromHeight(50),
    child: Container(
    decoration: const BoxDecoration(
    boxShadow: [
    BoxShadow(
    offset: Offset(0, 0.4,),
    blurRadius: 0,
    color: faint4
    )
    ]
    ),
    child: AppBar(
    elevation: 0.0,
    backgroundColor: background,
    automaticallyImplyLeading: false,
    centerTitle: false,
    title: const Padding(
      padding: EdgeInsets.only(right: 20,),
      child: Text('Activity',
      style: appbar
      ),
    ),)),
    ),
    body: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        noActivity
      ],
    ),
    );
  }
}
