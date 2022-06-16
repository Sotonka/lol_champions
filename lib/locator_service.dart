import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:http/http.dart' as http;
import 'package:lol_champions/core/platform/network_info.dart';
import 'package:lol_champions/feature/data/datasources/remote_data_source.dart';
import 'package:lol_champions/feature/data/repositories/champion_repository_impl.dart';
import 'package:lol_champions/feature/domain/repositories/champion_repository.dart';
import 'package:lol_champions/feature/domain/usecases/get_all_champions.dart';
import 'package:lol_champions/feature/presentation/bloc/champions_list_cubit/champions_list_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Cubit
  sl.registerFactory(() => ChampionCubit(getChampions: sl()));

  // UseCases
  sl.registerLazySingleton(() => GetAllChampions(sl()));

  // Repository
  sl.registerLazySingleton<ChampionRepository>(
      () => ChampionRepositoryImpl(remoteDataSource: sl(), networkInfo: sl()));

  sl.registerLazySingleton<ChampionRemoteDataSource>(
      () => ChampionRemoteDataSourceImpl(client: http.Client()));

  // Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client);
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
