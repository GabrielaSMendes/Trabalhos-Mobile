Trabalho 2 - CRUD de Biblioteca em Dart utilizando Orientação a Objetos

1. Descrição do Sistema

Este sistema é uma aplicação simples desenvolvida em Dart, executada no terminal, que permite o gerenciamento de livros de uma biblioteca.
O usuário interage com o programa por meio de um menu, podendo realizar operações básicas como cadastrar, listar, atualizar e remover livros. Essas funcionalidades caracterizam um CRUD (Create, Read, Update, Delete).
O principal objetivo do sistema é aplicar, na prática, conceitos de Programação Orientada a Objetos (POO).

2. Explicação das Classes Utilizadas

LIVRO:
Responsável por representar um livro no sistema.

Atributos:
- titulo: nome do livro
- autor: autor do livro
- anoPublicacao: ano em que o livro foi publicado
- id: identificador único do livro

Função:
Armazenar as informações de cada livro cadastrado.

Biblioteca
Responsável por gerenciar os livros.

Atributo:
- listaLivros: lista que armazena objetos do tipo Livro

Métodos:
- cadastrarLivro(): adiciona um novo livro
- listarLivros(): exibe todos os livros cadastrados
- atualizarLivro(): altera informações de um livro
- removerLivro(): remove um livro da lista

Main
Responsável pela execução do programa.

Função:
- Exibir o menu de opções
- Receber dados do usuário
- Chamar os métodos da classe Biblioteca

3. Instruções para Execução:

4. Exemplos de uso:

