import 'package:flutter/material.dart';
import 'package:worx/core/fade_page_route.dart';
import 'package:worx/pages/create_new_team.dart';
import 'package:worx/pages/create_team_submit.dart';
import 'package:worx/pages/home_page.dart';
import 'package:worx/pages/join_request_submitted.dart';
import 'package:worx/pages/join_team.dart';
import 'package:worx/pages/splash.dart';
import 'package:worx/pages/welcome.dart';

enum Routes { splash, welcome,
  createTeam, createTeamSubmit,
  joinTeam, joinTeamSubmit, joinTeamRejected,
  home}

class _Paths {
  static const String splash = '/';
  static const String welcome = '/welcome';
  static const String createTeam = '/welcome/createTeam';
  static const String createTeamSubmit = '/welcome/createTeam/createTeamSubmit';
  static const String joinTeam = '/welcome/joinTeam';
  static const String joinTeamSubmit = 'welcome/joinTeam/joinTeamSubmit';
  static const String joinTeamRejected = 'welcome/joinTeam/joinTeamRejected';
  static const String home = '/home';


  static const Map<Routes, String> _pathMap = {
    Routes.splash: _Paths.splash,
    Routes.welcome: _Paths.welcome,
    Routes.createTeam: _Paths.createTeam,
    Routes.createTeamSubmit: _Paths.createTeamSubmit,
    Routes.joinTeam: _Paths.joinTeam,
    Routes.joinTeamSubmit: _Paths.joinTeamSubmit,
    Routes.joinTeamRejected: _Paths.joinTeamRejected,
    Routes.home: _Paths.home
  };

  static String of(Routes route) => _pathMap[route] ?? splash;
}

class AppNavigator {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case _Paths.splash:
        return FadeRoute(page: const SplashPage());

      case _Paths.welcome:
        return FadeRoute(page: const WelcomePage());

      case _Paths.createTeam:
        return FadeRoute(page: const CreateNewTeam());

      case _Paths.createTeamSubmit:
        return FadeRoute(page: const CreateTeamSubmit());

        case _Paths.joinTeam:
      return FadeRoute(page: const JoinTeam());

      case _Paths.joinTeamSubmit:
        return FadeRoute(page: const JoinRequestSubmit(isSuccess: true));

      case _Paths.joinTeamRejected:
        return FadeRoute(page: const JoinRequestSubmit(isSuccess: false));

      case _Paths.home:
        return FadeRoute(page: const HomePage());

      default:
        return FadeRoute(page: const SplashPage());
    }
  }

  static Future? push<T>(Routes route, [T? arguments]) =>
      state?.pushNamed(_Paths.of(route), arguments: arguments);

  static Future? replaceWith<T>(Routes route, [T? arguments]) =>
      state?.pushReplacementNamed(_Paths.of(route), arguments: arguments);

  static void pop() => state?.pop();

  static NavigatorState? get state => navigatorKey.currentState;
}