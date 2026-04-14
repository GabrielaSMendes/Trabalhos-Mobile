class CalculadoraLogica {
  static bool _ehOperador(String c) => '+-*/'.contains(c);

  static bool _ehSeparadorDecimal(String c) => c == ',' || c == '.';

  /// O número em digitação no fim da expressão já tem vírgula ou ponto.
  static bool _segmentoFinalTemDecimal(String s) {
    for (var i = s.length - 1; i >= 0; i--) {
      final c = s[i];
      if (_ehOperador(c)) break;
      if (c == ',' || c == '.') return true;
    }
    return false;
  }

  static String _semOperadorNoFim(String s) {
    if (s.isEmpty) return s;
    final ultimo = s[s.length - 1];
    if (_ehOperador(ultimo)) {
      return s.substring(0, s.length - 1);
    }
    return s;
  }

  static String calcular(String valorAtual, String entrada) {
    if (entrada == "C") {
      return "0";
    }

    if (valorAtual == "Erro") {
      if (entrada == "=") return "Erro";
      if (_ehSeparadorDecimal(entrada)) return "0,";
      if (_ehOperador(entrada)) return "0$entrada";
      return entrada;
    }

    if (_ehSeparadorDecimal(entrada)) {
      if (_segmentoFinalTemDecimal(valorAtual)) return valorAtual;
      if (valorAtual == "0") return "0,";
      final ultimo = valorAtual[valorAtual.length - 1];
      if (_ehOperador(ultimo)) return "${valorAtual}0,";
      return "$valorAtual,";
    }

    if (entrada == "=") {
      try {
        String expressao =
            valorAtual.replaceAll("×", "*").replaceAll("÷", "/");
        expressao = _semOperadorNoFim(expressao);
        if (expressao.isEmpty) return "0";
        expressao = expressao.replaceAll(',', '.');
        double resultado = _avaliar(expressao);
        final texto = resultado.toString();
        return texto.contains('.')
            ? texto.replaceAll('.', ',')
            : texto;
      } catch (e) {
        return "Erro";
      }
    }

    if (valorAtual == "0") {
      if (_ehOperador(entrada)) return "0$entrada";
      return entrada;
    }

    if (_ehOperador(entrada)) {
      final ultimo = valorAtual[valorAtual.length - 1];
      if (_ehOperador(ultimo)) {
        return valorAtual.substring(0, valorAtual.length - 1) + entrada;
      }
    }

    return valorAtual + entrada;
  }

  static double _avaliar(String expr) {
    List<String> tokens = _tokenizar(expr);

    double resultado = double.parse(tokens[0]);

    for (int i = 1; i < tokens.length; i += 2) {
      String op = tokens[i];
      double num = double.parse(tokens[i + 1]);

      if (op == "+") resultado += num;
      if (op == "-") resultado -= num;
      if (op == "*") resultado *= num;
      if (op == "/") resultado /= num;
    }

    return resultado;
  }

  static List<String> _tokenizar(String expr) {
    List<String> tokens = [];
    String numero = "";

    for (int i = 0; i < expr.length; i++) {
      String c = expr[i];

      if ("+-*/".contains(c)) {
        tokens.add(numero);
        tokens.add(c);
        numero = "";
      } else {
        numero += c;
      }
    }

    tokens.add(numero);
    return tokens;
  }
}