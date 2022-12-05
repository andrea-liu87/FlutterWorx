import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:worx/providers/get_device_info_provider.dart';

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
    return Scaffold(
        body: Stack(
          children: [
            GridPaper(
              color: Colors.white.withOpacity(0.15),
              interval: 65,
              divisions: 1,
              subdivisions: 1,
              child: Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height,
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                color: Theme
                    .of(context)
                    .primaryColor,
                child: Image.asset("assets/images/worx_logo.png"),
              ),
            ),
          ],
        ),
    );
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<GetDeviceInfoProvider>().getDeviceInfo(context);
    });
  }
}
