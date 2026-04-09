import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/todo.dart';

class TodosNotifier extends Notifier<List<Todo>> {
  int _nextId = 1;

  @override
  List<Todo> build() => [];

  void add(String title) {
    final trimmed = title.trim();
    if (trimmed.isEmpty) return;
    final todo = Todo(id: (_nextId++).toString(), title: trimmed, done: false);
    state = [...state, todo];
  }

  void toggleDone(String id) {
    state = [
      for (final t in state)
        if (t.id == id) t.copyWith(done: !t.done) else t,
    ];
  }

  void remove(String id) {
    state = state.where((t) => t.id != id).toList(growable: false);
  }
}

final todosProvider = NotifierProvider<TodosNotifier, List<Todo>>(TodosNotifier.new);

