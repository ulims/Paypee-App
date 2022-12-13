import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:paypee/shared/components/animated_text.dart';
import 'package:paypee/shared/components/input_decoration.dart';
import 'package:paypee/shared/components/textstyles.dart';
import 'package:paypee/shared/constants/colors.dart';

class Username extends StatefulWidget {
  const Username({Key? key}) : super(key: key);

  @override
  State<Username> createState() => _UsernameState();
}

class _UsernameState extends State<Username> {
  final _formKey = GlobalKey<FormState>();
  final _userFirstNameController = TextEditingController();
  final _userLastNameController = TextEditingController();

  @override
  void dispose() {
    _userFirstNameController.dispose();
    _userLastNameController.dispose();
    super.dispose();
  }

  Future addUserDetails(String firstname, String lastname) async {
    await FirebaseFirestore.instance.collection('users').add({
      'first name': firstname,
      'last name': lastname,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                  usertext,
                  const SizedBox(
                    width: 5,
                  ),
                  emoji1
                ],
              ),
              subText2,
              const SizedBox(
                height: 55,
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(
                          height: 70,
                          child: TextFormField(
                            controller: _userFirstNameController,
                            autofocus: true,
                            cursorColor: primaryColor,
                            keyboardType: TextInputType.name,
                            validator: ((value) =>
                                value!.isEmpty ? 'Firstname should 3 atleast chars long' : null),
                            style: input,
                            onChanged: (value) {
                              setState(
                                () => _userFirstNameController.text = value,
                              );
                            },
                            decoration: emailInputDecoration.copyWith(
                                hintText: 'Enter Firstname',
                                hintStyle: const TextStyle(color: textColor40)),
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                          height: 70,
                          child: TextFormField(
                            controller: _userLastNameController,
                            autofocus: true,
                            cursorColor: primaryColor,
                            keyboardType: TextInputType.name,
                            validator: ((value) =>
                                value!.isEmpty ? 'Lastname should be atleast 3 chars long ' : null),
                            style: input,
                            onChanged: (value) {
                              setState(
                                () => _userLastNameController.text = value,
                              );
                            },
                            decoration: emailInputDecoration.copyWith(
                                hintText: 'Enter Lastname',
                                hintStyle: const TextStyle(color: textColor40)),
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
                     addUserDetails(_userFirstNameController.text.trim(),
                        _userLastNameController.text.trim()); 
                    }
                    
                  },
                  child: const Text(
                    'Continue',
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
