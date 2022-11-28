import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:worx/data/remote/api_data_source.dart';
import 'package:worx/data/remote/remote_repository.dart';
import 'package:worx/providers/create_new_team_provider.dart';

final injector = GetIt.instance;

void setup() {
  // Register Provider
  injector.registerFactory<CreateNewTeamProvider>(
        () => CreateNewTeamProvider(injector()),
  );

  // Register Repository
  injector.registerLazySingleton<RemoteRepository>(() => RemoteRepository(injector()));

  // Register ApiDataSource
  injector.registerLazySingleton<ApiDataSource>(() => ApiDataSource(injector()));

  // Register Http Client (DIO)
  injector.registerLazySingleton<Dio>(() => Dio());
}
