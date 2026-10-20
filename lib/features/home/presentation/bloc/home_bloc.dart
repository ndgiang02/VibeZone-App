import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vibezone/core/common/entities/song.dart';
import 'package:vibezone/core/state/bloc/page_state.dart';
import 'package:vibezone/core/usecases/usecase.dart';
import 'package:vibezone/features/home/domain/entities/home_data.dart';
import 'package:vibezone/features/home/domain/usecases/get_home_data_usecase.dart';

part 'home_bloc.freezed.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetHomeDataUseCase _getHomeData;

  HomeBloc(this._getHomeData) : super(const HomeState()) {
    on<_Started>(_onStarted);
    on<_Refresh>(_onRefresh);
    on<_SelectGenre>(_onSelectGenre);
  }

  Future<void> _onStarted(_Started event, Emitter<HomeState> emit) async {
    emit(state.copyWith(status: PageState.loading));
    await _load(emit);
  }

  Future<void> _onRefresh(_Refresh event, Emitter<HomeState> emit) async {
    emit(state.copyWith(status: PageState.refreshing));
    await _load(emit);
  }

  void _onSelectGenre(_SelectGenre event, Emitter<HomeState> emit) {
    emit(state.copyWith(selectedGenre: event.genre));
  }

  Future<void> _load(Emitter<HomeState> emit) async {
    final result = await _getHomeData(const NoParams());
    result.fold(
      (failure) => emit(
        state.copyWith(status: PageState.error, errorMessage: failure.message),
      ),
      (data) => emit(
        state.copyWith(
          status: PageState.success,
          data: data,
          errorMessage: null,
        ),
      ),
    );
  }
}
