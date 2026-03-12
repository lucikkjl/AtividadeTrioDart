class ItemBiblioteca {
  String titulo;
  int ano;

  ItemBiblioteca(this.titulo, this.ano);
}

class Livro extends ItemBiblioteca {
  String autor;
  bool disponivel = true;

  Livro(String titulo, int ano, this.autor) : super(titulo, ano);

  void verLivro() {
    print('Livro: $titulo, Autor: $autor, Ano: $ano, Disponível: $disponivel');
  }

  void emprestar() {
    if (disponivel) {
      disponivel = false;
      print('O livro "$titulo" foi emprestado.');
    } else {
      print('O livro "$titulo" não está disponível.');
    }
  }

  void devolver() {
    if (!disponivel) {
      disponivel = true;
      print('O livro "$titulo" foi devolvido.');
    } else {
      print('O livro "$titulo" já está disponível na biblioteca.');
    }
  }
}

class Biblioteca {
  List<Livro> livros = [];

  void registrarLivro(Livro livro) {
    livros.add(livro);
    print('Livro "${livro.titulo}" registrado na biblioteca.');
  }

  void listarLivros() {
    print('\nLista de livros:');
    for (var livro in livros) {
      livro.verLivro();
    }
  }
}

void main() {
  var biblioteca = Biblioteca();

  var livro1 = Livro('O Senhor dos Anéis', 1954, 'J.R.R. Tolkien');
  var livro2 = Livro('1984', 1949, 'George Orwell');

  biblioteca.registrarLivro(livro1);
  biblioteca.registrarLivro(livro2);

  biblioteca.listarLivros();

  livro1.emprestar();

  biblioteca.listarLivros();

  livro1.devolver();

  biblioteca.listarLivros();
}