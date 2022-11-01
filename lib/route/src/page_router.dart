import 'package:bus_time/home/view/home_screen.dart';
import 'package:bus_time/splash/splash.dart';
import 'package:flutter/material.dart';

class PageRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case "/home":
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text(
                        "${settings.name} ile ilgili herhangi bir sayfa bulunamadı"),
                  ),
                ));
    }
  }
}
