import 'dart:io';
import 'dart:convert';
import 'dart:async';
void main() async {
  const porta = 3000;

  try {
    var servidor = await ServerSocket.bind(InternetAddress.loopbackIPv4, porta);
    print('[Terminal A] Iniciado! \nAgora abra o OUTRO terminal e rode este mesmo arquivo...');

    servidor.listen((Socket cliente) async {
      print('\n[Terminal A] O Terminal B conectou! Iniciando chat automático...\n');

      cliente.cast<List<int>>().transform(utf8.decoder).listen(
        (msg) => print('Terminal B diz: $msg'),
      );

      var mensagens = ['Oi, tudo bem?', 'Como está o Pair Programming?', 'Dart é muito daora!'];
      
      for (var msg in mensagens) {
        await Future.delayed(Duration(seconds: 2));
        print('Enviando: $msg');
        cliente.write(msg);
      }
    });

  } catch (e) {
    print('[Terminal B] Detectado que o Terminal A já está rodando. Conectando...');

    try {
      var cliente = await Socket.connect(InternetAddress.loopbackIPv4, porta);
      print('[Terminal B] Conectado com sucesso ao Terminal A!\n');

      cliente.cast<List<int>>().transform(utf8.decoder).listen(
        (msg) => print('Terminal A diz: $msg'),
      );
      
      var respostas = ['Tudo ótimo!', 'Estamos quase terminando a lista.', 'Com certeza! As streams facilitam muito.'];
      
      for (var msg in respostas) {
        await Future.delayed(Duration(seconds: 3)); 
        print('Enviando: $msg');
        cliente.write(msg);
      }

    } catch (erro) {
      print('Erro inesperado: $erro');
    }
  }
}