import 'package:flutter/material.dart';
import 'package:worx/theme/worx_theme.dart';

class WelcomeAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;

  WelcomeAppBar({
    Key? key,
  required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(
        color: Colors.white, //change your color here
      ),
      backgroundColor: WorxThemeData.lightColorScheme.primary,
      centerTitle: true,
      title: Text(
        title,
        style: WorxThemeData.lightThemeData.textTheme.titleMedium?.copyWith(color: Colors.white),),
      actions: <Widget>[
        Center(
          child: Container(
            width: 20,
            height: 20,
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation(Colors.white),
              value: 0.5,
              backgroundColor: Colors.white30,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

