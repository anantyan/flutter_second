import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_second/pages/home.dart';
import 'package:flutter_second/pages/onboarding.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool? seenOnBoarding;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);
  SharedPreferences prefs = await SharedPreferences.getInstance();
  seenOnBoarding = prefs.getBool('seenOnBoarding') ?? false;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "My Second Flutter",
      home: seenOnBoarding == true ? const HomePage() : const OnBoardingPage(),
    );
  }
}
