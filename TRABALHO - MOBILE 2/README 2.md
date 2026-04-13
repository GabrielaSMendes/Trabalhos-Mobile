# Trabalho 2 - CRUD de Biblioteca em Dart

---

## 1. Descrição do Sistema

Este sistema é uma aplicação simples desenvolvida em Dart, executada no terminal, que permite o gerenciamento de livros de uma biblioteca.

O usuário interage com o programa por meio de um menu, podendo realizar operações básicas como:

- Cadastrar livros
- Listar livros
- Atualizar livros
- Remover livros

Essas funcionalidades caracterizam um CRUD (Create, Read, Update, Delete).

O principal objetivo do sistema é aplicar, na prática, conceitos de Programação Orientada a Objetos (POO).

---

## 2. Explicação das Classes

### Classe Livro

Responsável por representar um livro no sistema.

**Atributos:**
- `id`: identificador único do livro
- `titulo`: nome do livro
- `autor`: autor do livro
- `anoPublicacao`: ano de publicação

**Função:**
Armazenar as informações de cada livro e permitir atualização dos dados.

---

### Classe Biblioteca

Responsável por gerenciar os livros cadastrados.

**Atributo:**
- `listaLivros`: lista que armazena objetos do tipo Livro

**Métodos:**
- `cadastrarLivro()`: adiciona um novo livro
- `listarLivros()`: exibe todos os livros cadastrados
- `atualizarLivro()`: altera informações de um livro existente
- `removerLivro()`: remove um livro da lista

---

### Função main()

Responsável pela execução do sistema.

**Funções principais:**
- Exibir o menu de opções
- Receber entradas do usuário
- Controlar o fluxo do programa
- Chamar os métodos da classe Biblioteca

---

## 3. Validações Implementadas

O sistema possui algumas validações importantes:

- Não permite cadastro com campos vazios
- Não permite anos inválidos (menor que 1000 ou maior que o ano atual + 1)
- Não permite cadastrar livros com IDs duplicados
- Validação de entrada numérica para o ano

---

## 4. Como Executar

1. Instale o Dart na sua máquina  
2. Abra o terminal na pasta do projeto  
3. Execute o comando:
dart run projeto2.dart

---

## 5. Exemplo de Uso
 Sistema de Biblioteca 
1 - Cadastrar livro
2 - Listar livros
3 - Atualizar livro
4 - Remover livro
5 - Sair

Exemplo:
nforme o ID/ISBN: 1
Informe o titulo: Dom Casmurro
Informe o autor: Machado de Assis
Informe o ano de publicacao: 1899

Livro cadastrado com sucesso!

---

## 6. Objetivo Acadêmico

Este projeto tem como objetivo consolidar os conhecimentos em:

- Programação Orientada a Objetos (POO)
- Manipulação de listas
- Entrada e saída de dados no terminal
- Estrutura de controle (if, switch, loops)
- Boas práticas de organização de código
