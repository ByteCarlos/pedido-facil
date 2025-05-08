// lib/core/socket_service.dart
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class SocketService {
  late IO.Socket socket;

  void connect() {
    socket = IO.io(dotenv.env['API_URL'] ?? '', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });

    socket.connect();

    socket.onConnect((_) {
      print('🔌 Conectado ao socket');
    });

    socket.onDisconnect((_) {
      print('❌ Desconectado do socket');
    });

    socket.on('mensagem', (data) {
      print('📩 Nova mensagem: $data');
    });
  }

  void sendMessage(String evento, dynamic payload) {
    socket.emit(evento, payload);
  }

  void disconnect() {
    socket.disconnect();
  }
}
