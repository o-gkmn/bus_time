import 'package:bus_time/bus_list/bus_list.dart';
import 'package:bus_time/home/home.dart';
import 'package:bus_time/splash/splash.dart';
import 'package:flutter/material.dart';

class PageRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case "/home":
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case "/busList":
        return MaterialPageRoute(builder: (_) => const BusListScreen());
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
