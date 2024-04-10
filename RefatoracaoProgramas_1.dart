import 'dart:math';

void main() {
  /// Cria uma instância de Pessoa com calorias aleatórias iniciais.
  final pessoa = Pessoa.caloriasAleatorias();

  /// Loop para realizar até 5 refeições com fornecedores aleatórios
  for (var i = 0; i < 5; i++) {
    final fornecedor = aleatorio();

    /// Verifica se a pessoa não está satisfeita ou em excesso de calorias.
    if (pessoa._statusCalorias != StatusCalorias.satisfeito &&
        pessoa._statusCalorias != StatusCalorias.excesso) {
      /// Se não estiver satisfeita ou em excesso, realiza uma refeição.
      pessoa.refeicao(fornecedor);
    } else {
      /// Se estiver satisfeita ou em excesso, imprime uma mensagem e encerra o loop.
      print(
          'A pessoa está satisfeita ou em excesso de calorias, não é necessário mais refeições.');
      break;
    }
  }

  /// Imprime as informações da pessoa (calorias consumidas, refeições realizadas e status de calorias).
  pessoa.informacoes();
}

/// Enumeração para representar os diferentes status de calorias.
enum StatusCalorias { deficitExtremo, deficit, satisfeito, excesso }

/// Extensão para adicionar descrições aos status de calorias.
extension StatusCaloriasDescricao on StatusCalorias {
  String get descricao {
    switch (this) {
      case StatusCalorias.deficitExtremo:
        return 'Déficit extremo de calorias';
      case StatusCalorias.deficit:
        return 'Déficit de calorias';
      case StatusCalorias.satisfeito:
        return 'Pessoa está satisfeita';
      case StatusCalorias.excesso:
        return 'Excesso de calorias';
    }
  }
}

/// Função para selecionar um fornecedor aleatório.
Fornecedor aleatorio() {
  final fornecedor = <Fornecedor>[
    FornecedorDeBebidas(),
    FornecedorDeSanduiches(),
    FornecedorDeBolos(),
    FornecedorDeSaladas(),
    FornecedorDePetiscos(),
    FornecedorDeUltraCaloricos()
  ];

  final random = Random();

  return fornecedor[random.nextInt(
    fornecedor.length,
  )];
}

/// Classe Produto para representar um item com nome e calorias.
class Produto {
  Produto(this.nome, this.calorias);

  final String nome;
  final int calorias;
}

/// Classe base abstrata para fornecedores.
abstract class Fornecedor {
  final _random = Random();
  Produto fornecer();
}

/// Classes concretas que representam fornecedores específicos.
/// Implementado todos novos fornecedores pedidos.
class FornecedorDeBebidas extends Fornecedor {
  final _bebidasDisponiveis = <Produto>[
    Produto('Agua', 0),
    Produto('Refrigerante', 200),
    Produto('Suco de fruta', 100),
    Produto('Energetico', 135),
    Produto('Cafe', 60),
    Produto('Cha', 35),
  ];

  @override
  Produto fornecer() {
    return _bebidasDisponiveis[_random.nextInt(_bebidasDisponiveis.length)];
  }
}

class FornecedorDeSanduiches extends Fornecedor {
  final _sanduichesDisponiveis = <Produto>[
    Produto('Sanduíche de carne assada', 400),
    Produto('Sanduíche de atum', 300),
    Produto('Sanduíche de salada de frango', 250),
    Produto('Sanduíche de pernil marinado', 275),
    Produto('Sanduíche de peito de peru', 280),
    Produto('Sanduíche de frango grelhado', 275),
  ];

  @override
  Produto fornecer() {
    return _sanduichesDisponiveis[
        _random.nextInt(_sanduichesDisponiveis.length)];
  }
}

class FornecedorDeBolos extends Fornecedor {
  final _bolosDisponiveis = <Produto>[
    Produto('Bolo de Fubá Cremoso', 700),
    Produto('Bolo Vulcão', 500),
    Produto('Bolo Nega Maluca', 550),
    Produto('Bolo de Laranja', 375),
    Produto('Bolo de aniversário', 900),
    Produto('Bolo de brigadeiro', 750),
  ];

  @override
  Produto fornecer() {
    return _bolosDisponiveis[_random.nextInt(_bolosDisponiveis.length)];
  }
}

class FornecedorDeSaladas extends Fornecedor {
  final _saladasDisponiveis = <Produto>[
    Produto('Alface', 20),
    Produto('Repolho', 25),
    Produto('Chuchu', 30),
    Produto('Pepino', 25),
    Produto('Cenouro', 35),
    Produto('Vinagrete', 45),
  ];

  @override
  Produto fornecer() {
    return _saladasDisponiveis[_random.nextInt(_saladasDisponiveis.length)];
  }
}

class FornecedorDePetiscos extends Fornecedor {
  final _petiscosDisponiveis = <Produto>[
    Produto('Salsinha no espeto', 250),
    Produto('Mini pastel com carne', 170),
    Produto('Iscas de frango', 150),
    Produto('Petisco de boteco', 200),
    Produto('Camarão', 220),
    Produto('Churrasquinho', 275),
  ];

  @override
  Produto fornecer() {
    return _petiscosDisponiveis[_random.nextInt(_petiscosDisponiveis.length)];
  }
}

class FornecedorDeUltraCaloricos extends Fornecedor {
  final _ultraCaloricosDisponiveis = <Produto>[
    Produto('Queijo', 1100),
    Produto('Chocolate', 1000),
    Produto('Pão françês', 250),
    Produto('Biscoitos recheados', 1250),
    Produto('Azeite de oliva', 2000),
    Produto('Castanha de caju', 250),
  ];

  @override
  Produto fornecer() {
    return _ultraCaloricosDisponiveis[
        _random.nextInt(_ultraCaloricosDisponiveis.length)];
  }
}

/// Classe que representa uma pessoa.
class Pessoa {
  int _caloriasConsumidas = 0;
  int _refeicoesRealizadas = 0;
  late StatusCalorias _statusCalorias;

  Pessoa(this._statusCalorias);

  /// Construtor alternativo para criar uma pessoa com calorias aleatórias.
  Pessoa.caloriasAleatorias() {
    final random = Random();
    final caloriasIniciais = random.nextInt(3000);
    _caloriasConsumidas = caloriasIniciais;
    _statusCalorias = calcularStatusCalorias(caloriasIniciais);
  }

  /// Método para imprimir informações da pessoa.
  void informacoes() {
    print("Calorias consumidas: $_caloriasConsumidas");
    print("Refeições realizadas: $_refeicoesRealizadas");
    print("Status de calorias: ${_statusCalorias.descricao}");
  }

  /// Método para realizar uma refeição com base em um fornecedor.
  void refeicao(Fornecedor fornecedor) {
    final produto = fornecedor.fornecer();
    print('Consumindo ${produto.nome} (${produto.calorias} calorias)');

    /// Atualiza as calorias consumidas, refeições realizadas e status de calorias.
    _caloriasConsumidas += produto.calorias;
    _refeicoesRealizadas++;
    _statusCalorias = calcularStatusCalorias(_caloriasConsumidas);
  }

  /// Método para calcular o status de calorias com base na quantidade total de calorias consumidas.
  StatusCalorias calcularStatusCalorias(int calorias) {
    if (calorias <= 500) {
      return StatusCalorias.deficitExtremo;
    } else if (calorias <= 1800) {
      return StatusCalorias.deficit;
    } else if (calorias <= 2500) {
      return StatusCalorias.satisfeito;
    } else {
      return StatusCalorias.excesso;
    }
  }
}
