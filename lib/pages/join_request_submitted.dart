import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:worx/routes.dart';

import '../widgets/buttons.dart';

class JoinRequestSubmit extends StatelessWidget {
  final bool isSuccess;

  const JoinRequestSubmit({Key? key, required this.isSuccess}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String text  = 'Waiting For Verification';
    String icon = 'assets/images/waiting_verification_icon.png';
    String buttonText = 'Back To Join Request';

    if (!isSuccess){
    text = 'Your verification was rejected';
    icon = 'assets/images/verification_rejected_icon.png';
    buttonText = 'Make New Request';
}

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 77,),
            Image.asset("assets/images/worx_logo.png", color: Colors.black, height: 26,),
            const Spacer(flex: 3,),
            Image.asset(icon),
            const SizedBox(height: 25,),
            Text(text),
            Padding(padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
              child: FullWidthButton(
                  backgroundColor: Theme.of(context).primaryColor,
                  title: buttonText,
                  onPressed: () async {
                    AppNavigator.pop();
                  }
              ),
            ),
            const Spacer(flex: 7,),
          ],
        ),
      ),
    );
  }

}