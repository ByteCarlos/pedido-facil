import 'package:pedido_facil/core/api.dart';
import 'package:pedido_facil/core/socket.dart';

class LoginController {
  final ApiService apiService;
  final SocketService socketService;

  LoginController(this.apiService, this.socketService);

  void testarApiESocket() async {
    final data = await apiService.get('/users');
    print('Dados da API: $data');

    socketService.sendMessage('mensagem', {'text': 'Oi, socket!'});
  }

  void login() async {
    return;
  }
}
