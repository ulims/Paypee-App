import 'package:flutter/material.dart';
import 'package:paypee/shared/components/no_activity.dart';
import 'package:paypee/shared/components/textstyles.dart';
import 'package:paypee/shared/constants/colors.dart';
import 'package:paypee/views/screens/routes/invest_routes/invest_package.dart';


class Investment extends StatefulWidget {
  const Investment({Key? key}) : super(key: key);

  @override
  State<Investment> createState() => _InvestmentState();
}

class _InvestmentState extends State<Investment> {
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
              title: const Padding(
                padding: EdgeInsets.only(
                  right: 20,
                ),
                child: Text('Investment', style: appbar),
              ),
            )),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(children: [
              const SizedBox(
                height: 24,
              ),
              Container(
                height: 105,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: primaryColor,
                    image: const DecorationImage(
                        image: AssetImage('assets/images/slider 3.png'),
                        fit: BoxFit.fill)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 19, top: 19, right: 19),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Investment Balance',
                            style: tag,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 16,
                                width: 12,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/dollar.png'))),
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              const Text(
                                '0.00',
                                style: balance,
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {},
                        child: const Icon(
                          Icons.visibility_rounded,
                          color: background,
                          size: 20,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 170,
              ),
              noEarning
            ]),
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        height: 45,
        width: 45,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: ((context) => const InvestPackage())));
          },
          backgroundColor: primaryColor,
          elevation: 2.5,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
