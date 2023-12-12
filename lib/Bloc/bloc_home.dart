import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc_class.dart';
class TodoHome extends StatelessWidget {
  final int count=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List App'),
      ),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state is TodoInitialState) {
            return Center(
              child: ListView(

                children: [
                  Text('Todos:'),
                  SizedBox(height: 16),
                  Column(
                    children: state.todos.map((todo) => Text(todo, style: TextStyle(fontSize: 18),))
                        .toList(),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => context.read<TodoBloc>().add(AddTodoEvent('New Todo')),
                    child: Text('Add Todo'),
                  ),
                ],
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}