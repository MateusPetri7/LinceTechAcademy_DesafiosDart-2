// NAO PODE SER MODIFICADO
// -------------------------------------------------------------
import 'dart:math' as math;

void main() {
  final meioDeComunicacao = aleatorio();
  meioDeComunicacao.fazerLigacao('(47) 99876-5432');
}

MeioDeComunicacao aleatorio() {
  final meiosDeComunicacao = <MeioDeComunicacao>[
    Telefone(),
    Celular(),
    Orelhao(),
  ];

  final random = math.Random();

  return meiosDeComunicacao[random.nextInt(
    meiosDeComunicacao.length,
  )];
}

// -------------------------------------------------------------
// ADICIONAR IMPLEMENTACAO RESTANTE ABAIXO DESSA LINHA
// -------------------------------------------------------------

// ...

abstract class MeioDeComunicacao {
  void fazerLigacao(String numero);
}

class Telefone implements MeioDeComunicacao {
  @override
  void fazerLigacao(String numero) {
    print("[TELEFONE] ligando para $numero");
  }
}

class Celular implements MeioDeComunicacao {
  @override
  void fazerLigacao(String numero) {
    print("[CELULAR] ligando para $numero");
  }
}

class Orelhao implements MeioDeComunicacao {
  @override
  void fazerLigacao(String numero) {
    print("[ORELHÃO] ligando para $numero");
  }
}
