late String statusSistema;

void main() {
  statusSistema = 'Inicializado';

  String? ultimaMensagem = null;

  print(ultimaMensagem?.length); 

  var valor = ultimaMensagem ?? 'Nenhuma mensagem nova';
  print(valor);

  ultimaMensagem = 'Tudo funcionando!';
  print(ultimaMensagem!.length);
}