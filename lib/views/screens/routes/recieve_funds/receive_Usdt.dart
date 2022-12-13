import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:paypee/shared/components/textstyles.dart';
import 'package:paypee/shared/constants/colors.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:another_flushbar/flushbar.dart';

class Receive extends StatefulWidget {
  const Receive({Key? key}) : super(key: key);

  @override
  State<Receive> createState() => _ReceiveState();
}

class _ReceiveState extends State<Receive> {
  Future<void> _copytoClipboard() async {
    await Clipboard.setData(
        const ClipboardData(text: '1HTnz289t3JfYgaRT2ioBXmbPybWr5jT9t'));
    if (!mounted) return;
    Flushbar(
      message: 'Copied to Clipboard',
      duration: (const Duration(seconds: 2)),
      borderRadius: BorderRadius.circular(30),
      maxWidth: MediaQuery.of(context).size.width / 2.2,
      backgroundColor: green100,
      flushbarPosition: FlushbarPosition.TOP,
      flushbarStyle: FlushbarStyle.FLOATING,
      forwardAnimationCurve: Curves.linearToEaseOut,
      messageSize: 14,
    ).show(context);
  }

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
              title: const Text('Receive Funds', style: appbar),
            )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(color: faint4, width: 1),
                    borderRadius: BorderRadius.circular(5)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/images/warning.png',
                        height: 20,
                        width: 20,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Flexible(
                        child: MediaQuery.removePadding(
                          context: context,
                          removeTop: true,
                          child: Text(
                            'Only send Tether to this address. Ensure the sender is on the USDT network or you might lose your deposit',
                            style: medium15.copyWith(
                                fontWeight: FontWeight.w400,
                                height: 1.46,
                                color: textColor80),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 43,
              ),
              Center(
                child: PrettyQr(
                  data: '1HTnz289t3JfYgaRT2ioBXmbPybWr5jT9t',
                  image: const AssetImage('assets/images/qr_code.png'),
                  size: MediaQuery.of(context).size.width / 1.4,
                  roundEdges: true,
                  elementColor: textColor100,
                ),
              ),
              const SizedBox(
                height: 43,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(color: faint4, width: 1),
                    borderRadius: BorderRadius.circular(5)),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Deposit address',
                        style: medium15.copyWith(
                            color: textColor60, fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        '1HTnz289t3JfYgaRT2ioBXmbPybWr5jT9t',
                        style: medium16.copyWith(
                            fontSize: 15, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 53,
              ),
              Container(
                height: 48,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: textColor100, borderRadius: BorderRadius.circular(5)),
                child: TextButton(
                  onPressed: () {
                    _copytoClipboard();
                  },
                  child: const Text(
                    'Deposit Address',
                    style: buttonStyle,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
