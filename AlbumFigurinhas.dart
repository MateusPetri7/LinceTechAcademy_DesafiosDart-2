import 'dart:math';

void main() {
  var figuras = [
    Figura("Figura 1", 1),
    Figura("Figura 2", 2),
    Figura("Figura 3", 3),
    Figura("Figura 4", 4),
    Figura("Figura 5", 5),
    Figura("Figura 6", 6),
    Figura("Figura 7", 7),
    Figura("Figura 8", 8),
    Figura("Figura 9", 9),
    Figura("Figura 10", 10),
    Figura("Figura 11", 11),
    Figura("Figura 12", 12),
    Figura("Figura 13", 13),
    Figura("Figura 14", 14),
    Figura("Figura 15", 15),
    Figura("Figura 16", 16),
    Figura("Figura 17", 17),
    Figura("Figura 18", 18),
    Figura("Figura 19", 19),
    Figura("Figura 20", 20),
  ];

  final album = AlbumFiguras(figuras);
  while (!album.albumCompleto(figuras)) {
    final pacote = PacoteFiguras(figuras);
    for (var figura in pacote.figuras) {
      album.adicionarFigura(figura);
    }
  }

  print('Número de figuras repetidas: ${album.figurasRepetidas.length}');
  album.imprimirAlbum();
}

class Figura {
  final String nome;
  final int codigo;

  Figura(this.nome, this.codigo);
}

class PacoteFiguras {
  List<Figura> figuras = [];

  PacoteFiguras(List<Figura> lista) {
    var random = Random();
    for (var i = 0; i < 4; i++) {
      var figura = lista[random.nextInt(lista.length)];
      figuras.add(figura);
    }
  }
}

class AlbumFiguras {
  List<Figura> figurasColadas = [];
  List<Figura> figurasRepetidas = [];

  AlbumFiguras(List<Figura> lista) {}

  void adicionarFigura(Figura figura) {
    if (!figurasColadas.contains(figura)) {
      figurasColadas.add(figura);
    } else {
      figurasRepetidas.add(figura);
    }
  }

  void imprimirAlbum() {
    figurasColadas.sort((a, b) => a.codigo.compareTo(b.codigo));
    print('Figuras coladas:');
    for (var figura in figurasColadas) {
      print('${figura.codigo} : ${figura.nome}');
    }
  }

  bool albumCompleto(List<Figura> lista) {
    for (var figura in lista) {
      if (!figurasColadas.contains(figura)) {
        return false;
      }
    }
    return true;
  }
}
