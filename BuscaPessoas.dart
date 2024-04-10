void main() {
  final controleDePessoas = ControleDePessoas();

  var pessoas = [
    Pessoa('Jose', Mes.abril),
    Pessoa('Arthur', Mes.agosto),
    Pessoa('Joao', Mes.abril),
    Pessoa('Jesse', Mes.dezembro),
    Pessoa('Roberta', Mes.fevereiro),
    Pessoa('Carla', Mes.fevereiro),
    Pessoa('Thania', Mes.agosto),
    Pessoa('Rafaela', Mes.marco),
    Pessoa('Yuri', Mes.junho),
    Pessoa('Jonas', Mes.setembro),
    Pessoa('Elias', Mes.outubro),
    Pessoa('Abel', Mes.maio),
    Pessoa('Danilo', Mes.abril),
    Pessoa('Jonathan', Mes.abril),
    Pessoa('Joseph', Mes.setembro),
    Pessoa('Abdul', Mes.janeiro),
    Pessoa('Jean', Mes.abril)
  ];

  pessoas.forEach((pessoa) => controleDePessoas.cadastrarPessoa(pessoa));

  for (final mes in controleDePessoas.mesesComPessoas) {
    print('\n${mes.name}');

    for (final pessoa in controleDePessoas.pessoasPorMes(mes)) {
      print(' > ${pessoa.nome}');
    }
  }
}

enum Mes {
  janeiro,
  fevereiro,
  marco,
  abril,
  maio,
  junho,
  julho,
  agosto,
  setembro,
  outubro,
  novembro,
  dezembro,
}

class Pessoa {
  Pessoa(this.nome, this.mesDeNascimento);

  final String nome;
  final Mes mesDeNascimento;
}

class ControleDePessoas {
  final _pessoas = <Pessoa>[];

  void cadastrarPessoa(Pessoa pessoa) => _pessoas.add(pessoa);

  List<Mes> get mesesComPessoas =>
      _pessoas.map((pessoa) => pessoa.mesDeNascimento).toSet().toList()
        ..sort((a, b) => a.index.compareTo(b.index));

  List<Pessoa> pessoasPorMes(Mes mes) =>
      _pessoas.where((pessoa) => pessoa.mesDeNascimento == mes).toList();
}
