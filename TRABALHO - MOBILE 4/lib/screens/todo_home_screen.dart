import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/todo.dart';
import '../state/todos_notifier.dart';

enum _TaskFilter { all, active, done }

class TodoHomeScreen extends ConsumerStatefulWidget {
  const TodoHomeScreen({super.key});

  @override
  ConsumerState<TodoHomeScreen> createState() => _TodoHomeScreenState();
}

class _TodoHomeScreenState extends ConsumerState<TodoHomeScreen> {
  final _titulo = TextEditingController();
  final _focusNode = FocusNode();
  _TaskFilter _filter = _TaskFilter.all;

  @override
  void dispose() {
    _titulo.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _adicionar() {
    final text = _titulo.text;
    ref.read(todosProvider.notifier).add(text);
    if (text.trim().isNotEmpty) {
      HapticFeedback.lightImpact();
      _titulo.clear();
    }
  }

  List<Todo> _filtered(List<Todo> todos) {
    return switch (_filter) {
      _TaskFilter.all => todos,
      _TaskFilter.active => todos.where((t) => !t.done).toList(),
      _TaskFilter.done => todos.where((t) => t.done).toList(),
    };
  }

  @override
  Widget build(BuildContext context) {
    final todos = ref.watch(todosProvider);
    final filtered = _filtered(todos);
    final scheme = Theme.of(context).colorScheme;
    final topInset = MediaQuery.paddingOf(context).top;

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          _Header(
            topInset: topInset,
            pending: todos.where((t) => !t.done).length,
            total: todos.length,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 12),
            child: _ComposerCard(
              controller: _titulo,
              focusNode: _focusNode,
              onSubmit: _adicionar,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: _FilterBar(
              selected: _filter,
              onChanged: (f) => setState(() => _filter = f),
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 280),
              switchInCurve: Curves.easeOutCubic,
              switchOutCurve: Curves.easeInCubic,
              child: filtered.isEmpty
                  ? _EmptyState(
                      key: ValueKey('empty-$_filter'),
                      filter: _filter,
                      scheme: scheme,
                    )
                  : ListView.separated(
                      key: ValueKey('list-$_filter-${filtered.length}'),
                      padding: const EdgeInsets.fromLTRB(20, 4, 20, 32),
                      itemCount: filtered.length,
                      separatorBuilder: (context, index) => const SizedBox(height: 10),
                      itemBuilder: (context, i) {
                        final t = filtered[i];
                        return _TodoCard(
                          todo: t,
                          onToggle: () {
                            HapticFeedback.selectionClick();
                            ref.read(todosProvider.notifier).toggleDone(t.id);
                          },
                          onDelete: () {
                            HapticFeedback.mediumImpact();
                            ref.read(todosProvider.notifier).remove(t.id);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('“${t.title}” removida'),
                                duration: const Duration(seconds: 2),
                              ),
                            );
                          },
                        );
                      },
                    ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    required this.topInset,
    required this.pending,
    required this.total,
  });

  final double topInset;
  final int pending;
  final int total;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(24, topInset + 16, 24, 28),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            scheme.primary,
            Color.lerp(scheme.primary, const Color(0xFF0A0A0A), 0.72)!,
          ],
        ),
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(32)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.28),
            blurRadius: 24,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: scheme.onPrimary.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(Icons.task_alt_rounded, color: scheme.onPrimary, size: 26),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Minhas tarefas',
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            color: scheme.onPrimary,
                            fontWeight: FontWeight.w700,
                            letterSpacing: -0.5,
                          ),
                    ),
                    Text(
                      'PDM — Atividade 4',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: scheme.onPrimary.withValues(alpha: 0.85),
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              _StatChip(
                icon: Icons.pending_actions_rounded,
                label: '$pending pendentes',
                scheme: scheme,
              ),
              const SizedBox(width: 10),
              _StatChip(
                icon: Icons.list_alt_rounded,
                label: '$total no total',
                scheme: scheme,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _StatChip extends StatelessWidget {
  const _StatChip({
    required this.icon,
    required this.label,
    required this.scheme,
  });

  final IconData icon;
  final String label;
  final ColorScheme scheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: scheme.onPrimary.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: scheme.onPrimary.withValues(alpha: 0.2)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 18, color: scheme.onPrimary.withValues(alpha: 0.9)),
          const SizedBox(width: 6),
          Text(
            label,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: scheme.onPrimary.withValues(alpha: 0.95),
                  fontWeight: FontWeight.w600,
                ),
          ),
        ],
      ),
    );
  }
}

