# README — TRABALHO 4

## Trabalho 4 — Aplicação de Lista de Tarefas com Gestão de Estado (To-Do List)

## 📌 Descrição
Este projeto consiste em um aplicativo de lista de tarefas (To-Do List) desenvolvido em Flutter.
A aplicação permite ao usuário gerenciar suas tarefas diárias, possibilitando adicionar novas tarefas, visualizar a lista, marcar tarefas como concluídas e removê-las.
O objetivo principal é aplicar conceitos de gestão de estado utilizando Riverpod, além de boas práticas de organização entre interface e lógica.

## 🎯 Funcionalidades
- ➕ Adicionar tarefas
- ✔️ Marcar como concluída
- 🗑️ Remover tarefas
- 🔄 Atualização dinâmica

## ℹ️ Explicação de como foi Implementada a Gestão de Estado:

A gestão de estado foi realizada utilizando o Riverpod, que permite controlar e compartilhar o estado da aplicação de forma eficiente.

Estrutura do Estado
Foi criado um provider responsável por gerenciar:
- A lista de tarefas
- O status de conclusão de cada tarefa

Cada tarefa pode ser representada por um modelo contendo:
- Descrição
- Status (concluída ou não)

## 🧠 Conceitos aplicados
- Gestão de estado
- Widgets dinâmicos
- ListView
- Interação com usuário

## 📷 Prints ou Gifs Demonstrando o Funcionamento:

## 🎥 Vídeo demonstrativo

👉 [Coloque aqui o link]

## ▶️ Como executar

```bash
flutter pub get
flutter run
