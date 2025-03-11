import 'package:flutter/material.dart';
import 'package:thirdd/main/main_screen.dart';
// import 'package:thirdd/main/main_screen.dart';
import 'package:thirdd/service/pref_handler.dart';
import 'package:thirdd/utils/constant/app_color.dart';
import 'package:thirdd/utils/constant/app_image.dart';
import 'package:thirdd/views/auth/login_screen.dart';
import 'package:thirdd/views/introduction_screen.dart';
// import 'package:thirdd/views/auth/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    getDataUser();
  }

  void getDataUser() async {
    // get data user
    var userId = await PreferenceHandler.getId();
    var lookWelcoming = await PreferenceHandler.getLookWelcoming();
    Future.delayed(Duration(seconds: 2), () {
      if (lookWelcoming == false) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => IntroScreen()),
        );
      } else if (userId != '') {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MainScreen(email: userId, phone: userId),
          ),
        );
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Center(
        child: Image.asset(
          AppImage.logo2,

          height: MediaQuery.of(context).size.width * 0.5,
          width: MediaQuery.of(context).size.width * 0.5,
        ),
      ),
    );
  }
}
