import 'package:pedido_facil/core/api.dart';
import 'package:pedido_facil/core/socket.dart';
import 'dart:convert';

class LoginController {
  final ApiService apiService;
  final SocketService socketService;

  LoginController(this.apiService, this.socketService);

  void testarApiESocket() async {
    final data = await apiService.get('/users');

    socketService.sendMessage('mensagem', {'text': 'Oi, socket!'});
  }

  Future<dynamic> login(String email, String password) async {
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('$email:$password'));

    try {
      final data = await apiService.get(
        '/users/login',
        headers: {
          'Authorization': basicAuth,
        },
      );
      return data;
    } catch (e) {
      print('Erro no login: $e');
      return null;
    }
  }
}
