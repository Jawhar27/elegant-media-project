import 'package:elegant_media_project/models/hotel.dart';
import 'package:elegant_media_project/screens/authentication/sign_in_screen.dart';
import 'package:elegant_media_project/screens/home_screen.dart';
import 'package:elegant_media_project/screens/hotels/hotel_detail_screen.dart';
import 'package:elegant_media_project/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class ScreenRoutes {
  static const String toSplashScreen = "toSplashScreen";
  static const String toHomeScreen = "toHomeScreen";
  static const String toSignInScreen = "toSignInScreen";
  static const String toHotelDetailScreen = "toHotelDetailScreen";
  static const String toHotelMapScreen = "toHotelMapScreen";
}

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    Map data = (settings.arguments ?? {}) as Map;
    switch (settings.name) {
      case ScreenRoutes.toSplashScreen:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
          settings: settings,
        );

      case ScreenRoutes.toSignInScreen:
        return MaterialPageRoute(
          builder: (_) => const SignInScreen(),
          settings: settings,
        );

      case ScreenRoutes.toHomeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
          settings: settings,
        );

      case ScreenRoutes.toHotelDetailScreen:
        var data = settings.arguments as Map;
        Hotel hotel = data["hotel"];
        return MaterialPageRoute(
          builder: (_) => HotelDetailScreen(
            hotel: hotel,
          ),
          settings: settings,
        );

      default:
        return MaterialPageRoute(
          builder: (_) => SplashScreen(),
          settings: settings,
        );
    }
  }
}
