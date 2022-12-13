
import 'package:flutter/material.dart';
import 'package:paypee/views/screens/authenticate/login.dart';
import 'package:paypee/views/screens/authenticate/register.dart';

class AuthenticateWidget extends StatefulWidget {
  const AuthenticateWidget({Key? key}) : super(key: key);

  @override
  State<AuthenticateWidget> createState() => _AuthenticateWidgetState();
}

class _AuthenticateWidgetState extends State<AuthenticateWidget> {
   bool showLogin = true;
  toggle(){
    setState(() => showLogin = !showLogin,);
  }
  @override
  Widget build(BuildContext context) {
     if (showLogin) {
      return Login(change:toggle);
    } else {
      return Register(change:toggle);
    }
  }
}