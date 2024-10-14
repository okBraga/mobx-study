import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_study/todo/stores/todo_list.dart';
import 'package:provider/provider.dart';

class ActionBar extends StatelessWidget {
  const ActionBar({super.key});

  @override
  Widget build(BuildContext context) {
    final list = Provider.of<TodoList>(context);

    return Column(children: <Widget>[
      Observer(
        builder: (_) => Column(
          children: <Widget>[
            RadioListTile(
              dense: true,
              title: const Text('All'),
              value: VisibilityFilter.all,
              groupValue: list.filter,
              onChanged: (filter) => list.filter = filter ?? VisibilityFilter.all,
            ),
            RadioListTile(
              dense: true,
              title: const Text('Pending'),
              value: VisibilityFilter.pending,
              groupValue: list.filter,
              onChanged: (filter) => list.filter = filter ?? VisibilityFilter.pending,
            ),
            RadioListTile(
              dense: true,
              title: const Text('Completed'),
              value: VisibilityFilter.completed,
              groupValue: list.filter,
              onChanged: (filter) => list.filter = filter ?? VisibilityFilter.completed,
            ),
          ],
        ),
      ),
      Observer(
          builder: (_) => ButtonBar(
                children: <Widget>[
                  ElevatedButton(
                    onPressed: list.canRemoveAllCompleted ? list.removeCompleted : null,
                    child: const Text('Remove Completed'),
                  ),
                  ElevatedButton(
                    onPressed: list.canMarkAllCompleted ? list.markAllAsCompleted : null,
                    child: const Text('Mark All Completed'),
                  )
                ],
              ))
    ]);
  }
}
