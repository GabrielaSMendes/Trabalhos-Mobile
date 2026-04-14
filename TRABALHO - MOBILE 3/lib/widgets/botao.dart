import 'package:flutter/material.dart';

class Botao extends StatelessWidget {
  final String texto;
  final VoidCallback onClick;
  final int flex;
  final double fontSize;
  final EdgeInsetsGeometry margin;
  final Color corFundo;
  final Color corTexto;
  /// Se falso, não usa [Expanded] (o pai deve dar constraints, ex.: outro [Expanded]).
  final bool expandirNaLinha;

  const Botao({
    super.key,
    required this.texto,
    required this.onClick,
    this.flex = 1,
    this.fontSize = 24,
    this.margin = const EdgeInsets.all(5),
    this.corFundo = const Color(0xFFE0E0E0),
    this.corTexto = Colors.black87,
    this.expandirNaLinha = true,
  });

  @override
  Widget build(BuildContext context) {
    final conteudo = Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onClick,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          margin: margin,
          decoration: BoxDecoration(
            color: corFundo,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(
              texto,
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: corTexto,
              ),
            ),
          ),
        ),
      ),
    );
    if (!expandirNaLinha) {
      return conteudo;
    }
    return Expanded(
      flex: flex,
      child: conteudo,
    );
  }
}