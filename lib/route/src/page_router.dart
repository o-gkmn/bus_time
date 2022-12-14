import 'package:bus_time/bus_list/bus_list.dart';
import 'package:bus_time/bus_route/bus_route.dart';
import 'package:bus_time/home/home.dart';
import 'package:bus_time/search/search.dart';
import 'package:bus_time/splash/splash.dart';
import 'package:bus_time/station_list/station_list.dart';
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
      case "/stationList":
        return MaterialPageRoute(builder: (_) => const StationListScreen());
      case "/search":
        return MaterialPageRoute(builder: (_) => const SearchScreen());
      case "/busRoute":
        return MaterialPageRoute(builder: (_) => const BusRouteScreen());
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
