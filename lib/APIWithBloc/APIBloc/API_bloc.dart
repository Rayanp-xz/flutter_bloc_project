
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_project/APIWithBloc/APi_class.dart';

import '../API_class_link.dart';
import 'API_event.dart';
import 'API_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final productRepositort _userRepository;

  UserBloc(this._userRepository) : super(UserLoadingState()) {
    on<LoadUserEvent>((event, emit) async {
      emit(UserLoadingState());
      try {
        final users = await _userRepository.fetchData();
        emit(UserLoadedState(users!));
      } catch (e) {
        emit(UserErrorState(e.toString()));
      }
    });
  }
}