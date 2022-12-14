import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:worx/data/remote/remote_repository.dart';
import 'package:worx/injector.dart';
import 'package:worx/providers/create_new_team_provider.dart';
import 'package:worx/providers/detail_form_provider.dart';
import 'package:worx/providers/get_device_info_provider.dart';
import 'package:worx/providers/home_page_provider.dart';
import 'package:worx/providers/join_team_provider.dart';
import 'package:worx/routes.dart';
import 'package:worx/theme/worx_theme.dart';

void main() {
  setup();
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
          return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => GetDeviceInfoProvider(injector<RemoteRepository>()),),
            ChangeNotifierProvider(create: (_) => CreateNewTeamProvider(injector<RemoteRepository>()),),
            ChangeNotifierProvider(create: (_) => JoinTeamProvider(injector<RemoteRepository>()),),
            ChangeNotifierProvider(create: (_) => HomePageProvider(injector<RemoteRepository>()),),
            ChangeNotifierProvider(create: (_) => DetailFormProvider(injector<RemoteRepository>()),),
          ],
          child: MaterialApp(
            title: 'Worx',
            theme: WorxThemeData.defaultThemeData,
            debugShowCheckedModeBanner: false,
            navigatorKey: AppNavigator.navigatorKey,
            onGenerateRoute: AppNavigator.onGenerateRoute,
          ),
        );
      },
    );
  }
}