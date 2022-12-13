import 'package:flutter/material.dart';
import 'package:paypee/models/onboard_model.dart';
import 'package:lottie/lottie.dart';
import 'package:paypee/provider/wrapper.dart';
import 'package:paypee/shared/constants/colors.dart';
import 'package:paypee/views/mediaQuery/sizeConfig.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Onboard extends StatefulWidget {
  const Onboard({Key? key}) : super(key: key);

  @override
  State<Onboard> createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {
  int currentIndex = 0;
  late PageController _pageController;
  List<OnboardModel> onboardlist = [
    OnboardModel(
        image: 'assets/images/investment app.json',
        titleText: 'Easiest way to Invest in Dollars',
        subtitle:
            'Express your creativity with using our appa using our primitive'),
    OnboardModel(
        image: 'assets/images/onboard 2.json',
        titleText: 'Take charge of your investment',
        subtitle:
            'Express your creativity with using our appa using our primitive')
  ];

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

  _storeOnboardInfo() async {
    int isViewed = 0;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('onboard', isViewed);
    // print('shredbro called');
  }

  AnimatedContainer _buildDots({int? index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(50),
        ),
        color: currentIndex == index ? primaryColor : textColor20
      ),
      margin: const EdgeInsets.only(right: 5),
      height: 10,
      curve: Curves.easeIn,
      width: currentIndex == index ? 20 : 10,
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.screenW!;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Expanded(
                flex: 5,
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (value) {
                    setState(() {
                      currentIndex = value;
                    });
                  },
                  itemCount: onboardlist.length,
                  itemBuilder: (_, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          SizedBox(
                            height: SizeConfig.blockV! * 50,
                            child: Lottie.asset(onboardlist[index].image),
                          ),
                          TweenAnimationBuilder(
                        tween: Tween<double>(begin: 0, end: 1),
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn,
                        builder: (BuildContext context, double val, Widget? child){
                        return Opacity(
                        opacity: val,
                        child: Padding(
                        padding: EdgeInsets.only(top: val * 10),
                        child: child,
                        ),
                        );
                        },
                        child: Text(
                        onboardlist[index].titleText,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                        fontFamily: 'Mabry-Pro',
                        fontSize: (width <= 700) ? 27 : 35,
                        fontWeight: FontWeight.w500,
                        color: textColor100,
                        height: 1.32
                        ),
                        ),
                        ),
                         TweenAnimationBuilder(
                        tween: Tween<double>(begin: 0, end: 1),
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn,
                        builder: (BuildContext context, double val, Widget? child){
                        return Opacity(
                        opacity: val,
                        child: Padding(
                        padding: EdgeInsets.only(top: val * 10),
                        child: child,
                        ),
                        );
                        },
                        child: Text(
                        onboardlist[index].subtitle,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                        fontFamily: 'Mabry-Pro',
                        fontSize: (width <= 700) ? 17 : 19,
                        fontWeight: FontWeight.w400,
                        color: textColor80,
                        height: 1.38
                        ),
                        ),
                        ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 10,),
                    Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            onboardlist.length,
                            (int index) => _buildDots(index: index),
                          ),
                          ),
                          GestureDetector(
                      onTap: () {
                          _storeOnboardInfo();
                          Navigator.pushReplacement(context, 
                          MaterialPageRoute(builder: ((context) => const Wrapper())));
                        
                         _pageController.nextPage(duration: 
                          const Duration(milliseconds: 300), curve: Curves.easeIn);
                        },
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(50, 20, 50, 20),
                          child: Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: primaryColor
                          ),
                          child: const Center(
                          child: Text(
                          'Proceed to App👋',
                          style: TextStyle(
                            color: background,
                            fontSize: 15, 
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Mabry-Pro'
                          ),
                          
                            ),
                          ),
                          ),
                        ),
                      )
                        ],
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
