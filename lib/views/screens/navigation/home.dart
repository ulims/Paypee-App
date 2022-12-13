import 'package:flutter/material.dart';
import 'package:paypee/shared/components/textstyles.dart';
import 'package:paypee/shared/constants/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:paypee/views/screens/routes/cashout/withdrawal_home.dart';
import 'package:paypee/views/screens/routes/home_routes/market_update.dart';
import 'package:paypee/views/screens/routes/home_routes/notifications.dart';
import 'package:paypee/views/screens/routes/recieve_funds/receive_Usdt.dart';
import 'package:paypee/views/screens/routes/send_funds/add%20_address.dart';
import 'package:paypee/views/widgets/bottomsheets/invests_bottomsheets.dart';
import 'package:paypee/views/widgets/bottomsheets/savings_bottomsheeet.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final CarouselController _controller = CarouselController();
  bool hideAmount = false;
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
              actions: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: ((context) => const MarketUpdate())));
                        },
                        child: Image.asset(
                          'assets/images/market.png',
                          height: 16,
                          width: 18,
                        ),
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: ((context) =>
                                  const Notificationpage())));
                        },
                        child: Image.asset(
                          'assets/images/notifications.png',
                          height: 19,
                          width: 19,
                        ),
                      ),
                    ],
                  ),
                )
              ],
              title: const Padding(
                padding: EdgeInsets.only(
                  left: 0,
                ),
                child: Text('Home', style: appbar),
              ),
            )),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(
                  height: 25,
                ),
                CarouselSlider(
                    carouselController: _controller,
                    items: [
                      Container(
                        height: 105,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: primaryColor,
                            image: const DecorationImage(
                                image: AssetImage('assets/images/slider 1.png'),
                                fit: BoxFit.fill)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 19, top: 19, right: 19),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Main Wallet Balance',
                                    style: tag,
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                      Container(
                        height: 113,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: textColor100,
                            image: const DecorationImage(
                                image: AssetImage('assets/images/slider 2.png'),
                                fit: BoxFit.fill)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 19, top: 19, right: 19),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Savings Wallet Balance',
                                    style: tag,
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                              const Icon(
                                Icons.visibility_rounded,
                                color: background,
                                size: 20,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                    options: CarouselOptions(
                      autoPlay: true,
                      viewportFraction: 1,
                      height: 105,
                      enlargeCenterPage: true,
                      initialPage: 0,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      autoPlayAnimationDuration: const Duration(
                        milliseconds: 500,
                      ),
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                    )),
                const SizedBox(
                  height: 10,
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeIn,
                  height: 10.0,
                  child: ListView.builder(
                    itemCount: 2,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 3.0),
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                color: _currentIndex == index
                                    ? primaryColor
                                    : textColor20,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ]);
                    },
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                GridView.count(
                  primary: false,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(0),
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 14,
                  childAspectRatio: 1.6,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: ((context) => const AddAdress())));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: grid),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(15, 22, 15, 21.5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                'assets/images/send_2.png',
                                height: 28,
                                width: 28,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                'Send Funds',
                                style: medium15,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: ((context) => const Receive())));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: grid),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(15, 22, 15, 21.5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                'assets/images/receive_2.png',
                                height: 28,
                                width: 28,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                'Receive Funds',
                                style: medium15,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        investBottomSheet(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: grid),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(15, 22, 15, 21.5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                'assets/images/add.png',
                                height: 28,
                                width: 28,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                'Invest Funds',
                                style: medium15,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: ((context) => const Withdrawal())));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: grid),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(15, 22, 15, 21.5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                'assets/images/cashout.png',
                                height: 28,
                                width: 28,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                'Cashout',
                                style: medium15,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        saveBottomSheet(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: grid),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(15, 22, 15, 22),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                'assets/images/lock.png',
                                height: 26,
                                width: 26,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                'Save Funds',
                                style: medium15,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
