import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pedido_facil/core/api.dart';
import 'package:pedido_facil/core/socket.dart';
import 'package:pedido_facil/features/forgotpassword/forgot_pass_1.dart';
import 'package:pedido_facil/features/forgotpassword/forgot_pass_2.dart';
import 'package:pedido_facil/features/forgotpassword/forgot_pass_3.dart';
import 'package:pedido_facil/features/login/controller/login_controller.dart';
import 'package:pedido_facil/features/login/view/login_page.dart';
import 'package:pedido_facil/features/home/home_page.dart';
import 'package:pedido_facil/features/signup/signup_1.dart';
import 'package:pedido_facil/features/signup/signup_2.dart';
import 'package:pedido_facil/features/signup/signup_3.dart';
import 'package:pedido_facil/features/signup/signup_4.dart';
import 'package:pedido_facil/features/welcome/welcome.dart';

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
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const Welcome(),
        '/login': (context) => LoginPage(controller: controller),
        '/home': (context) => const HomePage(),
        '/signup_1': (context) => const Signup1(),
        '/signup_2': (context) => const Signup2(),
        '/signup_3': (context) => const Signup3(),
        '/signup_4': (context) => const Signup4(),
        '/forgot_password_1': (context) => const ForgotPass1(),
        '/forgot_password_2': (context) => const ForgotPass2(),
        '/forgot_password_3': (context) => const ForgotPass3(),
      },
    );
  }
}
