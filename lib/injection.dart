import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:vibezone/core/network/api_client.dart';
import 'package:vibezone/core/network/token_storage.dart';
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
import 'features/player/data/datasources/player_remote_data_source.dart';
import 'features/player/presentation/bloc/play_bloc.dart';
import 'features/playlist/data/datasources/playlist_remote_data_source.dart';
import 'features/playlist/data/repositories/playlist_repository_impl.dart';
import 'features/playlist/domain/repositories/playlist_repository.dart';
import 'features/playlist/domain/usecases/playlist_usecases.dart';
import 'features/playlist/presentation/cubit/add_to_playlist_cubit.dart';
import 'features/profile/data/datasources/account_remote_data_source.dart';
import 'features/profile/data/repositories/account_repository_impl.dart';
import 'features/profile/domain/repositories/account_repository.dart';
import 'features/profile/domain/usecases/account_usecases.dart';
import 'features/profile/presentation/bloc/profile_bloc.dart';
import 'features/profile/presentation/security/cubit/security_cubit.dart';
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
import 'features/upload/data/datasources/upload_remote_data_source.dart';
import 'features/upload/data/repositories/upload_repository_impl.dart';
import 'features/upload/domain/repositories/upload_repository.dart';
import 'features/upload/domain/usecases/upload_usecases.dart';
import 'features/upload/presentation/bloc/upload_bloc.dart';
import 'main.dart';

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

  // Network
  getIt.registerLazySingleton(() => TokenStorage(getIt()));
  getIt.registerLazySingleton(
    () =>
        ApiClient.create(tokens: getIt(), onSessionExpired: _onSessionExpired),
  );

  // Auth
  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(client: getIt(), tokens: getIt()),
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
    () => HomeRemoteDataSourceImpl(getIt()),
  );
  getIt.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(getIt()),
  );
  getIt.registerLazySingleton(() => GetHomeDataUseCase(getIt()));

  // Trending
  getIt.registerLazySingleton<TrendingRemoteDataSource>(
    () => TrendingRemoteDataSourceImpl(getIt()),
  );
  getIt.registerLazySingleton<TrendingRepository>(
    () => TrendingRepositoryImpl(getIt()),
  );
  getIt.registerLazySingleton(() => GetTrendingSongsUseCase(getIt()));

  // Search
  getIt.registerLazySingleton<SearchRemoteDataSource>(
    () => SearchRemoteDataSourceImpl(getIt()),
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

  // Player
  getIt.registerLazySingleton<PlayerRemoteDataSource>(
    () => PlayerRemoteDataSourceImpl(getIt()),
  );

  // Account
  getIt.registerLazySingleton<AccountRemoteDataSource>(
    () => AccountRemoteDataSourceImpl(getIt()),
  );
  getIt.registerLazySingleton<AccountRepository>(
    () => AccountRepositoryImpl(remote: getIt(), session: getIt()),
  );
  getIt.registerLazySingleton(() => RefreshMeUseCase(getIt()));
  getIt.registerLazySingleton(() => UpdateProfileUseCase(getIt()));
  getIt.registerLazySingleton(() => ChangePasswordUseCase(getIt()));
  getIt.registerLazySingleton(() => SetAvatarUseCase(getIt()));
  getIt.registerLazySingleton(() => RemoveAvatarUseCase(getIt()));
  getIt.registerLazySingleton(() => GetSessionsUseCase(getIt()));
  getIt.registerLazySingleton(() => RevokeSessionUseCase(getIt()));
  getIt.registerLazySingleton(() => RevokeOtherSessionsUseCase(getIt()));

  // Upload
  getIt.registerLazySingleton<UploadRemoteDataSource>(
    () => UploadRemoteDataSourceImpl(getIt()),
  );
  getIt.registerLazySingleton<UploadRepository>(
    () => UploadRepositoryImpl(getIt()),
  );
  getIt.registerLazySingleton(() => GetUploadGenresUseCase(getIt()));
  getIt.registerLazySingleton(() => GetMyArtistUseCase(getIt()));
  getIt.registerLazySingleton(() => BecomeArtistUseCase(getIt()));
  getIt.registerLazySingleton(() => UploadTrackUseCase(getIt()));
  getIt.registerLazySingleton(() => GetUploadStatusUseCase(getIt()));

  // Playlists
  getIt.registerLazySingleton<PlaylistRemoteDataSource>(
    () => PlaylistRemoteDataSourceImpl(getIt()),
  );
  getIt.registerLazySingleton<PlaylistRepository>(
    () => PlaylistRepositoryImpl(getIt()),
  );
  getIt.registerLazySingleton(() => GetMyPlaylistsUseCase(getIt()));
  getIt.registerLazySingleton(() => CreatePlaylistUseCase(getIt()));
  getIt.registerLazySingleton(() => AddTrackToPlaylistUseCase(getIt()));
  getIt.registerLazySingleton(() => RemoveTrackFromPlaylistUseCase(getIt()));

  // Blocs
  getIt.registerFactory(() => SplashBloc());

  getIt.registerFactory(() => LoginBloc(getIt(), getIt()));

  getIt.registerFactory(() => SignupBloc(getIt()));

  getIt.registerFactory(() => ForgotPasswordBloc(getIt()));

  getIt.registerLazySingleton(() => MainBloc());

  getIt.registerLazySingleton(() => PlayBloc(getIt()));

  getIt.registerLazySingleton(() => MiniPlayerCubit());

  getIt.registerFactory(() => HomeBloc(getIt()));

  getIt.registerFactory(() => TrendingBloc(getIt()));

  getIt.registerFactory(
    () => SearchBloc(getIt(), getIt(), getIt(), getIt(), getIt(), getIt()),
  );

  getIt.registerFactory(
    () => ProfileBloc(getIt(), getIt(), getIt(), getIt(), getIt()),
  );

  getIt.registerFactory(
    () => SecurityCubit(getIt(), getIt(), getIt(), getIt()),
  );

  getIt.registerFactory(
    () => UploadBloc(getIt(), getIt(), getIt(), getIt(), getIt()),
  );

  getIt.registerFactoryParam<AddToPlaylistCubit, String, void>(
    (trackId, _) =>
        AddToPlaylistCubit(trackId, getIt(), getIt(), getIt(), getIt()),
  );

  await getIt.allReady();
}

/// The refresh token was rejected (expired, revoked, or the password changed):
/// drop the local session and send the user back to the login screen.
Future<void> _onSessionExpired() async {
  await getIt<SessionController>().clearSession();
  navigatorKey.currentContext?.go('/login');
}
