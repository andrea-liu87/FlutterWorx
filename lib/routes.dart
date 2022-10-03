import 'package:flutter/material.dart';
import 'package:worx/core/fade_page_route.dart';
import 'package:worx/pages/create_new_team.dart';
import 'package:worx/pages/splash.dart';
import 'package:worx/pages/welcome.dart';

enum Routes { splash, welcome, createTeam, home}

class _Paths {
  static const String splash = '/';
  static const String welcome = '/welcome';
  static const String createTeam = '/welcome/createTeam';
  static const String home = '/home';


  static const Map<Routes, String> _pathMap = {
    Routes.splash: _Paths.splash,
    Routes.welcome: _Paths.welcome,
    Routes.createTeam: _Paths.createTeam,
    Routes.home: _Paths.home
  };

  static String of(Routes route) => _pathMap[route] ?? splash;
}

class AppNavigator {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case _Paths.splash:
        return FadeRoute(page: SplashPage());

      case _Paths.welcome:
        return FadeRoute(page: WelcomePage());

      case _Paths.createTeam:
        return FadeRoute(page: CreateNewTeam());

      case _Paths.home:
      default:
        return FadeRoute(page: SplashPage());
    }
  }

  static Future? push<T>(Routes route, [T? arguments]) =>
      state?.pushNamed(_Paths.of(route), arguments: arguments);

  static Future? replaceWith<T>(Routes route, [T? arguments]) =>
      state?.pushReplacementNamed(_Paths.of(route), arguments: arguments);

  static void pop() => state?.pop();

  static NavigatorState? get state => navigatorKey.currentState;
}