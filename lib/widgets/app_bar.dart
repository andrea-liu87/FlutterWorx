import 'package:flutter/material.dart';

class WelcomeAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final double progress;

  WelcomeAppBar({
    Key? key,
  required this.title,
  this.progress = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(
        color: Colors.white, //change your color here
      ),
      backgroundColor: Theme.of(context).primaryColor,
      centerTitle: true,
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white),),
      actions: <Widget>[
        Center(
          child: Container(
            width: 20,
            height: 20,
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation(Colors.white),
              value: progress,
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

