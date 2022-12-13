import 'package:flutter/material.dart';
import 'package:paypee/shared/components/input_decoration.dart';
import 'package:paypee/shared/components/textstyles.dart';
import 'package:paypee/shared/constants/colors.dart';

class EditUsernameDialog extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final names;
  const EditUsernameDialog({Key? key, required this.names}) : super(key: key);

  @override
  State<EditUsernameDialog> createState() => _EditUsernameDialogState();
}

class _EditUsernameDialogState extends State<EditUsernameDialog> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 0.0,
      insetPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      contentPadding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      content: Container(
        height: 220,
        width: MediaQuery.of(context).size.width * 0.75,
        color: background,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Edit Username',
                  style: appbar,
                ),
                const Spacer(),
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Image.asset(
                      'assets/images/exit.png',
                      height: 22,
                      width: 22,
                    ))
              ],
            ),
            const SizedBox(
              height: 45,
            ),
            SizedBox(
                height: 50,
                width: double.infinity,
                child: Form(
                  key: _formKey,
                    child: TextFormField(
                      autofocus: true,
                      style: input,
                  decoration:
                      emailInputDecoration.copyWith(hintText: widget.names),
                ))),
            const SizedBox(
              height: 50,
            ),
            Container(
              height: 45,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5), color: primaryColor),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'Update username',
                  style: medium15.copyWith(color: background),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
