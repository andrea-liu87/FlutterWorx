import 'package:worx/data/api_data_source.dart';
import 'package:worx/data/model/ResponseFormList.dart';

class RemoteRepository {
  final ApiDataSource _apiProvider;
  RemoteRepository(this._apiProvider);

  Future<ResponseFormList> fetchTemplateForms() {
    return _apiProvider.fetchTemplateForms();
  }
}