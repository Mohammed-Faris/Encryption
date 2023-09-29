import 'package:flutter/material.dart';
import 'package:storagesecure/constants.dart';
import 'package:storagesecure/screens/dataPage.dart';
import 'package:storagesecure/screens/expandablelist.dart';
import 'package:storagesecure/screens/homePage.dart';
import 'package:storagesecure/screens/ytbplayer.dart';

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
      case videoPage:
        return MaterialPageRoute(builder: (context) => const YtbPlayer());
      case Expandpage:
        return MaterialPageRoute(
            builder: (context) => const Expandablelist(
                  title: 'Expandable list',
                ));
    }
    return MaterialPageRoute(
        builder: (context) => const Scaffold(
              body: Center(
                child: Text('No routes match'),
              ),
            ));
  }
}
