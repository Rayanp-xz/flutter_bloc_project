import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationBloc extends Cubit<String> {
  NotificationBloc() : super('');

  void showNotification(String message) {
    emit(message);
  }
}