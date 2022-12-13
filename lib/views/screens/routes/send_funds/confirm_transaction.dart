import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:paypee/shared/components/animated_text.dart';
import 'package:paypee/shared/components/textstyles.dart';
import 'package:paypee/shared/constants/colors.dart';

class ConfirmSending extends StatefulWidget {
  final String address;
  final String amount;
  const ConfirmSending({Key? key, required this.address, required this.amount})
      : super(key: key);

  @override
  State<ConfirmSending> createState() => _ConfirmSendingState();
}

class _ConfirmSendingState extends State<ConfirmSending> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
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
              title: const Text('Confirm Transaction', style: appbar),
            )),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(
                height: 25,
              ),
              Center(
                  child: Column(
                children: [
                  amountText,
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.amount,
                    style: const TextStyle(
                        fontFamily: 'Mabry-Pro',
                        fontSize: 32,
                        color: textColor100,
                        fontWeight: FontWeight.w900),
                  ),
                ],
              )),
              const SizedBox(
                height: 36,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/paysend.png',
                    height: 23,
                    width: 23,
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: textColor20, width: 2),
                        color: textColor100),
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 9, vertical: 4.5),
                      child: Center(
                          child: Text(
                        'Send',
                        style: tag,
                      )),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'Tether',
                    style: input.copyWith(fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  Image.asset(
                    'assets/images/tether.png',
                    height: 20,
                    width: 20,
                  ),
                ],
              ),
              const SizedBox(
                height: 7,
              ),
              const Divider(
                color: textColor20,
              ),
              const SizedBox(
                height: 13,
              ),
              Row(
                children: [
                  Text(
                    'To',
                    style: tag.copyWith(color: textColor80),
                  ),
                  const Spacer(),
                  Text(
                    widget.address,
                    style: input.copyWith(fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                color: textColor20,
              ),
              const SizedBox(
                height: 13,
              ),
              Row(
                children: [
                  Text(
                    'Amount in USD',
                    style: tag.copyWith(color: textColor80),
                  ),
                  const Spacer(),
                  Text(
                    widget.amount,
                    style: input.copyWith(fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                color: textColor20,
              ),
              const SizedBox(
                height: 13,
              ),
              Row(
                children: [
                  Text(
                    'Network Fee',
                    style: tag.copyWith(color: textColor80),
                  ),
                  const Spacer(),
                  Text(
                    '1.00',
                    style: input.copyWith(fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              const Spacer(),
              Container(
                height: 45,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: textColor100),
                child: TextButton(
                  onPressed: () {
                    if (!mounted) return;
                    {
                      Flushbar(
                        message: 'Coming soon',
                        duration: (const Duration(seconds: 2)),
                        borderRadius: BorderRadius.circular(30),
                        maxWidth: MediaQuery.of(context).size.width / 3.2,
                        padding: const EdgeInsets.symmetric(
                                horizontal: 14, vertical: 10),
                        backgroundColor: primaryColor,
                        flushbarPosition: FlushbarPosition.TOP,
                        flushbarStyle: FlushbarStyle.FLOATING,
                        forwardAnimationCurve: Curves.linearToEaseOut,
                        messageSize: 14,
                      ).show(context);
                    }
                  },
                  child: const Text(
                    'Confirm & Proceed',
                    style: buttonStyle,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
