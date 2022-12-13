import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:paypee/services/authentication/auth.dart';
import 'package:paypee/shared/components/animated_text.dart';
import 'package:paypee/shared/components/input_decoration.dart';
import 'package:paypee/shared/components/loading.dart';
import 'package:paypee/shared/components/textstyles.dart';
import 'package:paypee/shared/constants/colors.dart';
import 'package:paypee/views/screens/authenticate/forgot_password.dart';

class Login extends StatefulWidget {
  final Function change;
  const Login({Key? key, required this.change}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final Authservice _auth = Authservice();
  String email = '';
  String password = '';
  bool loading = false;

  final textFieldFocusNode = FocusNode();
  bool _obscured = true;
  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;
      if (textFieldFocusNode.hasPrimaryFocus) {
        return;
      } // If focus is on text field, dont unfocus
      textFieldFocusNode.canRequestFocus = true; // Prevents focus if tap on eye
    });
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? const Loading()
        : Scaffold(
            body: SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            welcome,
                            const SizedBox(
                              width: 5,
                            ),
                            emoji
                          ],
                        ),
                        subText,
                        const SizedBox(
                          height: 55,
                        ),
                        Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Column(
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
                                        height: 60,
                                        child: TextFormField(
                                          autofocus: false,
                                          cursorColor: primaryColor,
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          validator: ((value) => value!.isEmpty
                                              ? 'Enter your email'
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
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Password',
                                      style: label,
                                    ),
                                    const SizedBox(
                                      height: 7,
                                    ),
                                    SizedBox(
                                        height: 60,
                                        child: TextFormField(
                                            autocorrect: true,
                                            obscureText: _obscured,
                                            cursorColor: primaryColor,
                                            keyboardType:
                                                TextInputType.visiblePassword,
                                            validator: ((value) =>
                                                value!.length <= 5
                                                    ? 'Enter a valid password'
                                                    : null),
                                            style: input,
                                            onChanged: (value) {
                                              setState(
                                                () => password = value,
                                              );
                                            },
                                            decoration: InputDecoration(
                                                focusedBorder:
                                                    const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: primaryColor,
                                                      width: 1.5),
                                                ),
                                                contentPadding:
                                                    const EdgeInsets.fromLTRB(
                                                        13, 10, 10, 10),
                                                enabledBorder:
                                                    const OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: textColor20,
                                                            width: 1)),
                                                hintText: 'Enter password',
                                                enabled: true,
                                                errorBorder:
                                                    const OutlineInputBorder(
                                                        gapPadding: 0.0,
                                                        borderSide: BorderSide(
                                                            color: red100,
                                                            width: 1)),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  //gapPadding: 50.0,
                                                  borderSide: const BorderSide(
                                                      color: red100, width: 1),
                                                ),
                                                hintStyle: const TextStyle(
                                                    fontFamily: 'Mabry-Pro',
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                    color: textColor30),
                                                errorStyle: const TextStyle(
                                                    fontFamily: 'Mabry-Pro',
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w400,
                                                    color: red80),
                                                suffixIcon: GestureDetector(
                                                  onTap: _toggleObscured,
                                                  child: Icon(
                                                    _obscured
                                                        ? Icons
                                                            .visibility_off_rounded
                                                        : Icons
                                                            .visibility_rounded,
                                                    size: 19,
                                                    color: textColor100,
                                                  ),
                                                )))),
                                  ],
                                ),
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: ((context) =>
                                                  const ForgotPassword())));
                                    },
                                    child: const Text(
                                      'Forgot password',
                                      style: TextStyle(
                                          fontFamily: 'Mabry-Pro',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: primaryColor),
                                    )),
                                const SizedBox(
                                  height: 35,
                                ),
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
                                        if (_formKey.currentState!.validate()) {
                                          setState(() => loading = true);
                                          dynamic result = await _auth.signIn(
                                              email, password);
                                          if (result == null) {
                                            setState(() {
                                              loading = false;

                                              Flushbar(
                                                message:
                                                    'Invalid login details😢',
                                                duration: (const Duration(
                                                    seconds: 2)),
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                maxWidth: 200,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 14,
                                                        vertical: 10),
                                                backgroundColor: red100,
                                                flushbarPosition:
                                                    FlushbarPosition.TOP,
                                                flushbarStyle:
                                                    FlushbarStyle.FLOATING,
                                                forwardAnimationCurve:
                                                    Curves.linearToEaseOut,
                                                messageSize: 14,
                                              ).show(context);
                                            });
                                          } else {
                                            if (!mounted) {}
                                            Flushbar(
                                              message: 'Welcome Investor😎',
                                              duration:
                                                  (const Duration(seconds: 2)),
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              maxWidth: 180,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 14,
                                                      vertical: 10),
                                              backgroundColor: green100,
                                              flushbarPosition:
                                                  FlushbarPosition.TOP,
                                              flushbarStyle:
                                                  FlushbarStyle.FLOATING,
                                              forwardAnimationCurve:
                                                  Curves.linearToEaseOut,
                                              messageSize: 14,
                                            ).show(context);
                                          }
                                        }
                                      }
                                    },
                                    child: const Text(
                                      'Login',
                                      style: buttonStyle,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                                Center(
                                  child: GestureDetector(
                                    onTap: () {
                                      widget.change();
                                    },
                                    child: RichText(
                                        text: const TextSpan(
                                            style: label,
                                            children: [
                                          TextSpan(
                                              text: 'Dont have an account?'),
                                          WidgetSpan(
                                              child: SizedBox(
                                            width: 8,
                                          )),
                                          TextSpan(
                                              text: 'Sign Up',
                                              style: TextStyle(
                                                  color: primaryColor,
                                                  fontWeight: FontWeight.w500))
                                        ])),
                                  ),
                                ),
                              ],
                            )),
                      ]),
                ),
              ),
            ),
          );
  }
}
