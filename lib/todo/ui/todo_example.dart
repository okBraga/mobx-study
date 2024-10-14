import 'package:flutter/material.dart';
import 'package:mobx_study/todo/stores/todo_list.dart';
import 'package:mobx_study/todo/ui/action_bar.dart';
import 'package:mobx_study/todo/ui/add_todo.dart';
import 'package:mobx_study/todo/ui/description.dart';
import 'package:mobx_study/todo/ui/todo_list_view.dart';
import 'package:provider/provider.dart';

class TodoExample extends StatelessWidget {
  const TodoExample({super.key});

  @override
  Widget build(BuildContext context) => Provider<TodoList>(
        create: (_) => TodoList(),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Todos'),
          ),
          body: Column(
            children: [
              AddTodo(),
              const ActionBar(),
              Description(),
              const TodoListView(),
            ],
          ),
        ),
      );
}
