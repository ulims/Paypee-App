import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:paypee/services/authentication/auth.dart';
import 'package:paypee/shared/components/animated_text.dart';
import 'package:paypee/shared/components/input_decoration.dart';
import 'package:paypee/shared/components/loading.dart';
import 'package:paypee/shared/components/textstyles.dart';
import 'package:paypee/shared/constants/colors.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _formKey = GlobalKey<FormState>();
  String email = '';
  bool loading = false;
  final Authservice _auth = Authservice();
  @override
  Widget build(BuildContext context) {
    return loading
        ? const Loading()
        : Scaffold(
            backgroundColor: background,
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(60),
              child: Container(
                  decoration: const BoxDecoration(boxShadow: [
                    BoxShadow(
                        offset: Offset(
                          0,
                          0.4,
                        ),
                        blurRadius: 0,
                        color: faint4)
                  ]),
                  child: AppBar(
                    elevation: 0.0,
                    backgroundColor: background,
                    automaticallyImplyLeading: false,
                    centerTitle: true,
                    leading: Padding(
                      padding: const EdgeInsets.only(right: 10, left: 20),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: SizedBox(
                            height: 25,
                            width: 25,
                            child: Image.asset('assets/images/return.png')),
                      ),
                    ),
                    title: const Text('Reset password', style: appbar),
                  )),
            ),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    subText3,
                    const SizedBox(
                      height: 40,
                    ),
                    Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Email Address',
                              style: label,
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            SizedBox(
                                height: 70,
                                child: TextFormField(
                                  autofocus: true,
                                  cursorColor: primaryColor,
                                  keyboardType: TextInputType.emailAddress,
                                  validator: ((value) => value!.isEmpty
                                      ? 'Enter a valid email'
                                      : null),
                                  style: input,
                                  onChanged: (value) {
                                    setState(
                                      () => email = value,
                                    );
                                  },
                                  decoration: emailInputDecoration,
                                )),
                          ],
                        )),
                    const Spacer(),
                    Container(
                      height: 45,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: primaryColor),
                      child: TextButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            setState(() => loading = true);
                            dynamic result = await _auth.resetPassword(email);
                            if (result == null) {
                              setState(() {
                                loading = false;
                                Flushbar(
                                  titleText: const Text(
                                    'Reset Link Sent',
                                    style: TextStyle(
                                      fontFamily: 'Mabry-Pro',
                                      fontWeight: FontWeight.w900,
                                      fontSize: 15,
                                      color: background,
                                    ),
                                  ),
                                  messageText: const Text(
                                    'Please check your mailbox for a reset link',
                                    style: TextStyle(
                                        fontFamily: 'Mabry-Pro',
                                        fontSize: 13,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  duration: (const Duration(seconds: 4)),
                                  borderRadius: BorderRadius.circular(5),
                                  backgroundColor: green100,
                                  flushbarPosition: FlushbarPosition.TOP,
                                  flushbarStyle: FlushbarStyle.FLOATING,
                                  forwardAnimationCurve: Curves.linearToEaseOut,
                                  showProgressIndicator: true,
                                  progressIndicatorBackgroundColor: primaryColor,
                                  messageSize: 14,
                                ).show(context);
                              });
                            }
                          }
                        },
                        child: const Text(
                          'Send reset link',
                          style: buttonStyle,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
