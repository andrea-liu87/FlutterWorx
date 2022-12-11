import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:worx/data/model/create_team_model.dart';
import 'package:worx/data/remote/api_data_source.dart';

import '../model/join_team_model.dart';
import '../model/response_form_list.dart';

class RemoteRepository {
  final ApiDataSource _apiProvider;
  const RemoteRepository(this._apiProvider);

  Future<Either<String, Response>> getDeviceInfo() async {
    return _apiProvider.getDeviceStatus();
  }

  Future<Either<String, Response>> postCreateNewTeam(CreateTeamModel form) async {
    return _apiProvider.createNewTeam(form);
  }

  Future<Either<String, Response>> postJoinTeam(JoinTeamModel form) async {
    return _apiProvider.joinTeam(form);
  }

  Future<ResponseFormList> fetchTemplateForms() {
    return _apiProvider.fetchTemplateForms();
  }
}