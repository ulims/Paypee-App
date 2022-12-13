
import 'package:flutter/material.dart';
import 'package:paypee/shared/components/animated_text.dart';
import 'package:paypee/shared/components/textstyles.dart';
import 'package:paypee/shared/constants/colors.dart';
import 'package:paypee/views/screens/authenticate/forgot_password.dart';

void changePasswordBottomSheet(context) {
  showModalBottomSheet(
      //isScrollControlled: true,
      context: context,
      builder: ((context) {
        return Container(
          color: background,
          height: MediaQuery.of(context).size.height / 1.6,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 8,
                      width: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: textColor20),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 200,
                  //width: MediaQuery.of(context).size.width/1,
                  child: Image.asset(
                    'assets/images/padlock 1.png',
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                changePass,
                passText,
                const SizedBox(
                  height: 50,
                ),
                Container(
                  height: 45,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: primaryColor),
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: ((context) => const ForgotPassword())));
                    },
                    child: const Text(
                      'Change password',
                      style: buttonStyle,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }));
}
