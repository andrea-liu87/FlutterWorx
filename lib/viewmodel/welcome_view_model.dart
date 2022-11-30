import 'package:flutter/material.dart';
import 'package:worx/data/remote/remote_repository.dart';

class WelcomeViewModel with ChangeNotifier {
  final RemoteRepository _remoteRepository;
  WelcomeViewModel(this._remoteRepository);

  Future<void> createNewTeam(Map<String, String> form) async {
    String responseCode = await _remoteRepository.postCreateNewTeam(form);
    notifyListeners();
  }
}