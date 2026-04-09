import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'state/todos_notifier.dart';

void main() => runApp(const ProviderScope(child: MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
        splashFactory: NoSplash.splashFactory,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
      ),
      home: const TodoUiBasica(),
    );
  }
}

class TodoUiBasica extends ConsumerStatefulWidget {
  const TodoUiBasica({super.key});

  @override
  ConsumerState<TodoUiBasica> createState() => _TodoUiBasicaState();
}

class _TodoUiBasicaState extends ConsumerState<TodoUiBasica> {
  final _titulo = TextEditingController();

  @override
  void dispose() {
    _titulo.dispose();
    super.dispose();
  }

  void _adicionar() {
    ref.read(todosProvider.notifier).add(_titulo.text);
    _titulo.clear();
  }

  @override
  Widget build(BuildContext context) {
    final todos = ref.watch(todosProvider);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _titulo,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                  ),
                  style: DefaultTextStyle.of(context).style,
                  onSubmitted: (_) => _adicionar(),
                ),
              ),
              GestureDetector(
                onTap: _adicionar,
                child: const Text('+'),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: todos.length,
              itemBuilder: (context, i) {
                final t = todos[i];
                return Row(
                  children: [
                    Checkbox(
                      value: t.done,
                      onChanged: (_) =>
                          ref.read(todosProvider.notifier).toggleDone(t.id),
                    ),
                    Expanded(child: Text(t.title)),
                    GestureDetector(
                      onTap: () =>
                          ref.read(todosProvider.notifier).remove(t.id),
                      child: const Text('x'),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
