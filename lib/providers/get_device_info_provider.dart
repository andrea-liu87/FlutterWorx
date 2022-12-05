import 'package:flutter/material.dart';
import 'package:worx/data/remote/remote_repository.dart';
import 'package:worx/routes.dart';

class GetDeviceInfoProvider with ChangeNotifier {
  final RemoteRepository _remoteRepository ;

  GetDeviceInfoProvider(this._remoteRepository);

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void getDeviceInfo(BuildContext context) async {
    _isLoading = true;
    notifyListeners();
    final result = await _remoteRepository.getDeviceInfo();

    result.fold((messageError) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(messageError)));
      _isLoading = false;
      notifyListeners();
      return;
    }, (response) {
      _isLoading = false;
      notifyListeners();
      if (response.statusCode == 200) {
        AppNavigator.replaceWith(Routes.home);
      } else {
        AppNavigator.replaceWith(Routes.welcome);
      }
      return;
    });
  }

}