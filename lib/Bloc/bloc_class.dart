
import 'package:bloc/bloc.dart';


abstract class TodoEvent {}

class AddTodoEvent extends TodoEvent {
  final String todo;

  AddTodoEvent(this.todo);
}

abstract class TodoState {}

class TodoInitialState extends TodoState {
  final List<String> todos;

  TodoInitialState(this.todos);
}


class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoInitialState([]));

      @override
      Stream<TodoState> mapEventToState(TodoEvent event) async* {
    if (event is AddTodoEvent) {
      List<String> updatedTodos = List.from((state as TodoInitialState).todos)..add(event.todo);
      yield TodoInitialState(updatedTodos);
    }
  }
}
