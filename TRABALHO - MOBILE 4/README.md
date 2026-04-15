# README — TRABALHO 4

## Trabalho 4 — Aplicação de Lista de Tarefas com Gestão de Estado (To-Do List)

##  Descrição
Este projeto consiste em um aplicativo de lista de tarefas (To-Do List) desenvolvido em Flutter. A aplicação permite ao usuário gerenciar suas tarefas diárias, possibilitando adicionar novas tarefas, visualizar a lista, marcar tarefas como concluídas e removê-las. O objetivo principal é aplicar conceitos de gestão de estado utilizando Riverpod, além de boas práticas de organização entre interface e lógica.

##  Funcionalidades
-   Adicionar tarefas (ignora campos vazios)
-   Listar tarefas dinamicamente
-   Marcar/desmarcar como concluída
-   Remover tarefas
-   Atualização automática da interface
-   Suporte a tema claro/escuro (ThemeMode.system)

##  Explicação de como foi Implementada a Gestão de Estado:

A gestão de estado foi realizada utilizando o Riverpod, que permite controlar e compartilhar o estado da aplicação de forma eficiente.
Responsável por gerenciar a lista de tarefas e expor as operações:

-   add(titulo): adiciona uma tarefa (ignora texto vazio)
-   toggleDone(id): alterna status de concluída
-   remove(id): remove tarefa pelo ID

## Modelo de Dados

Arquivo: lib/models/todo.dart

Cada tarefa (Todo) possui:

-   id (int)
-   title (String)
-   done (bool)

## Como Executar

Pré-requisitos:
-   Flutter instalado e configurado
-   Android Studio instalado e SDK configurado

No diretório do projeto:
-  flutter pub get
-  flutter run

##  Conceitos aplicados

-   Gestão de estado reativa com Riverpod
-   Separação entre UI, lógica e dados
-   Uso de ListView dinâmica
-   Manipulação de estado em tempo real
-   Interação com o usuário

##  Vídeo demonstrativo

(https://youtu.be/dZ_OPjU4Cg8)

