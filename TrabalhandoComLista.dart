import 'dart:math';

void main() {
  var controleCompras = ControleCompras();

  controleCompras.incluirItem("Maçã", 5);
  controleCompras.incluirItem("Pão", 2);
  controleCompras.incluirItem("Leite", 1);
  controleCompras.incluirItem("Queijo", 1);
  controleCompras.incluirItem("Refrigerante", 3);

  controleCompras.itens[0].comprado = true;
  controleCompras.itens[1].comprado = true;
  controleCompras.itens[2].estoque = false;

  controleCompras.exibirItensDesejados();

  var itemPendente = controleCompras.escolherItemPendenteAleatoriamente();
  if (itemPendente != null) {
    print("Item pendente escolhido aleatoriamente: ${itemPendente.nome}");
  } else {
    print("Nenhum item pendente.");
  }

  controleCompras.mostrarProgresso();
}

class ItemCompra {
  final String nome;
  int quantidade;
  bool comprado;
  bool estoque;

  ItemCompra(this.nome, this.quantidade,
      {this.comprado = false, this.estoque = true});
}

class ControleCompras {
  List<ItemCompra> itens = [];

  void incluirItem(String nome, int quantidade) {
    itens.add(ItemCompra(nome, quantidade));
  }

  List<ItemCompra> itensDesejados() {
    return itens.where((item) => !item.comprado && item.estoque).toList();
  }

  List<ItemCompra> itensComprados() {
    return itens.where((item) => item.comprado).toList();
  }

  List<ItemCompra> itensSemEstoque() {
    return itens.where((item) => !item.estoque).toList();
  }

  void exibirItensDesejados() {
    print("Itens Desejados:");
    for (var item in itensDesejados()) {
      print("${item.nome} - ${item.quantidade}");
    }
  }

  ItemCompra? escolherItemPendenteAleatoriamente() {
    var pendentes = itensDesejados();
    if (pendentes.length == 0) {
      return null;
    }
    var random = Random();
    return pendentes[random.nextInt(pendentes.length)];
  }

  void mostrarProgresso() {
    var numeroItensDesejados = itensDesejados().length;
    var numeroItensComprados = itensComprados().length;
    print("Progresso: $numeroItensComprados/$numeroItensDesejados");
  }
}
