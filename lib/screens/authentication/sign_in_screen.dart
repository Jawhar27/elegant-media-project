import 'package:elegant_media_project/routes.dart';
import 'package:elegant_media_project/services/api_service.dart';
import 'package:elegant_media_project/styles/assets.dart';
import 'package:elegant_media_project/styles/theme.dart';
import 'package:elegant_media_project/utils/navigation_util.dart';
import 'package:elegant_media_project/utils/screen_util.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}




class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Elegant Media Project",
              style: TextStyle(
                  color: AppColors.black,
                  fontSize: 27,
                  fontWeight: FontWeight.bold),
            ),
            Image(
              // fit: BoxFit.fill,
              height: getScreenHeight(context) * 0.4,
              width: getScreenWidth(context),
              image: const AssetImage(fbLogo),
            ),
            TextButton(
                onPressed: () async {
                   signInWithFacebook(context);
                  // moveToScreen(context, ScreenRoutes.toHomeScreen);
                },
                child: const Text(
                  "Let's Login With Facebook !",
                  style: TextStyle(fontSize: 20),
                ))
          ],
        ),
      ),
    );
  }
}
