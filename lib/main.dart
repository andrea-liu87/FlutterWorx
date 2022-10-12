import 'package:flutter/material.dart';
import 'package:worx/routes.dart';
import 'package:worx/theme/worx_theme.dart';

void main() {
  runApp(const WorxApp());
}

class WorxApp extends StatelessWidget {
  const WorxApp({
    super.key,
    this.initialRoute,
    this.isTestMode = false,
  });

  final String? initialRoute;
  final bool isTestMode;

  @override
  Widget build(BuildContext context) {
    return Builder(
        builder: (context) {
          return MaterialApp(
            title: 'Worx',
            theme: WorxThemeData.defaultThemeData,
            debugShowCheckedModeBanner: false,
            navigatorKey: AppNavigator.navigatorKey,
            onGenerateRoute: AppNavigator.onGenerateRoute,
          );
        },
    );
  }
}