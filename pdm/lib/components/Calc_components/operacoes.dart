class Operacoes {
  static const operations = const ['x', '-', '+', '÷'];

  String textoTela = '';
  String textoResultado = '';
  String textoNum1 = '';
  String textoNum2 = '';

  bool isFirstIndex = true;
  String operation = '';

  double num1 = 0;
  double num2 = 0;
/*
  printAll() {
    print("textoTela = $textoTela");
    print("textoResultado = $textoResultado");
    print("textoNum2 = $textoNum2");
    print("operation = $operation");
    print("num1 = $num1");
    print("num2 = $num2");
    print('\n ----------------- \n');
  }
*/
  void comando(String comando) {

    if (comando == "C") {
      clear();
    } else if (comando == '=') {
      textoResultado = calcular().toString();
      num1 = calcular();
      isFirstIndex = !isFirstIndex;
      textoNum2 = '';
    } else if (operations.contains(comando)) {
      if (textoTela.isEmpty) {
        if (comando == "+" || comando == "-") {
          textoNum1 = comando;
          textoTela = comando;
        }
      } else {
        if (isFirstIndex) {
          textoTela += comando;
          operation = comando;
          isFirstIndex = !isFirstIndex;
          textoNum1 = '';
        } else {
          num1 = calcular();
          textoTela = num1.toString() + comando;
          operation = comando;
          textoNum2 = '';
        }
      }
    } else {
      textoTela += comando;

      if (textoTela == ".") {
        textoTela = '';
      } else {
        if (!isFirstIndex) {
          textoNum2 += comando;
          num2 = double.parse(textoNum2);
        } else {
          textoNum1 += comando;
          num1 = double.parse(textoNum1);
        }
      }
    }
  }

  clear() {
    textoTela = '';
    textoResultado = '';
    textoNum1 = '';
    textoNum2 = '';

    isFirstIndex = true;
    operation = '';

    num1 = 0;
    num2 = 0;
  }

  double calcular() {
    switch (operation) {
      case 'x':
        return num1 * num2;

      case '-':
        return num1 - num2;

      case '+':
        return num1 + num2;

      case '÷':
        return num1 / num2;

      default:
        return 0;
    }
  }
}
