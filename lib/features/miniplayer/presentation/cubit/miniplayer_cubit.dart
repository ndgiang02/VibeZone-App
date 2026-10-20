import 'package:flutter_bloc/flutter_bloc.dart';

/// Whether the mini player is shrunk to a floating bubble.
class MiniPlayerCubit extends Cubit<bool> {
  MiniPlayerCubit() : super(false);

  void collapse() => emit(true);

  void expand() => emit(false);
}
