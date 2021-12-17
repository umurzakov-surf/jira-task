
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jira_task/ui/home_screen/home_screen.dart';
import 'package:jira_task/ui/second_screen/second_screen.dart';

class AppRouter {
  static const String home = '/';
  static const String second = '/second';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case '/second':
        return MaterialPageRoute(
          builder: (_) => const SecondScreen(),
        );
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}