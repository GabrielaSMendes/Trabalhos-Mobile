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

  Widget linhaBotoes(List<String> botoes) {
    return Expanded(
      child: Row(
        children: botoes.map((b) {
          return Botao(
            texto: b,
            onClick: () => onPressed(b),
          );
        }).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Calculadora")),
      body: Column(
        children: [
          Display(texto: valor),

          linhaBotoes(["7", "8", "9", "/"]),
          linhaBotoes(["4", "5", "6", "*"]),
          linhaBotoes(["1", "2", "3", "-"]),
          linhaBotoes(["0", "C", "=", "+"]),
        ],
      ),
    );
  }
}