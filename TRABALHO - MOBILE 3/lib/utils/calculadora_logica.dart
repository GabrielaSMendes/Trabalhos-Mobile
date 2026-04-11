class CalculadoraLogica {
  static String calcular(String valorAtual, String entrada) {
    if (entrada == "C") {
      return "0";
    }

    if (entrada == "=") {
      try {
        String expressao = valorAtual.replaceAll("×", "*").replaceAll("÷", "/");
        double resultado = _avaliar(expressao);
        return resultado.toString();
      } catch (e) {
        return "Erro";
      }
    }

    if (valorAtual == "0") {
      return entrada;
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