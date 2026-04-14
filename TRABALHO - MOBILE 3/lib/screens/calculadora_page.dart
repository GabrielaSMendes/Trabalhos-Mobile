import 'package:flutter/material.dart';
import '../widgets/botao.dart';
import '../widgets/display.dart';
import '../utils/calculadora_logica.dart';

class CalculadoraPage extends StatefulWidget {
  const CalculadoraPage({super.key});

  @override
  State<CalculadoraPage> createState() => _CalculadoraPageState();
}

class _CalculadoraPageState extends State<CalculadoraPage> {
  String valor = "0";

  void onPressed(String texto) {
    setState(() {
      valor = CalculadoraLogica.calcular(valor, texto);
    });
  }

  static const _margemNum = EdgeInsets.all(5);
  static const _margemOp =
      EdgeInsets.symmetric(horizontal: 4, vertical: 5);

  /// Dígitos: mesmo tamanho (três colunas iguais por linha).
  Widget _teclaNumero(String s) {
    return Botao(
      texto: s,
      onClick: () => onPressed(s),
      flex: 1,
      fontSize: 26,
      margin: _margemNum,
      corFundo: const Color(0xFFF0F0F0),
      corTexto: Colors.black87,
    );
  }

  Widget _teclaC() {
    return Botao(
      texto: 'C',
      onClick: () => onPressed('C'),
      flex: 1,
      fontSize: 22,
      margin: _margemNum,
      corFundo: Colors.amber.shade100,
      corTexto: Colors.black87,
    );
  }

  Widget _teclaDecimal() {
    return Botao(
      texto: ',',
      onClick: () => onPressed(','),
      flex: 1,
      fontSize: 28,
      margin: _margemNum,
      corFundo: const Color(0xFFF0F0F0),
      corTexto: Colors.black87,
    );
  }

  Widget _linhaTresNumeros(String a, String b, String c) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _teclaNumero(a),
          _teclaNumero(b),
          _teclaNumero(c),
        ],
      ),
    );
  }

  Widget _linhaOperador(String op) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Botao(
            texto: op,
            onClick: () => onPressed(op),
            flex: 1,
            fontSize: 20,
            margin: _margemOp,
            corFundo: Colors.blueGrey.shade300,
            corTexto: Colors.white,
          ),
        ],
      ),
    );
  }

  Widget _botaoIgual() {
    return Botao(
      texto: '=',
      onClick: () => onPressed('='),
      expandirNaLinha: false,
      fontSize: 34,
      margin: const EdgeInsets.fromLTRB(4, 5, 6, 5),
      corFundo: Colors.deepOrange,
      corTexto: Colors.white,
    );
  }

  Widget _teclado() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(6, 4, 6, 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 11,
              child: Column(
                children: [
                  _linhaTresNumeros('1', '2', '3'),
                  _linhaTresNumeros('4', '5', '6'),
                  _linhaTresNumeros('7', '8', '9'),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _teclaNumero('0'),
                        _teclaC(),
                        _teclaDecimal(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: Column(
                children: [
                  _linhaOperador('/'),
                  _linhaOperador('*'),
                  _linhaOperador('-'),
                  _linhaOperador('+'),
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: _botaoIgual(),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calculadora')),
      body: Column(
        children: [
          Display(texto: valor),
          _teclado(),
        ],
      ),
    );
  }
}
