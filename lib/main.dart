import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pedido_facil/core/api.dart';
import 'package:pedido_facil/core/socket.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final apiService = ApiService();
  final socketService = SocketService();

  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    socketService.connect();

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Exemplo API + Socket')),
        body: Center(
          child: ElevatedButton(
            onPressed: () async {
              final data = await apiService.get('/users');
              print('Dados da API: $data');

              socketService.sendMessage('mensagem', {'text': 'Oi, socket!'});
            },
            child: const Text('Testar API e Socket'),
          ),
        ),
      ),
    );
  }
}
