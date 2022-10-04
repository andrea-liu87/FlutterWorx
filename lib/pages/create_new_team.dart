import 'package:flutter/material.dart';
import 'package:worx/widgets/app_bar.dart';

class CreateNewTeam extends StatefulWidget {
  const CreateNewTeam({Key? key}) : super(key: key);

  @override
  State<CreateNewTeam> createState() => _CreateNewTeamState();
}

class _CreateNewTeamState extends State<CreateNewTeam> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WelcomeAppBar(title: 'Create New Team'),
      body: Container(
        color: Colors.white,
      ),
    );
  }
}
