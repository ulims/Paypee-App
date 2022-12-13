import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:paypee/shared/components/animated_text.dart';
import 'package:paypee/shared/components/textstyles.dart';
import 'package:paypee/shared/constants/colors.dart';
import 'package:paypee/views/screens/routes/invest_routes/invest_package.dart';

void investBottomSheet(context) {
  showModalBottomSheet(
    isScrollControlled: true,
      context: context,
      builder: ((context) {
        return Container(
          color: background,
          height: MediaQuery.of(context).size.height / 1.6,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 8,
                      width: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: textColor20),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                CarouselSlider(
                    items: [
                      SizedBox(
                        height: 300,
                        width: MediaQuery.of(context).size.height / 1,
                        child: Image.asset(
                          'assets/images/crypto_card.png',
                        ),
                      ),
                      SizedBox(
                        height: 300,
                        width: MediaQuery.of(context).size.height / 1,
                        child: Image.asset('assets/images/forex_card.png'),
                      ),
                      SizedBox(
                        height: 200,
                        width: MediaQuery.of(context).size.height / 1,
                        child: Image.asset('assets/images/extra_card.png'),
                      )
                    ],
                    options: CarouselOptions(
                        autoPlay: true,
                        enlargeCenterPage: true,
                        autoPlayInterval: const Duration(seconds: 2))),
                const SizedBox(
                  height: 15,
                ),
                payvest,
                paysave2,
                // const SizedBox(
                //   height: 50,
                // ),
                Spacer(),
                Container(
                  height: 45,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: primaryColor),
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: ((context) => const InvestPackage())));
                    },
                    child: const Text(
                      'Continue',
                      style: buttonStyle,
                    ),
                  ),
                ),
                const SizedBox(height: 40,)
              ],
            ),
          ),
        );
      }));
}
