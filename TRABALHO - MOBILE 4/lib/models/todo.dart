class Todo {
  // Identificador único da tarefa
  final String id;

  // Título da tarefa
  final String title;

  // Indica se a tarefa foi concluída
  final bool done;

  const Todo({
    required this.id,
    required this.title,
    required this.done,
  });

  // Método para copiar o objeto com alterações
  Todo copyWith({String? id, String? title, bool? done}) {
    return Todo(
      id: id ?? this.id,
      title: title ?? this.title,
      done: done ?? this.done,
    );
  }
}
