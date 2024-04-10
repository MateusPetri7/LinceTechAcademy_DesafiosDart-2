import 'dart:collection';
import 'dart:math';

void main() {
  Queue<Pessoa> fila = Queue<Pessoa>();
  GeradorNomes geradorNomes = GeradorNomes();

  for (int i = 0; i < 10; i++) {
    Pessoa pessoaAleatoria = geradorNomes.gerarNomeAleatorio();
    fila.addLast(pessoaAleatoria);
    print('$pessoaAleatoria entrou na fila');
  }

  while (fila.isNotEmpty) {
    atender(fila);
  }

  if (fila.isEmpty) {
    print('Fila vazia. Ninguém para atender.');
  }
}

void atender(Queue<Pessoa> fila) {
  Pessoa pessoaAtendida = fila.removeFirst();
  print('($pessoaAtendida) foi atendido(a)');
}

class Pessoa {
  final String nome;
  final String sobreNome;

  Pessoa(this.nome, this.sobreNome);

  @override
  String toString() {
    return '$nome $sobreNome';
  }
}

class GeradorNomes {
  final List<String> _nomes = [
    'Fulano',
    'Beltrano',
    'Ciclano',
    'João',
    'Maria',
    'José',
    'Ana',
    'Pedro',
    'Mariana',
    'Carlos'
  ];
  final List<String> _sobrenomes = [
    'Silva',
    'Santos',
    'Oliveira',
    'Souza',
    'Pereira',
    'Lima',
    'Almeida',
    'Ferreira',
    'Costa',
    'Rodrigues'
  ];
  final Random _random = Random();

  Pessoa gerarNomeAleatorio() {
    String nome = _nomes[_random.nextInt(_nomes.length)];
    String sobrenome = _sobrenomes[_random.nextInt(_sobrenomes.length)];
    return Pessoa(nome, sobrenome);
  }
}
