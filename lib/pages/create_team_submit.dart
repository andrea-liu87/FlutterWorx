import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:open_mail_app/open_mail_app.dart';
import 'package:worx/widgets/buttons.dart';

class CreateTeamSubmit extends StatefulWidget {
  const CreateTeamSubmit({Key? key}) : super(key: key);

  @override
  State<CreateTeamSubmit> createState() => _CreateTeamSubmitState();
}

class _CreateTeamSubmitState extends State<CreateTeamSubmit> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 64,),
            Image.asset("assets/images/worx_logo.png", color: Colors.black, scale: 1.2),
            Spacer(flex: 3,),
            Image.asset("assets/images/email_open.png"),
            SizedBox(height: 32,),
            Text('Check Your Email', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),),
            SizedBox(height: 16,),
            Text('Click the link in your email to'),
            SizedBox(height: 4,),
            Text('activate your account'),
            Padding(padding: EdgeInsets.fromLTRB(16, 28, 16, 28),
              child: FullWidthButton(
                  backgroundColor: Theme.of(context).primaryColor,
                  title: 'Open Email App',
                  onPressed: () async {
                    OpenEmail(context);
                  }
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Didn\'t receive the link? '),
                Text('Resend', style: TextStyle(color: Theme.of(context).primaryColor),),
              ],
            ),
            Spacer(flex: 7,),
          ],
        ),
      ),
    );
  }

  void _showToast(BuildContext context, String text) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(text),
        action: SnackBarAction(label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

  void OpenEmail(BuildContext context) async {
    var result = await OpenMailApp.openMailApp(
      nativePickerTitle: 'Select email app to open',
    );
    if (!result.didOpen && !result.canOpen) {
      _showToast(context, 'No Email App is found');
    } else if (!result.didOpen && result.canOpen) {
      showDialog(
          context: context,
          builder: (_)
      {
        return MailAppPickerDialog(
          mailApps: result.options,
        );
      });
    }
  }

}
