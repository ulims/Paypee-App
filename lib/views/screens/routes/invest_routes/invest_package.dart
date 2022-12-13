import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:paypee/models/invest_model.dart';
import 'package:paypee/shared/components/textstyles.dart';
import 'package:paypee/shared/constants/colors.dart';
import 'package:paypee/views/screens/routes/invest_routes/invest_amount.dart';

class InvestPackage extends StatefulWidget {
  const InvestPackage({Key? key}) : super(key: key);

  @override
  State<InvestPackage> createState() => _InvestPackageState();
}

class _InvestPackageState extends State<InvestPackage> {
  int currentIndex = 0;
  late PageController _pageController;
  List<InvestModel> packagelist = [
    InvestModel(
        name: 'Paypee Crypto',
        image: 'assets/images/crypto.png',
        duration: 30,
        price: 10.0,
        priceRange: 100.0,
        desc:
            'Card available in two options of payment system Visa and Mastercard',
        percentage: 5),
    InvestModel(
        name: 'Paypee Forex',
        image: 'assets/images/forex.png',
        duration: 60,
        price: 100.0,
        priceRange: 1000.0,
        desc:
            'Card available in two options of payment system Visa and Mastercard',
        percentage: 10),
    InvestModel(
        name: 'Paypee Extra',
        image: 'assets/images/extra.png',
        duration: 100,
        price: 1000.0,
        priceRange: 10000.0,
        desc:
            'Card available in two options of payment system Visa and Mastercard',
        percentage: 15),
  ];

  AnimatedContainer _buildDots({int? index}) {
    return AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(50),
            ),
            color: currentIndex == index ? primaryColor : textColor20),
        margin: const EdgeInsets.only(right: 5),
        height: 8,
        curve: Curves.easeIn,
        width: currentIndex == index ? 33 : 8);
  }

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
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
            )),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 800,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    currentIndex == 1
                        ? 'assets/images/page.png'
                        : 'assets/images/page 2.png',
                  ),
                  fit: BoxFit.fill)),
          child: PageView.builder(
              controller: _pageController,
              itemCount: packagelist.length,
              onPageChanged: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
              itemBuilder: ((context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 17,
                      ),
                      Text(
                        packagelist[index].name,
                        style: const TextStyle(
                            fontFamily: 'Mabry-Pro',
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: textColor100),
                      ),
                      Stack(alignment: AlignmentDirectional.topEnd, children: [
                        TweenAnimationBuilder(
                            tween: Tween<double>(begin: 0, end: 1),
                            duration: const Duration(milliseconds: 900),
                            curve: Curves.easeIn,
                            builder: (BuildContext context, double val,
                                Widget? child) {
                              return Opacity(
                                opacity: val,
                                child: Padding(
                                  padding: EdgeInsets.only(top: val * 38),
                                  child: child,
                                ),
                              );
                            },
                            child: ClipRRect(
                              child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                      sigmaX: 10.0, sigmaY: 10.0),
                                  child: Image.asset(packagelist[index].image)),
                            )),
                        TweenAnimationBuilder(
                            tween: Tween<double>(begin: 0, end: 1),
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.easeIn,
                            builder: (BuildContext context, double val,
                                Widget? child) {
                              return Opacity(
                                opacity: val,
                                child: Padding(
                                  padding: EdgeInsets.only(top: val * 38),
                                  child: child,
                                ),
                              );
                            },
                            child: Image.asset(packagelist[index].image)),
                      ]),
                      const SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          packagelist.length,
                          (int index) => _buildDots(index: index),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: background.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(24)),
                        child: Padding(
                          padding: const EdgeInsets.all(18),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Center(
                                    child: Container(
                                      height: 5,
                                      width: 33,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(30),
                                          color: faint4),
                                    ),
                                  ),
                                ],
                              ),
                              TweenAnimationBuilder(
                                  tween: Tween<double>(begin: 0, end: 1),
                                  duration: const Duration(milliseconds: 400),
                                  curve: Curves.easeIn,
                                  builder: (BuildContext context, double val,
                                      Widget? child) {
                                    return Opacity(
                                      opacity: val,
                                      child: Padding(
                                        padding: EdgeInsets.only(top: val * 14),
                                        child: child,
                                      ),
                                    );
                                  },
                                  child: Text(
                                    '${packagelist[index].name} card',
                                    style: appbar.copyWith(
                                        fontWeight: FontWeight.w500),
                                  )),
                              TweenAnimationBuilder(
                                  tween: Tween<double>(begin: 0, end: 1),
                                  duration: const Duration(milliseconds: 800),
                                  curve: Curves.easeIn,
                                  builder: (BuildContext context, double val,
                                      Widget? child) {
                                    return Opacity(
                                      opacity: val,
                                      child: Padding(
                                        padding: EdgeInsets.only(top: val * 10),
                                        child: child,
                                      ),
                                    );
                                  },
                                  child: Text(packagelist[index].desc,
                                      style: label.copyWith(
                                          color: textColor60, height: 1.5))),
                              const SizedBox(
                                height: 40,
                              ),
                              Container(
                                height: 73,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: faint3),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Row(
                                    children: [
                                      Image.asset('assets/images/investLogo.png'),
                                      const SizedBox(
                                        width: 16,
                                      ),
                                      RichText(
                                          text: TextSpan(
                                              text:
                                                  '${packagelist[index].percentage}%',
                                              style: const TextStyle(
                                                  fontFamily: 'Mabry-Pro',
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500,
                                                  color: textColor100),
                                              children: const [
                                            WidgetSpan(
                                                child: SizedBox(
                                              width: 7,
                                            )),
                                            TextSpan(
                                                text: 'monthly',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: textColor60,
                                                    fontWeight: FontWeight.w400))
                                          ])),
                                      const Spacer(),
                                      Image.asset(
                                        'assets/images/checkBox.png',
                                        height: 24,
                                        width: 24,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 26,
                              ),
                              Center(
                                child: RichText(
                                    text: const TextSpan(
                                        text: 'Read our',
                                        style: TextStyle(
                                            fontFamily: 'Mabry-Pro',
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400,
                                            color: textColor60),
                                        children: [
                                      WidgetSpan(
                                          child: SizedBox(
                                        width: 5,
                                      )),
                                      TextSpan(
                                          text: 'Terms of Service',
                                          style: TextStyle(
                                            color: primaryColor,
                                          )),
                                      WidgetSpan(
                                          child: SizedBox(
                                        width: 5,
                                      )),
                                      TextSpan(
                                        text: 'and',
                                      ),
                                      WidgetSpan(
                                          child: SizedBox(
                                        width: 5,
                                      )),
                                      TextSpan(
                                          text: 'Terms of Use',
                                          style: TextStyle(
                                            color: primaryColor,
                                          )),
                                    ])),
                              ),
                              const SizedBox(
                                height: 33,
                              ),
                              Container(
                                height: 48,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: currentIndex == 0
                                        ? textColor100
                                        : currentIndex == 2
                                            ? red100
                                            : primaryColor,
                                    borderRadius: BorderRadius.circular(5)),
                                child: TextButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: ((context) => InvestAmount(
                                                  investModelsend:
                                                      packagelist[index]))));
                                    },
                                    child: const Text(
                                      ' I want to Invest',
                                      style: buttonStyle,
                                    )),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              })),
        ),
      ),
    );
  }
}
