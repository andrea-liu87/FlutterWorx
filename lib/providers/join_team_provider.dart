import 'package:flutter/material.dart';

import '../data/model/join_team_model.dart';
import '../data/remote/remote_repository.dart';
import '../routes.dart';
import '../utility/common_function.dart';

class JoinTeamProvider with ChangeNotifier {
  final RemoteRepository _remoteRepository ;

  JoinTeamProvider(this._remoteRepository);

  void sendJoinRequest(BuildContext context, String name, String org) async {
    AppNavigator.push(Routes.joinTeamSubmit);
    var deviceData = await getDeviceInfo();
    var appVersion = await getAppVersion();
    JoinTeamModel form = JoinTeamModel(
      label: 'Andrea',
      port: 443,
      ip: 'api.dev.worx.id',
      organizationCode: 'WXWSR73',
      deviceCode: deviceData?['id'] ??= '',
      deviceModel: deviceData?['model'] ??= '',
      deviceOsVersion: deviceData?['os'] ??= '',
      deviceAppVersion: appVersion,
      deviceLanguage: Localizations.localeOf(context).languageCode,
    );
    final result = await _remoteRepository.postJoinTeam(form);
    result.fold(
      (messageError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(messageError)),
        );
        notifyListeners();
        return;
      },
      (response) {
        if (response.statusCode == 200) {
          AppNavigator.push(Routes.home);
        } else {
          AppNavigator.push(Routes.joinTeamRejected);
        }
        return;
      },
    );
  }
}