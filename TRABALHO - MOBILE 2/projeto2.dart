//projeto2.dart

import 'dart:io';

bool anoPublicacaoValido(int ano) {
  final atual = DateTime.now().year;
  return ano >= 1000 && ano <= atual + 1;
}

class Livro {
  String id;
  String titulo;
  String autor;
  int anoPublicacao;

  Livro({
    required this.id,
    required this.titulo,
    required this.autor,
    required this.anoPublicacao,
  });

  bool atualizar({
    String? novoTitulo,
    String? novoAutor,
    int? novoAnoPublicacao,
  }) {
    var alterou = false;
    if (novoTitulo != null && novoTitulo.trim().isNotEmpty) {
      titulo = novoTitulo.trim();
      alterou = true;
    }
    if (novoAutor != null && novoAutor.trim().isNotEmpty) {
      autor = novoAutor.trim();
      alterou = true;
    }
    if (novoAnoPublicacao != null && anoPublicacaoValido(novoAnoPublicacao)) {
      anoPublicacao = novoAnoPublicacao;
      alterou = true;
    }
    return alterou;
  }

  @override
  String toString() {
    return 'ID: $id | Titulo: $titulo | Autor: $autor | Ano: $anoPublicacao';
  }
}

class Biblioteca {
  final List<Livro> _livros = [];

  List<Livro> get listaLivros => List.unmodifiable(_livros);

  void cadastrarLivro(Livro livro) {
    final livroExistente = buscarLivroPorId(livro.id);
    if (livroExistente != null) {
      print('\nJa existe um livro com o ID ${livro.id}.');
      return;
    }

    _livros.add(livro);
    print('\nLivro cadastrado com sucesso!');
  }

  void listarLivros() {
    if (_livros.isEmpty) {
      print('\nNenhum livro cadastrado.');
      return;
    }

    print('\n=== Livros Cadastrados ===');
    for (final livro in listaLivros) {
      print(livro);
    }
  }

  Livro? buscarLivroPorId(String id) {
    for (final livro in _livros) {
      if (livro.id == id) {
        return livro;
      }
    }
    return null;
  }

  void atualizarLivro(String id, {String? titulo, String? autor, int? ano}) {
    final livro = buscarLivroPorId(id);
    if (livro == null) {
      print('\nLivro com ID $id nao encontrado.');
      return;
    }

    final alterou = livro.atualizar(
      novoTitulo: titulo,
      novoAutor: autor,
      novoAnoPublicacao: ano,
    );
    if (alterou) {
      print('\nLivro atualizado com sucesso!');
    } else {
      print('\nNenhuma alteracao foi realizada (campos em branco ou ano invalido).');
    }
  }

  void removerLivro(String id) {
    final livro = buscarLivroPorId(id);
    if (livro == null) {
      print('\nLivro com ID $id nao encontrado.');
      return;
    }

    _livros.remove(livro);
    print('\nLivro removido com sucesso!');
  }
}

String lerEntrada(String mensagem) {
  stdout.write(mensagem);
  return stdin.readLineSync()?.trim() ?? '';
}

int? lerInteiro(String mensagem) {
  final texto = lerEntrada(mensagem);
  return int.tryParse(texto);
}
void exibirMenu() {
  print('\n=== Sistema de Biblioteca ===');
  print('1 - Cadastrar livro');
  print('2 - Listar livros');
  print('3 - Atualizar livro');
  print('4 - Remover livro');
  print('5 - Sair');
}

void main() {
  final biblioteca = Biblioteca();
  var executando = true;

  while (executando) {
    exibirMenu();
    final opcao = lerEntrada('Escolha uma opcao: ');

    switch (opcao) {
      case '1':
        final id = lerEntrada('Informe o ID/ISBN: ');
        final titulo = lerEntrada('Informe o titulo: ');
        final autor = lerEntrada('Informe o autor: ');
        final ano = lerInteiro('Informe o ano de publicacao: ');

        if (id.isEmpty || titulo.isEmpty || autor.isEmpty || ano == null) {
          print('\nDados invalidos. Tente novamente.');
          break;
        }

        if (!anoPublicacaoValido(ano)) {
          print('\nAno de publicacao invalido.');
          break;
        }

        final livro = Livro(
          id: id,
          titulo: titulo,
          autor: autor,
          anoPublicacao: ano,
        );

        biblioteca.cadastrarLivro(livro);
        break;

      case '2':
        biblioteca.listarLivros();
        break;

      case '3':
        final id = lerEntrada('Informe o ID do livro que deseja atualizar: ');

        final livro = biblioteca.buscarLivroPorId(id);
        if (livro == null) {
          print('\nLivro com ID $id nao encontrado.');
          break;
        }

        print('\nDeixe em branco para manter o valor atual.');

        final novoTitulo = lerEntrada('Novo titulo (${livro.titulo}): ');
        final novoAutor = lerEntrada('Novo autor (${livro.autor}): ');
        final novoAnoTexto = lerEntrada('Novo ano (${livro.anoPublicacao}): ');

        final novoAno =
            novoAnoTexto.isEmpty ? null : int.tryParse(novoAnoTexto);

        if (novoAnoTexto.isNotEmpty && novoAno == null) {
          print('\nAno invalido. Atualizacao cancelada.');
          break;
        }

        if (novoAno != null && !anoPublicacaoValido(novoAno)) {
          print('\nAno fora do intervalo permitido.');
          break;
        }

        biblioteca.atualizarLivro(
          id,
          titulo: novoTitulo.isEmpty ? null : novoTitulo,
          autor: novoAutor.isEmpty ? null : novoAutor,
          ano: novoAno,
        );
        break;

      case '4':
        final id = lerEntrada('Informe o ID do livro que deseja remover: ');
        if (id.isEmpty) {
          print('\nID invalido. Informe um identificador.');
          break;
        }
        biblioteca.removerLivro(id);
        break;

      case '5':
        executando = false;
        print('\nEncerrando o sistema...');
        break;

      default:
        print('\nOpcao invalida. Tente novamente.');
    }
  }
}
