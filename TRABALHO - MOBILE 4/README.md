# README — TRABALHO 4

## Trabalho 4 — Aplicação de Lista de Tarefas com Gestão de Estado (To-Do List)

## 📌 Descrição
Este projeto consiste em um aplicativo de lista de tarefas (To-Do List) desenvolvido em Flutter. A aplicação permite ao usuário gerenciar suas tarefas diárias, possibilitando adicionar novas tarefas, visualizar a lista, marcar tarefas como concluídas e removê-las. O objetivo principal é aplicar conceitos de gestão de estado utilizando Riverpod, além de boas práticas de organização entre interface e lógica. A interface em main.dart é propositalmente mínima (só para testar o estado); o layout refinado pode ser feito depois em lib/widgets/.

## 🎯 Funcionalidades
- ➕ Adicionar tarefas
- ✔️ Marcar como concluída
- 🗑️ Remover tarefas
- 🔄 Atualização dinâmica

## ℹ️ Explicação de como foi Implementada a Gestão de Estado:

A gestão de estado foi realizada utilizando o Riverpod, que permite controlar e compartilhar o estado da aplicação de forma eficiente.

Estrutura do Estado O provider todosProvider (lib/state/todos_notifier.dart) gerencia a lista de tarefas e expõe:

add(título) — inclui tarefa (ignora texto vazio)
toggleDone(id) — alterna concluída / não concluída
remove(id) — remove da lista
Cada tarefa é um Todo (lib/models/todo.dart) com:

id (int)
title (String)
done (boolean)

## 🧠 Conceitos aplicados
- Gestão de estado
- Widgets dinâmicos
- ListView
- Interação com usuário

## 📷 Prints ou Gifs Demonstrando o Funcionamento:
Arquivos em TRABALHO - MOBILE 4/prints/

## 🎥 Vídeo demonstrativo

👉 [Coloque aqui o link]

## ▶️ Como executar

Na pasta do projeto (TRABALHO - MOBILE 4), no terminal:

```bash
flutter pub get
flutter run
