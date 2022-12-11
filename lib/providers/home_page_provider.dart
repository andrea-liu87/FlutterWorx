import 'package:flutter/material.dart';
import 'package:worx/data/model/empty_form.dart';

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

  List<EmptyForm> _emptyForms = [];
  List<EmptyForm> get emptyForms => _emptyForms;

  void getTemplateForms(BuildContext context) async {
    _isLoading = true;
    notifyListeners();
    final result = await _remoteRepository.fetchTemplateForms();

    if (result.success){
      _emptyForms = result.list;
      _isLoading = false;
      notifyListeners();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error ${result.error}')));
      _isLoading = false;
      notifyListeners();
    }
  }
}