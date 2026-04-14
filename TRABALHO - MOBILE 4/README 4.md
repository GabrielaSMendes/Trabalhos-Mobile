# Trabalho 4 - Lista de Tarefas com Flutter de Estado

---

## 1. Descrição da Aplicação

Este projeto consiste em um aplicativo de lista de tarefas (To-Do List) desenvolvido em Flutter.

A aplicação permite ao usuário gerenciar suas tarefas diárias, oferecendo as seguintes funcionalidades:

- Adicionar novas tarefas
- Visualizar a lista de tarefas
- Marcar tarefas como concluídas
- Remover tarefas

O principal objetivo do projeto é aplicar conceitos de gestão de estado utilizando Riverpod, além de boas práticas de separação entre interface e lógica.

A interface presente no arquivo `main.dart` foi mantida simples, focada na validação da lógica. O layout pode ser aprimorado posteriormente utilizando widgets personalizados.

---

## 2. Gestão de Estado com Riverpod

A gestão de estado da aplicação foi implementada utilizando o Riverpod, uma biblioteca moderna e eficiente para controle de estado em aplicações Flutter.

### Provider Principal

O `todosProvider` (localizado em `lib/state/todos_notifier.dart`) é responsável por gerenciar a lista de tarefas.

Ele disponibiliza os seguintes métodos:

- `add(title)`: adiciona uma nova tarefa (ignora textos vazios)
- `toggleDone(id)`: alterna o estado da tarefa (concluída / não concluída)
- `remove(id)`: remove uma tarefa da lista

---

## 3. Estrutura do Modelo

Cada tarefa é representada pela classe `Todo` (`lib/models/todo.dart`).

### Atributos:

- `id`: identificador único da tarefa
- `title`: título da tarefa
- `done`: indica se a tarefa foi concluída (true/false)

---

## 4. Estrutura da Interface

A interface principal está localizada em:

lib/screens/todo_home_screen.dart


Ela é responsável por:

- Exibir a lista de tarefas
- Filtrar tarefas (todas, ativas, concluídas)
- Permitir adicionar novas tarefas
- Permitir marcar como concluída
- Permitir remover tarefas

A interface utiliza componentes do Flutter como:

- `Scaffold`
- `ListView`
- `TextField`
- `Checkbox`
- `AnimatedSwitcher`

---

## 5. Funcionalidades Extras

O projeto também inclui algumas melhorias de usabilidade:

- Feedback tátil (HapticFeedback)
- Filtros de tarefas (todas, pendentes e concluídas)
- Animações na interface
- Exclusão de tarefas com gesto (swipe)
- Mensagens de confirmação com SnackBar

---

## 6. Como Executar o Projeto

1. Certifique-se de que o Flutter está instalado corretamente  
2. Abra o terminal na pasta do projeto  
3. Execute os comandos:

flutter pub get
flutter run

---

## 7. Estrutura de Pastas (Resumo)

lib/
├── models/
│ └── todo.dart
├── state/
│ └── todos_notifier.dart
├── screens/
│ └── todo_home_screen.dart
├── theme/
│ └── app_theme.dart
└── main.dart

---

## 8. Objetivo Acadêmico

Este projeto tem como objetivo consolidar os conhecimentos em:

- Desenvolvimento com Flutter
- Gestão de estado com Riverpod
- Organização de código em camadas
- Boas práticas de UI/UX
- Programação reativa
