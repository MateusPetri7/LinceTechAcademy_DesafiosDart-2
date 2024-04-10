import 'dart:collection';

void main() {
  Queue<Carta> baralho = Queue<Carta>();

  baralho.add(Carta('A', 'paus'));
  baralho.add(Carta('A', 'copas'));
  baralho.add(Carta('A', 'espadas'));
  baralho.add(Carta('A', 'ouros'));

  while (baralho.isNotEmpty) {
    Carta cartaRemovida = baralho.removeLast();
    print('Carta removida: $cartaRemovida');
  }
}

class Carta {
  final String valor;
  final String naipe;

  Carta(this.valor, this.naipe) {
    if (!['paus', 'copas', 'espadas', 'ouros'].contains(naipe)) {
      throw Exception('Naipe inválido: $naipe');
    }
  }

  @override
  String toString() {
    return '$valor ($naipe)';
  }
}
