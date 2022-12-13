
import 'package:flutter/material.dart';
import 'package:paypee/shared/components/textstyles.dart';
import 'package:paypee/shared/constants/colors.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:paypee/views/widgets/bottomsheets/change_passowrd_bottomsheets.dart';
import 'package:paypee/views/widgets/dialog/edit_username.dart';
import 'package:paypee/views/widgets/dialog/logout_sheet.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  String name = 'Anonymous';
  bool fingerprint = true;
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
              centerTitle: false,
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const LogoutSheet();
                          });
                    },
                    child: Image.asset(
                      'assets/images/logout.png',
                      height: 22,
                      width: 22,
                    ),
                  ),
                )
              ],
              title: const Padding(
                padding: EdgeInsets.only(
                  right: 20,
                ),
                child: Text('Account', style: appbar),
              ),
            )),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(
                  height: 27,
                ),
                Row(
                  children: [
                    Container(
                      height: 55,
                      width: 55,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: primaryColor),
                      child: ProfilePicture(
                        name: name,
                        radius: 45,
                        fontsize: 24,
                        random: true,
                        //count: 4,
                      ),
                    ),
                    const SizedBox(
                      width: 13,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: medium15.copyWith(fontSize: 20),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text('Earner',
                            style: label.copyWith(color: primaryColor))
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Divider(
                  color: textColor20,
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: ((BuildContext context) {
                          return EditUsernameDialog(
                            names: name,
                          );
                        }));
                  },
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Edit Username',
                            style: medium16,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Make changes to your username',
                            style: label.copyWith(color: textColor80),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(width: 1, color: faint4),
                            color: background,
                            borderRadius: BorderRadius.circular(5)),
                        child: const Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 17, vertical: 6),
                          child: Text(
                            'Edit',
                            style: label,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 38,
                ),
                GestureDetector(
                  onTap: () {
                    changePasswordBottomSheet(context);
                  },
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Change Password',
                            style: medium16,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Edit password',
                            style: label.copyWith(color: textColor80),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(width: 1, color: faint4),
                            color: background,
                            borderRadius: BorderRadius.circular(5)),
                        child: const Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 17, vertical: 6),
                          child: Text(
                            'Edit',
                            style: label,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                const Divider(
                  color: textColor20,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Fingerprint Lock',
                          style: medium16,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          fingerprint == true ? 'Enabled' : 'Disabled',
                          style: label.copyWith(color: textColor80),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Switch(
                        activeTrackColor: textColor20,
                        inactiveTrackColor: textColor20,
                        focusColor: primaryColor,
                        activeColor: primaryColor,
                        value: fingerprint,
                        onChanged: ((bool value) async {
                          setState(() {
                            fingerprint = value;
                          });
                        }))
                  ],
                ),
                const SizedBox(
                  height: 38,
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Change Pin',
                          style: medium16,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Edit transaction pin',
                          style: label.copyWith(color: textColor80),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: faint4),
                          color: background,
                          borderRadius: BorderRadius.circular(5)),
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 17, vertical: 6),
                        child: Text(
                          'Edit',
                          style: label,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                const Divider(
                  color: textColor20,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Report a Problem',
                          style: medium16,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'We’ll respond directly to your mail inbox',
                          style: label.copyWith(color: textColor80),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: faint4),
                          color: background,
                          borderRadius: BorderRadius.circular(5)),
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 17, vertical: 6),
                        child: Text(
                          'Send',
                          style: label,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
