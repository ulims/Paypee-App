import 'package:flutter/material.dart';
import 'package:paypee/models/user.dart';
import 'package:paypee/views/widgets/authenticate/authenticate_widget.dart';
import 'package:paypee/views/widgets/bottom_nav/naviagtionBar.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser?>(context);
    if (user == null) {
      return const AuthenticateWidget();
    } else {
      return const BottomNavBar();
    }
  }
}
