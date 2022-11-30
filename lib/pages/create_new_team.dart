import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:worx/data/model/create_team_model.dart';
import 'package:worx/providers/create_new_team_provider.dart';
import 'package:worx/routes.dart';
import 'package:worx/theme/worx_theme.dart';
import 'package:worx/widgets/app_bar.dart';
import 'package:worx/widgets/buttons.dart';
import 'package:worx/widgets/text_field.dart';

class CreateNewTeam extends StatefulWidget {
  const CreateNewTeam({Key? key}) : super(key: key);

  @override
  State<CreateNewTeam> createState() => _CreateNewTeamState();
}

class _CreateNewTeamState extends State<CreateNewTeam> {
  Widget divider = Container(height: 2,
    color: WorxThemeData.dividerColor,
    margin: EdgeInsets.symmetric(vertical: 12),);
  double progressName = 0;
  double progressEmail = 0;
  double progressPassword = 0;
  double progressPhone = 0;
  double progressOrg = 0;

  CreateTeamModel form = CreateTeamModel();

  @override
  Widget build(BuildContext context) {
    CreateNewTeamProvider provider = context.read<CreateNewTeamProvider>();

    return Scaffold(
      appBar: WelcomeAppBar(
          title: 'Create New Team',
          progress: progressName + progressEmail + progressPassword +
              progressPhone + progressOrg),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              FormTextField(
                title: 'Full Name',
                keyboardType: TextInputType.name,
                onSave: (String? value) {
                  setState(() {
                    progressName = setProgressMember(value);
                  });
                  form.fullname = value;
                },
              ),
              divider,
              FormTextField(
                title: 'Email',
                keyboardType: TextInputType.emailAddress,
                onSave: (String? value) {
                  setState(() {
                    progressEmail = setProgressMember(value);
                  });
                  form.email = value;
                },),
              divider,
              FormTextField(title: 'Password', isPasswordField: true,
                onSave: (String? value) {
                  setState(() {
                    progressPassword = setProgressMember(value);
                  });
                  form.password = value;
                },),
              divider,
              FormTextField(
                title: 'Work Phone', keyboardType: TextInputType.phone,
                onSave: (String? value) {
                  setState(() {
                    progressPhone = setProgressMember(value);
                  });
                  form.phoneNo = value;
                },),
              divider,
              FormTextField(
                title: 'Organization Name', onSave: (String? value) {
                setState(() {
                  progressOrg = setProgressMember(value);
                });
                form.organizationName = value;
              },),
              divider,
              Padding(padding: EdgeInsets.fromLTRB(16, 72, 16, 16),
                child: FullWidthButton(
                    backgroundColor: Theme.of(context).primaryColor,
                    title: 'Create New Team',
                    onPressed: () async {
                      provider.createNewTeam(context, form, (){AppNavigator.push(Routes.createTeamSubmit);});
                    }
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  double setProgressMember(String? newValue) {
    if (newValue != null && newValue.isNotEmpty) {
      return 0.2;
    } else {
      return 0;
    }
  }
}
