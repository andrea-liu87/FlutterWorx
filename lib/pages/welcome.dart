import 'package:flutter/material.dart';
import 'package:worx/routes.dart';
import 'package:worx/widgets/buttons.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 48),
            height: MediaQuery.of(context).size.height * 0.4,
            color: Theme.of(context).primaryColor,
            child: Column(
              children: [
                  Spacer(flex: 4,),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Image.asset('assets/images/diamond.png'),),
                  Spacer(flex: 1,),
                  Image.asset('assets/images/worx_logo.png'),
                  Spacer(flex: 1),
                Align(
                    alignment: Alignment.bottomLeft,
                    child: Transform.scale(
                      scaleX: -1,
                      child: Image.asset('assets/images/diamond.png'),
                    )),
                Spacer(flex: 2),
                  Text('Hi, Welcome!', style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white),),
                  Spacer(flex: 2),
                  Text('Enjoy All The Features Of The App Easily & Interactively',
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white),),
                  Spacer(flex: 4),
                ],
              ),
            ),
          Container(
            height: MediaQuery.of(context).size.height * 0.6,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(16, 60, 16, 20),
                  child: FullWidthButton(
                    backgroundColor: Theme.of(context).primaryColor,
                    title: 'Create New Team',
                    onPressed: () {
                      AppNavigator.push(Routes.createTeam);
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  child: FullWidthButton(
                    backgroundColor: Theme.of(context).primaryColor.withAlpha(10),
                    onPressed: () {},
                    title: 'Join An Existing Team',
                    fontColor: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
