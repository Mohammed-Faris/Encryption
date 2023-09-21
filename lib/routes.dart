import 'package:flutter/material.dart';
import 'package:storagesecure/constants.dart';
import 'package:storagesecure/screens/dataPage.dart';
import 'package:storagesecure/screens/homePage.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homePage:
        return MaterialPageRoute(
            builder: (context) => const HomePage(
                  title: 'Flutter Secure Storage',
                ));
      case dataPage:
        return MaterialPageRoute(builder: (context) => const DataPage());
    }
    return MaterialPageRoute(
        builder: (context) => const Scaffold(
              body: Center(
                child: Text('No routes match'),
              ),
            ));
  }
}
