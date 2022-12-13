import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:paypee/shared/components/textstyles.dart';
import 'package:paypee/shared/constants/colors.dart';
import 'package:paypee/views/screens/routes/send_funds/confirm_transaction.dart';

class EnterAmount extends StatefulWidget {
  final String acceptaddress;
  const EnterAmount({Key? key, required this.acceptaddress}) : super(key: key);

  @override
  State<EnterAmount> createState() => _EnterAmountState();
}

class _EnterAmountState extends State<EnterAmount> {
  String amount = '';
  final _formKey = GlobalKey<FormState>();
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
                title: const Text('Enter Amount', style: appbar),
              )),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 35,
                ),
                Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: faint4),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18, vertical: 13),
                    child: Row(
                      children: [
                        Image.asset('assets/images/wall.png'),
                        const SizedBox(
                          width: 7,
                        ),
                        Text(
                          'Balance',
                          style: medium15.copyWith(fontWeight: FontWeight.w400),
                        ),
                        const Spacer(),
                        Text(
                          NumberFormat.simpleCurrency(
                                  locale: 'en_Us', decimalDigits: 2)
                              .format(0),
                          style: medium16,
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Form(
                    key: _formKey,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      autofocus: true,
                      showCursor: false,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          hintText: '0',
                          // prefix: Text('USD', style: label,),
                          errorStyle: TextStyle(color: background),
                          hintStyle: TextStyle(
                              fontFamily: 'Mabry-Pro',
                              fontSize: 38,
                              color: textColor20,
                              fontWeight: FontWeight.w500)),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontFamily: 'Mabry-Pro',
                          fontSize: 38,
                          fontWeight: FontWeight.w500,
                          color: textColor100),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return Flushbar(
                            message: 'Invalid Amount value',
                            duration: (const Duration(seconds: 2)),
                            borderRadius: BorderRadius.circular(30),
                            maxWidth: MediaQuery.of(context).size.width / 2.5,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14, vertical: 10),
                            backgroundColor: red100,
                            flushbarPosition: FlushbarPosition.TOP,
                            flushbarStyle: FlushbarStyle.FLOATING,
                            forwardAnimationCurve: Curves.linearToEaseOut,
                            messageSize: 13,
                          ).show(context).toString();
                        } else {
                          return null;
                        }
                      },
                      onChanged: (value) {
                        setState(() {
                          amount = value;
                        });
                      },
                    )),
                const Spacer(),
                Container(
                  height: 45,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: textColor100),
                  child: TextButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: ((context) => ConfirmSending(
                                  address: widget.acceptaddress,
                                  amount: amount,
                                ))));
                      }
                    },
                    child: const Text(
                      'Send Funds',
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
        ));
  }
}
