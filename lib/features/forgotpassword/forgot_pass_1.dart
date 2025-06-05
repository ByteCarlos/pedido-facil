import 'package:flutter/material.dart';

class ForgotPass1 extends StatelessWidget {
  const ForgotPass1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Esqueci minha senha")),
      body: const Center(child: Text("Bem-vindo ao esqueci minha senha!")),
    );
  }
}
