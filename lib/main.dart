import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pedido_facil/core/api.dart';
import 'package:pedido_facil/core/socket.dart';
import 'package:pedido_facil/features/login/controller/login_controller.dart';
import 'package:pedido_facil/features/login/view/login_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env"); // <-- Carrega o arquivo .env aqui

  final apiService = ApiService();
  final socketService = SocketService();
  socketService.connect();

  runApp(MyApp(
    controller: LoginController(apiService, socketService),
  ));
}

class MyApp extends StatelessWidget {
  final LoginController controller;
  const MyApp({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(controller: controller),
    );
  }
}
