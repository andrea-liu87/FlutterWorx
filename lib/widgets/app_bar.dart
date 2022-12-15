import 'package:flutter/material.dart';
import 'package:worx/routes.dart';

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
      leading: InkWell(
        onTap: (){AppNavigator.pop();},
        child: Icon(Icons.arrow_back, color: Theme.of(context).colorScheme.onPrimary,),
      ),
      iconTheme: const IconThemeData(
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

class HomeAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;

  HomeAppBar({
    Key? key,
    required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const Icon(Icons.access_alarm),
      iconTheme: const IconThemeData(
        color: Colors.white, //change your color here
      ),
      backgroundColor: Theme.of(context).primaryColor,
      titleSpacing: 0.0,
      title: Text(
        title,
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.white),
        overflow: TextOverflow.ellipsis,),
      actions: <Widget>[
        IconButton(padding: const EdgeInsets.all(0),onPressed: (){}, icon: Image.asset('assets/images/ic_search.png')),
        IconButton(onPressed: (){}, icon: Image.asset('assets/images/ic_settings.png'))
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

