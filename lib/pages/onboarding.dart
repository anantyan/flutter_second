import 'package:flutter/material.dart';
import 'package:flutter_second/main.dart';
import 'package:flutter_second/pages/home.dart';
import 'package:flutter_second/utils/size.dart';
import 'package:flutter_second/widgets/onboarding_nav_button.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/onboarding.dart';
import '../utils/styles.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  int currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeVertical = SizeConfig.blockSizeVertical!;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 9,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: itemOnBoarding.length,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            OnBoardingNavButton(
                                name: "Skip",
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return const HomePage();
                                  }));
                                },
                                buttonColor: cPurpleColor)
                          ],
                        ),
                      ),
                      SizedBox(
                        height: sizeVertical * 1,
                      ),
                      SizedBox(
                        height: sizeVertical * 50,
                        child: SvgPicture.asset(
                          itemOnBoarding[index].image,
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(
                        height: sizeVertical * 2,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            itemOnBoarding[index].title,
                            style: cTitleOnBoarding,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: sizeVertical * 1,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            itemOnBoarding[index].subtitle,
                            style: cSubtitleOnBoarding,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: sizeVertical * 5,
                      )
                    ],
                  );
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    currentPage == itemOnBoarding.length - 1
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: List.generate(
                                    itemOnBoarding.length,
                                    (index) => AnimatedContainer(
                                          duration:
                                              const Duration(milliseconds: 400),
                                          margin:
                                              const EdgeInsets.only(right: 8),
                                          height: 8,
                                          width: 8,
                                          decoration: BoxDecoration(
                                              color: cYellowColor,
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              shape: BoxShape.rectangle),
                                        )),
                              ),
                              OnBoardingNavButton(
                                  name: "Get Started",
                                  onPressed: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                            return const HomePage();
                                          }));
                                  },
                                  buttonColor: cYellowColor)
                            ],
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: List.generate(itemOnBoarding.length,
                                    (index) => dotIndicator(index)),
                              ),
                              OnBoardingNavButton(
                                  name: "Next",
                                  onPressed: () {
                                    _pageController.nextPage(
                                        duration:
                                            const Duration(milliseconds: 400),
                                        curve: Curves.easeInOut);
                                  },
                                  buttonColor: cPurpleColor)
                            ],
                          )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  AnimatedContainer dotIndicator(index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      margin: const EdgeInsets.only(right: 8),
      height: 8,
      width: currentPage == index ? 24 : 8,
      decoration: BoxDecoration(
          color: currentPage == index ? cPurpleColor : cDarkWhiteColor,
          borderRadius: BorderRadius.circular(8),
          shape: BoxShape.rectangle),
    );
  }

  Future setOnBoarding() async {
    final prefs = await SharedPreferences.getInstance();
    seenOnBoarding = await prefs.setBool('seenOnBoarding', true);
  }
}
