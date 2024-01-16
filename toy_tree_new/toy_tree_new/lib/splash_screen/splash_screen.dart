import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toy_tree_new/home/home.dart';
import 'package:toy_tree_new/utility/applogo_widget.dart';
import 'package:toy_tree_new/utility/consts/colors.dart';
import 'package:toy_tree_new/utility/consts/images.dart';
import 'package:toy_tree_new/utility/consts/strings.dart';
import 'package:toy_tree_new/utility/consts/styles.dart';
import 'package:velocity_x/velocity_x.dart';

import '../auth/onboading.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // creating a method to change screen


  void changeScreen() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool? isLogin = sharedPreferences.getBool("isLogin");
    print("===>IS LOGIN=>$isLogin");
    if (isLogin != null) {
      if (isLogin == true) {
        Future.delayed( Duration(seconds: 3), () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => Home()));
        //  Get.offAll( Home());
        });
      } else {
        Future.delayed(const Duration(seconds: 3), () {
         // Get.offAll(() => const OnboardingScreen());
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => OnboardingScreen()));
        //  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> OnboardingScreen()));
        });
      }
    } else {
      print("====LOGIN ELSE");
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => OnboardingScreen()));
      //  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>OnboardingScreen()));
      //  Get.offAll(() => const OnboardingScreen());
      });
    }
  }


  @override
  void initState() {
    changeScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: redColor,
      body: Center(
        child: Column(
          children: [
            Align(
                alignment: Alignment.topLeft,
                child: Image.asset(icSplashBg, width: 300)),
            20.heightBox,
            applogoWidget(),
            10.heightBox,
            appname.text.fontFamily(bold).size(22).white.make(),
            5.heightBox,
            appversion.text.white.make(),
            const Spacer(),
            credits.text.white.fontFamily(semibold).make(),
            30.heightBox,
            //Splash Screen is Completed.....
          ],
        ),
      ),
    );
  }
}
