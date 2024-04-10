void main() {
  BibliotecaDeMusicas biblioteca = BibliotecaDeMusicas();

  biblioteca.adicionarMusica(Musica('Pieces', 'AVAION', 'Divide', 210));
  biblioteca.adicionarMusica(
      Musica('i like the way you kiss me', 'Artemas', 'Novas', 142));
  biblioteca.adicionarMusica(
      Musica('Um Minuto Para O Fim Do Mundo', 'CPM22', 'Extra', 213));
  biblioteca
      .adicionarMusica(Musica('Céu Azul', 'Charlie Brown Jr', 'Melhores', 199));

  biblioteca.imprimirBiblioteca();

  print("Busca música pelo título:");
  var musicaPeloTitulo = biblioteca.buscarMusicaPeloTitulo('Pieces');
  musicaPeloTitulo.forEach((musica) => print(
      "${musica.nomeArtista} - ${musica.tituloMusica} - ${musica.duracaoSegundos} segundos - ${musica.nomeAlbum}"));

  print("Busca música pelo artista:");
  var musicaPeloArtista = biblioteca.buscarMusicaPeloArtista('CPM22');
  musicaPeloArtista.forEach((musica) => print(
      "${musica.nomeArtista} - ${musica.tituloMusica} - ${musica.duracaoSegundos} segundos - ${musica.nomeAlbum}"));

  print("Busca música pelo album:");
  var musicaPeloAlbum = biblioteca.buscarMusicaPeloAlbum('Novas');
  musicaPeloAlbum.forEach((musica) => print(
      "${musica.nomeArtista} - ${musica.tituloMusica} - ${musica.duracaoSegundos} segundos - ${musica.nomeAlbum}"));
}

class Musica {
  final String tituloMusica;
  final String nomeArtista;
  final String nomeAlbum;
  final int duracaoSegundos;

  Musica(this.tituloMusica, this.nomeArtista, this.nomeAlbum,
      this.duracaoSegundos);

  double duracaoHoras() => duracaoSegundos / 3600;
}

class BibliotecaDeMusicas {
  List<Musica> listaMusicas = [];

  void adicionarMusica(Musica musica) => listaMusicas.add(musica);

  void imprimirBiblioteca() {
    print('Lista de músicas:');
    listaMusicas.forEach((musica) {
      print(
          '${musica.tituloMusica} - ${musica.nomeArtista} - ${musica.nomeAlbum} (${musica.duracaoHoras().toStringAsFixed(2)} horas)');
    });
    print('Número de músicas: ${listaMusicas.length}');
    print(
        'Tempo total em horas: ${calcularTempoTotal().toStringAsFixed(2)} horas');
  }

  double calcularTempoTotal() {
    double tempoTotal = 0;
    for (var musica in listaMusicas) {
      tempoTotal += musica.duracaoHoras();
    }
    return tempoTotal;
  }

  List<Musica> buscarMusicaPeloTitulo(String titulo) {
    return listaMusicas
        .where((musica) =>
            musica.tituloMusica.toLowerCase() == titulo.toLowerCase())
        .toList();
  }

  List<Musica> buscarMusicaPeloArtista(String artista) {
    return listaMusicas
        .where((musica) =>
            musica.nomeArtista.toLowerCase() == artista.toLowerCase())
        .toList();
  }

  List<Musica> buscarMusicaPeloAlbum(String album) {
    return listaMusicas
        .where(
            (musica) => musica.nomeAlbum.toLowerCase() == album.toLowerCase())
        .toList();
  }
}
