import 'package:flutter/material.dart';
import 'package:paypee/services/authentication/auth.dart';
import 'package:paypee/shared/components/textstyles.dart';
import 'package:paypee/shared/constants/colors.dart';

class LogoutSheet extends StatefulWidget {
  const LogoutSheet({Key? key}) : super(key: key);

  @override
  State<LogoutSheet> createState() => _LogoutSheetState();
}

class _LogoutSheetState extends State<LogoutSheet> {
  final Authservice _auth = Authservice();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 0.0,
      insetPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      contentPadding: const EdgeInsets.symmetric(horizontal: 27, vertical: 27),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      content: Container(
        height: 215,
        width: MediaQuery.of(context).size.width * 0.55,
        color: background,
        child: Column(
          children: [
            Text(
              'Logout',
              style: appbar.copyWith(fontSize: 20),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              'Do you really want to logout from this app?',
              textAlign: TextAlign.center,
              style: medium15.copyWith(
                  height: 1.5, fontWeight: FontWeight.w400, color: textColor80),
            ),
            const SizedBox(
              height: 35,
            ),
            Container(
              height: 45,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30), color: red100),
              child: TextButton(
                  onPressed: () async {
                    await _auth.logOut();
                    if(!mounted){}
                    Navigator.of(context).pop();
                  },
                  child: const Text('Confirm', style: buttonStyle)),
            ),
            const SizedBox(
              width: 13,
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 45,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30), color: faint3),
              child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Cancel',
                    style: buttonStyle.copyWith(color: textColor100),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
