import 'dart:math' as math;

void main() {
  /// Cria uma instância do ComparadorFormasGeometricas.
  final comparador = ComparadorFormasGeometricas();

  /// Lista de formas geométricas.
  final formas = [
    Circulo('Circulo A', 3),
    Circulo('Circulo B', 8),
    Retangulo('Retângulo A', 4, 3),
    Retangulo('Retângulo B', 19, 11),
    TrianguloEquilatero('Triângulo Equilátero A', 3),
    TrianguloEquilatero('Triângulo Equilátero B', 6),
    TrianguloRetangulo('Triângulo Retângulo A', 7, 8),
    TrianguloRetangulo('Triângulo Retângulo B', 6, 12),
    PentagonoRegular('Pentágono Regular A', 5),
    PentagonoRegular('Pentágono Regular B', 7),
    HexagonoRegular('Hexágono Regular A', 8),
    HexagonoRegular('Hexágono Regular B', 6),
  ];

  /// Calcula a forma com a maior área.
  final formaComMaiorArea = comparador.calcularMaiorArea(formas);

  /// Calcula a forma com o maior perímetro.
  final formaComMaiorPerimetro = comparador.calcularMaiorPerimetro(formas);

  /// Imprime os resultados.
  print(
      'A forma com maior área é ${formaComMaiorArea.nome}, com área de ${formaComMaiorArea.calcularArea().toStringAsFixed(2)}');
  print(
      'A forma com maior perímetro é ${formaComMaiorPerimetro.nome}, com perímetro de ${formaComMaiorPerimetro.calcularPerimetro().toStringAsFixed(2)}');
}

/// Classe abstrata para representar uma forma geométrica.
abstract class FormaGeometrica {
  final String nome;

  FormaGeometrica(this.nome);

  /// Métodos abstratos para calcular a área e o perímetro da forma geométrica.
  double calcularArea();
  double calcularPerimetro();
}

/// Classes concretas para representar diferentes formas geométricas.
/// Implementadas todas as classes com as novas definições de formas geométricas pedidas.

class Circulo extends FormaGeometrica {
  Circulo(String nome, this.raio) : super(nome);

  final double raio;

  @override
  double calcularArea() => math.pi * math.pow(raio, 2);

  @override
  double calcularPerimetro() => 2 * math.pi * raio;
}

class Retangulo extends FormaGeometrica {
  Retangulo(String nome, this.altura, this.largura) : super(nome);

  final double largura;
  final double altura;

  @override
  double calcularArea() => altura * largura;

  @override
  double calcularPerimetro() => (altura * 2) + (largura * 2);
}

class Quadrado extends FormaGeometrica {
  Quadrado(String nome, this.lado) : super(nome);

  final double lado;

  @override
  double calcularArea() => lado * lado;

  @override
  double calcularPerimetro() => lado * 4;
}

class TrianguloEquilatero extends FormaGeometrica {
  TrianguloEquilatero(String nome, this.lado) : super(nome);

  final double lado;

  @override
  double calcularArea() => (math.sqrt(3) / 4) * math.pow(lado, 2);

  @override
  double calcularPerimetro() => lado * 3;
}

class TrianguloRetangulo extends FormaGeometrica {
  TrianguloRetangulo(String nome, this.base, this.altura) : super(nome);

  final double base;
  final double altura;

  @override
  double calcularArea() => (base * altura) / 2;

  @override
  double calcularPerimetro() {
    final lado = math.sqrt(math.pow(base, 2) + math.pow(altura, 2));
    return base + altura + lado;
  }
}

class PentagonoRegular extends FormaGeometrica {
  PentagonoRegular(String nome, this.lado) : super(nome);

  final double lado;

  @override
  double calcularArea() =>
      (1 / 4) * math.sqrt(5 * (5 + 2 * math.sqrt(5))) * math.pow(lado, 2);

  @override
  double calcularPerimetro() => lado * 5;
}

class HexagonoRegular extends FormaGeometrica {
  HexagonoRegular(String nome, this.lado) : super(nome);

  final double lado;

  @override
  double calcularArea() => (3 * math.sqrt(3) * math.pow(lado, 2)) / 2;

  @override
  double calcularPerimetro() => lado * 6;
}

/// Classe para comparar formas geométricas.
class ComparadorFormasGeometricas {
  /// Método para calcular a forma com a maior área.
  FormaGeometrica calcularMaiorArea(List<FormaGeometrica> formas) {
    /// Usa a função reduce para encontrar a forma com a maior área.
    return formas.reduce((a, b) => a.calcularArea() > b.calcularArea() ? a : b);
  }

  /// Método para calcular a forma com o maior perímetro.
  FormaGeometrica calcularMaiorPerimetro(List<FormaGeometrica> formas) {
    /// Usa a função reduce para encontrar a forma com o maior perímetro.
    return formas.reduce(
        (a, b) => a.calcularPerimetro() > b.calcularPerimetro() ? a : b);
  }
}
