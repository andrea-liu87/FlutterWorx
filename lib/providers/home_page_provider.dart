import 'package:flutter/material.dart';

import '../data/remote/remote_repository.dart';

class HomePageProvider with ChangeNotifier {
  final RemoteRepository _remoteRepository ;

  HomePageProvider(this._remoteRepository);

  int _currentPage = 0;
  int get currentPage => _currentPage;
  set currentPage(int index) {
    _currentPage = index;
    notifyListeners();
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;

}