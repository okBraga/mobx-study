import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_study/todo/stores/todo_list.dart';
import 'package:provider/provider.dart';

class TodoListView extends StatelessWidget {
  const TodoListView({super.key});

  @override
  Widget build(BuildContext context) {
    final list = Provider.of<TodoList>(context);

    return Observer(
        builder: (_) => Flexible(
              child: ListView.builder(
                  itemCount: list.visibleTodos.length,
                  itemBuilder: (_, index) {
                    final todo = list.visibleTodos[index];
                    return Observer(
                        builder: (_) => CheckboxListTile(
                              controlAffinity: ListTileControlAffinity.leading,
                              value: todo.isCompleted,
                              onChanged: (flag) => todo.isCompleted = flag ?? false,
                              title: Row(
                                children: <Widget>[
                                  Expanded(
                                      child: Text(
                                    todo.description,
                                    overflow: TextOverflow.ellipsis,
                                  )),
                                  IconButton(
                                    icon: const Icon(Icons.delete),
                                    onPressed: () => list.removeTodo(todo),
                                  )
                                ],
                              ),
                            ));
                  }),
            ));
  }
}
