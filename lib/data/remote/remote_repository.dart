import 'package:worx/data/remote/api_data_source.dart';

class RemoteRepository {
  final ApiDataSource _apiProvider;
  const RemoteRepository(this._apiProvider);

  Future<String> postCreateNewTeam(Map<String, String> form) async {
    return _apiProvider.createNewTeam(form);
  }

  // Future<ResponseFormList> fetchTemplateForms() {
  //   return _apiProvider.fetchTemplateForms();
  // }
}