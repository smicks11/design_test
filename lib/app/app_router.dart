import 'package:design_test/modules/bottom_nav/bottom_nav.dart';
import 'package:design_test/modules/home/detail.dart';
import 'package:design_test/modules/home/home.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String navRoute = "/bottomNav";
  static const String homeRoute = "/home";
  static const String detailsRoute = "/details";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.navRoute:
        return MaterialPageRoute(builder: (_) => const BottomNav());
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.detailsRoute:
        return MaterialPageRoute(builder: (_) => const DetailScreem());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (ctx) => const Scaffold(
              body: Center(
                child: Text("Uh oh 🥲, Route not found!"),
              ),
            ));
  }
}
