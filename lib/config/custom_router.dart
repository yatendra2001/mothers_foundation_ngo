import 'package:flutter/material.dart';
import 'package:mothers_foundation_ngo/screens/ItemsPage/items_page.dart';
import 'package:mothers_foundation_ngo/screens/dashboard/dashboard_screen.dart';
import 'package:mothers_foundation_ngo/screens/home/home_screen.dart';
import 'package:mothers_foundation_ngo/screens/login/onboarding/onboarding_pageview.dart';
import 'package:mothers_foundation_ngo/screens/login/pageview.dart';

import 'package:mothers_foundation_ngo/screens/screens.dart';

class CustomRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    print('Route: ${settings.name}');

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          settings: const RouteSettings(name: '/'),
          builder: (_) => const Scaffold(),
        );
      case SplashScreen.routeName:
        return SplashScreen.route();

      case Onboardingpageview.routeName:
        return Onboardingpageview.route();
      case LoginPageView.routeName:
        return LoginPageView.route();
      case HomeScreen.routeName:
        return HomeScreen.route();
      case DashboardScreen.routeName:
        return DashboardScreen.route();
      case ItemsPage.routeName:
        return ItemsPage.route();

      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: '/error'),
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Something went wrong!'),
        ),
      ),
    );
  }
}
