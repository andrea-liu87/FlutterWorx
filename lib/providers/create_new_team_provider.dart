import 'package:flutter/material.dart';
import 'package:worx/data/model/create_team_model.dart';
import 'package:worx/data/remote/remote_repository.dart';

class CreateNewTeamProvider with ChangeNotifier {
  final RemoteRepository _remoteRepository ;

  CreateNewTeamProvider(this._remoteRepository);

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void createNewTeam(BuildContext context, CreateTeamModel form, Function() nextAction) async {
    _isLoading = true;
    notifyListeners();
    final result = await _remoteRepository.postCreateNewTeam(form);

    result.fold((messageError) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(messageError)));
      _isLoading = false;
      notifyListeners();
      return;
    }, (response) {
      _isLoading = false;
      notifyListeners();
      nextAction();
      return;
    });
  }

}