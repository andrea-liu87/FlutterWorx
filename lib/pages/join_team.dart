import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../providers/join_team_provider.dart';
import '../widgets/app_bar.dart';
import '../widgets/buttons.dart';
import '../widgets/text_field.dart';

class JoinTeam extends StatefulWidget {
  const JoinTeam({Key? key}) : super(key: key);

  @override
  State<JoinTeam> createState() => _JoinTeamState();
}

class _JoinTeamState extends State<JoinTeam> {
  double progressName = 0;
  double progressOrg = 0;

  String name = '';
  String organization = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WelcomeAppBar(
          title: 'Join An Existing Team',
          progress: progressName + progressOrg),
      backgroundColor: Colors.white,
      body: ConstrainedBox(
            constraints: const BoxConstraints.expand(),
              child: ListView(
                shrinkWrap: true,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 40, 16, 0),
                    child: Text('Ready to join', style: Theme
                        .of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontWeight: FontWeight.w500),),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                    child: Text('Admin will approve your device'),
                  ),
                  FormTextField(
                    title: 'Name',
                    keyboardType: TextInputType.name,
                    onSave: (String? value) {
                      setState(() {
                        progressName = setProgressMember(value);
                      });
                      name = value ??= '';
                    },
                  ),
                  divider,
                  FormTextField(
                    title: 'Organization Code', onSave: (String? value) {
                    setState(() {
                      progressOrg = setProgressMember(value);
                    });
                    organization = value!;
                  },),
                  divider,
                  Padding(padding: const EdgeInsets.fromLTRB(16, 72, 16, 16),
                    child: FullWidthButton(
                        backgroundColor: Theme
                            .of(context)
                            .primaryColor,
                        title: 'Send Request',
                        onPressed: () async {
                          context.read<JoinTeamProvider>().sendJoinRequest(
                              context, name, organization);
                        }),
                  ),
                ],
              ),
            ),
        );
  }

  double setProgressMember(String? newValue) {
    if (newValue != null && newValue.isNotEmpty) {
      return 0.5;
    } else {
      return 0;
    }
  }
}