class _ComposerCard extends StatelessWidget {
  const _ComposerCard({
    required this.controller,
    required this.focusNode,
    required this.onSubmit,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final VoidCallback onSubmit;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Transform.translate(
      offset: const Offset(0, -18),
      child: Material(
        elevation: 6,
        shadowColor: scheme.shadow.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(22),
        color: scheme.surfaceContainerLowest,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: controller,
                  focusNode: focusNode,
                  textCapitalization: TextCapitalization.sentences,
                  textInputAction: TextInputAction.done,
                  onSubmitted: (_) => onSubmit(),
                  decoration: InputDecoration(
                    hintText: 'O que você precisa fazer?',
                    prefixIcon: Icon(
                      Icons.edit_note_rounded,
                      color: scheme.primary.withValues(alpha: 0.7),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 4),
              FilledButton(
                onPressed: onSubmit,
                style: FilledButton.styleFrom(
                  padding: const EdgeInsets.all(16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Icon(Icons.add_rounded, size: 26),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FilterBar extends StatelessWidget {
  const _FilterBar({
    required this.selected,
    required this.onChanged,
  });

  final _TaskFilter selected;
  final ValueChanged<_TaskFilter> onChanged;

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<_TaskFilter>(
      segments: const [
        ButtonSegment(
          value: _TaskFilter.all,
          label: Text('Todas'),
          icon: Icon(Icons.grid_view_rounded, size: 18),
        ),
        ButtonSegment(
          value: _TaskFilter.active,
          label: Text('Ativas'),
          icon: Icon(Icons.radio_button_unchecked, size: 18),
        ),
        ButtonSegment(
          value: _TaskFilter.done,
          label: Text('Feitas'),
          icon: Icon(Icons.check_circle_outline_rounded, size: 18),
        ),
      ],
      selected: {selected},
      onSelectionChanged: (s) => onChanged(s.first),
      showSelectedIcon: false,
      style: ButtonStyle(
        visualDensity: VisualDensity.compact,
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        ),
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState({
    super.key,
    required this.filter,
    required this.scheme,
  });

  final _TaskFilter filter;
  final ColorScheme scheme;

  @override
  Widget build(BuildContext context) {
    final (icon, title, subtitle) = switch (filter) {
      _TaskFilter.all => (
          Icons.inbox_rounded,
          'Nada por aqui',
          'Adicione sua primeira tarefa no campo acima.',
        ),
      _TaskFilter.active => (
          Icons.celebration_rounded,
          'Tudo em dia',
          'Não há tarefas pendentes no momento.',
        ),
      _TaskFilter.done => (
          Icons.hourglass_empty_rounded,
          'Nenhuma concluída',
          'Marque tarefas como feitas para vê-las aqui.',
        ),
    };

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(28),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: scheme.primaryContainer.withValues(alpha: 0.45),
              ),
              child: Icon(icon, size: 56, color: scheme.primary),
            ),
            const SizedBox(height: 28),
            Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
            ),
            const SizedBox(height: 10),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: scheme.onSurfaceVariant,
                    height: 1.4,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TodoCard extends StatelessWidget {
  const _TodoCard({
    required this.todo,
    required this.onToggle,
    required this.onDelete,
  });

  final Todo todo;
  final VoidCallback onToggle;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Dismissible(
      key: ValueKey(todo.id),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 22),
        decoration: BoxDecoration(
          color: scheme.errorContainer,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Icon(Icons.delete_outline_rounded, color: scheme.error, size: 28),
      ),
      onDismissed: (_) => onDelete(),
      child: Material(
        color: scheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(18),
        child: InkWell(
          onTap: onToggle,
          borderRadius: BorderRadius.circular(18),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            child: Row(
              children: [
                Checkbox(
                  value: todo.done,
                  onChanged: (_) => onToggle(),
                ),
                Expanded(
                  child: AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 220),
                    curve: Curves.easeOutCubic,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          decoration: todo.done ? TextDecoration.lineThrough : null,
                          decorationColor: scheme.onSurfaceVariant,
                          color: todo.done
                              ? scheme.onSurfaceVariant
                              : scheme.onSurface,
                          fontWeight: FontWeight.w600,
                          height: 1.25,
                        ),
                    child: Text(todo.title),
                  ),
                ),
                IconButton(
                  onPressed: onDelete,
                  icon: Icon(
                    Icons.close_rounded,
                    color: scheme.outline,
                  ),
                  tooltip: 'Remover',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
