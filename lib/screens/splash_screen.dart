import 'package:elegant_media_project/routes.dart';
import 'package:elegant_media_project/styles/assets.dart';
import 'package:elegant_media_project/styles/theme.dart';
import 'package:elegant_media_project/utils/navigation_util.dart';
import 'package:elegant_media_project/utils/screen_util.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 4000), () async {
      moveToScreen(context, ScreenRoutes.toSignInScreen);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            // fit: BoxFit.fill,
            height: getScreenHeight(context) * 0.4,
            width: getScreenWidth(context),
            image: const AssetImage(splashLogo),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Elegant Media Project",
            style: TextStyle(
                color: AppColors.blue,
                fontWeight: FontWeight.bold,
                fontSize: 30),
          )
        ],
      ),
    );
    ;
  }
}
