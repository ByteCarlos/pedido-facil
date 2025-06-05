import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  void _login(BuildContext context) async {
    Navigator.pushReplacementNamed((context), '/login');
  }

  void _signUp(BuildContext context) async {
    Navigator.pushReplacementNamed((context), '/signup_1');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/logo.png', width: 220, height: 220),
                const SizedBox(height: 30),
                Container(
                  margin: const EdgeInsets.only(bottom: 20, right: 80),
                  child: Text("Bem-vindo ao Gestor de Pedidos",
                    style: TextStyle(fontSize: 20, color: Color(0xFF3E3E3E), fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => () => _login(context),
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        backgroundColor: const Color(0xFFEA1D2C)
                    ),
                    child: const Text(
                      "Entrar",
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => _signUp(context),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                          side: const BorderSide(color: Color(0xFFEA1D2C), width: 2),
                        ),
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        elevation: 0,
                      ),
                      child: const Text(
                        "Cadastrar",
                        style: TextStyle(fontSize: 24, color: Color(0xFFEA1D2C)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
