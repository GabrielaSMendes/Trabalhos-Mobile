import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:pdm_atv4/main.dart';

void main() {
  testWidgets('app inicia', (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(child: MyApp()));
    expect(find.byType(MaterialApp), findsOneWidget);
    expect(find.byIcon(Icons.add_rounded), findsOneWidget);
  });

  testWidgets('adicionar tarefa via UI', (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(child: MyApp()));

    await tester.enterText(find.byType(TextField), 'comprar leite');
    await tester.tap(find.byIcon(Icons.add_rounded));
    await tester.pump();

    expect(find.text('comprar leite'), findsOneWidget);
  });
}
