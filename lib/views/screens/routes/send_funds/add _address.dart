import 'package:flutter/material.dart';
import 'package:paypee/shared/components/input_decoration.dart';
import 'package:paypee/shared/components/textstyles.dart';
import 'package:paypee/shared/constants/colors.dart';
import 'package:paypee/views/screens/routes/send_funds/enter_amount.dart';

class AddAdress extends StatefulWidget {
  const AddAdress({Key? key}) : super(key: key);

  @override
  State<AddAdress> createState() => _AddAdressState();
}

class _AddAdressState extends State<AddAdress> {
  final _formKey = GlobalKey<FormState>();
  String address = '';
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
              title: const Text('Send Funds', style: appbar),
            )),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(
                height: 38,
              ),
              Form(
                  key: _formKey,
                  child: SizedBox(
                      height: 70,
                      width: double.infinity,
                      child: TextFormField(
                        cursorColor: primaryColor,
                        autofocus: true,
                        decoration: emailInputDecoration.copyWith(
                            hintText: 'Enter USDT address'),
                        style: input,
                        validator: (value) {
                          return value!.length < 27
                              ? 'Enter a valid USDT address'
                              : null;
                        },
                        onChanged: (value) {
                          setState(() => address = value);
                        },
                      ))),
              const Spacer(),
              Container(
                height: 45,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: textColor100),
                child: TextButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: ((context) => EnterAmount(acceptaddress: address,))));
                    }
                  },
                  child: const Text(
                    'Proceed',
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
