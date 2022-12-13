import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:paypee/shared/components/animated_text.dart';
import 'package:paypee/shared/components/textstyles.dart';
import 'package:paypee/shared/constants/colors.dart';

void saveBottomSheet(context) {
  showModalBottomSheet(
    isScrollControlled: true,
      context: context,
      builder: ((context) {
        return Container(
          color: background,
          height: MediaQuery.of(context).size.height / 1.65,
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
                        height: 200,
                        width: 200,
                        child: Image.asset('assets/images/onboard 1.png'),
                      ),
                      SizedBox(
                        height: 200,
                        width: 200,
                        child: Image.asset('assets/images/onboard 2.png'),
                      ),
                    ],
                    options: CarouselOptions(
                        autoPlay: true, enlargeCenterPage: true)),
                const SizedBox(
                  height: 15,
                ),
                paysave,
                paysave2,
                const SizedBox(
                  height: 50,
                ),
                Container(
                  height: 45,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: primaryColor),
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Continue',
                      style: buttonStyle,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }));
}
