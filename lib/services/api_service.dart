// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:elegant_media_project/parameters.dart';
import 'package:elegant_media_project/routes.dart';
import 'package:elegant_media_project/services/access_to_app_provider.dart';
import 'package:elegant_media_project/utils/helper_util.dart';
import 'package:elegant_media_project/utils/navigation_util.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:http/http.dart' as http;

Future<dynamic> makeApiRequest(String endpoint,
    {required Function(String? title, String? message, Map data) success,
    required Function(String title, String message, Map data) failed,
    VoidCallback? complete}) async {
  Uri newEndpoint = Uri.parse(endpoint);
  Map<String, String> headers = {
    "Content-Type": "application/json",
  };
  final response = await http.get(newEndpoint, headers: headers);
  try {
    final responseJson = json.decode(response.body);
    success.call("Success", "", responseJson);
  } catch (e) {
    failed.call("Failed", "", {});
    return;
  } finally {
    complete?.call();
  }
}

void signInWithFacebook(BuildContext context) async {
  try {
    final LoginResult result = await FacebookAuth.instance
        .login(permissions: (['email', 'public_profile', 'user_friends']));
    final token = result.accessToken?.token;
    printLogs(
        'Facebook token userID : ${result.accessToken!.grantedPermissions}');
    final graphResponse = await http.get(Uri.parse('https://graph.facebook.com/'
        'v2.12/me?fields=name,first_name,last_name,email&access_token=$token'));

    final profile = jsonDecode(graphResponse.body);
    getAppState(context).user = profile['name'];
    getAppState(context).email = profile['email'];
    printLogs("Profile is equal to $profile");
    try {
      final AuthCredential facebookCredential =
          FacebookAuthProvider.credential(result.accessToken!.token);
      final userCredential =
          await FirebaseAuth.instance.signInWithCredential(facebookCredential);
      printLogs(userCredential);
      moveToScreen(context, ScreenRoutes.toHomeScreen);
    } catch (e) {
      final snackBar = SnackBar(
        margin: const EdgeInsets.all(20),
        behavior: SnackBarBehavior.floating,
        content: Text(e.toString()),
        backgroundColor: (Colors.redAccent),
        action: SnackBarAction(
          label: 'dismiss',
          onPressed: () {},
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  } catch (e) {
    printLogs("error occurred");
    printLogs(e.toString());
  }
}
