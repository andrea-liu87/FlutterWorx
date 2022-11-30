import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:worx/data/model/create_team_model.dart';
import 'package:worx/data/remote/api_data_source.dart';

class RemoteRepository {
  final ApiDataSource _apiProvider;
  const RemoteRepository(this._apiProvider);

  Future<Either<String, Response>> postCreateNewTeam(CreateTeamModel form) async {
    return _apiProvider.createNewTeam(form);
  }

  // Future<ResponseFormList> fetchTemplateForms() {
  //   return _apiProvider.fetchTemplateForms();
  // }
}