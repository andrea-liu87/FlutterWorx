import 'package:flutter/material.dart';
import 'package:worx/data/remote/remote_repository.dart';

class CreateNewTeamProvider with ChangeNotifier {
  final RemoteRepository _remoteRepository ;

  CreateNewTeamProvider(this._remoteRepository);

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void createNewTeam(BuildContext context, Map<String, String> form) async {
    _isLoading = true;
    notifyListeners();
    final result = await _remoteRepository.postCreateNewTeam(form);

    if (result == "error"){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(result.toString())));
    }

    _isLoading = false;
    notifyListeners();
  }

}