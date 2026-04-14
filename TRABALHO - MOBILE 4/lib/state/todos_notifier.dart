// Importação do Riverpod para gerenciamento de estado
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Importação do modelo de tarefa
import '../models/todo.dart';

// Classe responsável por gerenciar a lista de tarefas
class TodosNotifier extends Notifier<List<Todo>> {
  // Contador para gerar IDs únicos
  int _nextId = 1;

  @override
  List<Todo> build() => [];

  // Adiciona uma nova tarefa
  void add(String title) {
    final trimmed = title.trim();

    // Evita adicionar tarefas vazias
    if (trimmed.isEmpty) return;

    final todo = Todo(
      id: (_nextId++).toString(),
      title: trimmed,
      done: false,
    );

    // Atualiza o estado com a nova tarefa
    state = [...state, todo];
  }

  // Alterna o status de concluído da tarefa
  void toggleDone(String id) {
    state = [
      for (final t in state)
        if (t.id == id)
          t.copyWith(done: !t.done)
        else
          t,
    ];
  }

  // Remove uma tarefa pelo ID
  void remove(String id) {
    state = state.where((t) => t.id != id).toList(growable: false);
  }
}

// Provider que expõe o estado das tarefas para a UI
final todosProvider =
    NotifierProvider<TodosNotifier, List<Todo>>(TodosNotifier.new);
