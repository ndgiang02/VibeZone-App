import 'package:get_it/get_it.dart';
import 'package:vibezone/core/storage/local_storage.dart';
import 'package:vibezone/core/storage/session_controller.dart';

import 'core/state/cubit/app_cubit.dart';
import 'features/auth/data/datasources/auth_remote_data_source.dart';
import 'features/auth/data/repositories/auth_repository_impl.dart';
import 'features/auth/domain/repositories/auth_repository.dart';
import 'features/auth/domain/usecases/forgot_password_usecase.dart';
import 'features/auth/domain/usecases/get_remembered_email_usecase.dart';
import 'features/auth/domain/usecases/login_usecase.dart';
import 'features/auth/domain/usecases/logout_usecase.dart';
import 'features/auth/domain/usecases/register_usecase.dart';
import 'features/auth/presentation/forgot_password/bloc/forgot_password_bloc.dart';
import 'features/auth/presentation/login/bloc/login_bloc.dart';
import 'features/auth/presentation/signup/bloc/signup_bloc.dart';
import 'features/home/data/datasources/home_remote_data_source.dart';
import 'features/home/data/repositories/home_repository_impl.dart';
import 'features/home/domain/repositories/home_repository.dart';
import 'features/home/domain/usecases/get_home_data_usecase.dart';
import 'features/home/presentation/bloc/home_bloc.dart';
import 'features/main/presentation/bloc/main_bloc.dart';
import 'features/miniplayer/presentation/cubit/miniplayer_cubit.dart';
import 'features/player/presentation/bloc/play_bloc.dart';
import 'features/profile/presentation/bloc/profile_bloc.dart';
import 'features/search/data/datasources/search_local_data_source.dart';
import 'features/search/data/datasources/search_remote_data_source.dart';
import 'features/search/data/repositories/search_repository_impl.dart';
import 'features/search/domain/repositories/search_repository.dart';
import 'features/search/domain/usecases/get_genres_usecase.dart';
import 'features/search/domain/usecases/recent_search_usecases.dart';
import 'features/search/domain/usecases/search_songs_usecase.dart';
import 'features/search/presentation/bloc/search_bloc.dart';
import 'features/splash/presentation/bloc/splash_bloc.dart';
import 'features/trending/data/datasources/trending_remote_data_source.dart';
import 'features/trending/data/repositories/trending_repository_impl.dart';
import 'features/trending/domain/repositories/trending_repository.dart';
import 'features/trending/domain/usecases/get_trending_songs_usecase.dart';
import 'features/trending/presentation/bloc/trending_bloc.dart';

final getIt = GetIt.instance;

Future<void> setupLocator() async {
  // Core
  getIt.registerSingleton(AppCubit());

  getIt.registerSingletonAsync(() async {
    final preferences = SessionController();
    await preferences.getSavedLocale();
    await preferences.getUserFromPreference();
    return preferences;
  });

  getIt.registerLazySingleton(() => LocalStorage());

  // Auth
  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceMock(),
  );
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(remote: getIt(), session: getIt()),
  );
  getIt.registerLazySingleton(() => LoginUseCase(getIt()));
  getIt.registerLazySingleton(() => LogoutUseCase(getIt()));
  getIt.registerLazySingleton(() => GetRememberedEmailUseCase(getIt()));
  getIt.registerLazySingleton(() => RegisterUseCase(getIt()));
  getIt.registerLazySingleton(() => ForgotPasswordUseCase(getIt()));

  // Home
  getIt.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceMock(),
  );
  getIt.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(getIt()),
  );
  getIt.registerLazySingleton(() => GetHomeDataUseCase(getIt()));

  // Trending
  getIt.registerLazySingleton<TrendingRemoteDataSource>(
    () => TrendingRemoteDataSourceMock(),
  );
  getIt.registerLazySingleton<TrendingRepository>(
    () => TrendingRepositoryImpl(getIt()),
  );
  getIt.registerLazySingleton(() => GetTrendingSongsUseCase(getIt()));

  // Search
  getIt.registerLazySingleton<SearchRemoteDataSource>(
    () => SearchRemoteDataSourceMock(),
  );
  getIt.registerLazySingleton<SearchLocalDataSource>(
    () => SearchLocalDataSourceImpl(getIt()),
  );
  getIt.registerLazySingleton<SearchRepository>(
    () => SearchRepositoryImpl(remote: getIt(), local: getIt()),
  );
  getIt.registerLazySingleton(() => SearchSongsUseCase(getIt()));
  getIt.registerLazySingleton(() => GetGenresUseCase(getIt()));
  getIt.registerLazySingleton(() => GetRecentSearchesUseCase(getIt()));
  getIt.registerLazySingleton(() => SaveRecentSearchUseCase(getIt()));
  getIt.registerLazySingleton(() => RemoveRecentSearchUseCase(getIt()));
  getIt.registerLazySingleton(() => ClearRecentSearchesUseCase(getIt()));

  // Blocs
  getIt.registerFactory(() => SplashBloc());

  getIt.registerFactory(() => LoginBloc(getIt(), getIt()));

  getIt.registerFactory(() => SignupBloc(getIt()));

  getIt.registerFactory(() => ForgotPasswordBloc(getIt()));

  getIt.registerLazySingleton(() => MainBloc());

  getIt.registerLazySingleton(() => PlayBloc());

  getIt.registerLazySingleton(() => MiniPlayerCubit());

  getIt.registerFactory(() => HomeBloc(getIt()));

  getIt.registerFactory(() => TrendingBloc(getIt()));

  getIt.registerFactory(
    () => SearchBloc(getIt(), getIt(), getIt(), getIt(), getIt(), getIt()),
  );

  getIt.registerFactory(() => ProfileBloc(getIt()));

  await getIt.allReady();
}
