import 'package:flutter/material.dart';
import 'package:worx/routes.dart';
import 'package:worx/theme/worx_theme.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({
    super.key,
  });

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/horizontal.png"),
                  repeat: ImageRepeat.repeatX)),
        ),
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: WorxThemeData.lightColorScheme.primary,
          child: Image.asset("assets/images/worx_logo.png"),
        ),
      ],
    );
  }

  @override
  void initState() {
    Future.delayed(Duration(seconds: 5), (){
      AppNavigator.replaceWith(Routes.welcome);
    });
  }
}
