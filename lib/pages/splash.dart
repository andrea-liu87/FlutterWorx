import 'package:connectivity_plus/connectivity_plus.dart';
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
  void initState()  {
    super.initState();
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _loadData(context);
      });
  }

  void _loadData(BuildContext context) async{
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      if (!mounted) return;
      context.read<GetDeviceInfoProvider>().getDeviceInfo(context);
    } else {
      if (!mounted) return;
        context.read<GetDeviceInfoProvider>().offlineChecking(context);
    }
  }
}
