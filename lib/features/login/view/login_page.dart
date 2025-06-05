import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _forgotPassword() async {
    Navigator.pushReplacementNamed(context, '/forgot_password_1');
  }

  void _handleLogin() async {
    Navigator.pushReplacementNamed(context, '/home');
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
                Image.asset('assets/images/logo.png', width: 180, height: 180),
                const SizedBox(height: 30),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // CAMPO E-MAIL
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          hintText: 'E-mail',
                          prefixIcon: const Icon(Icons.email),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, insira um e-mail válido!';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),

                      // CAMPO SENHA
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Senha',
                          prefixIcon: const Icon(Icons.lock),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Digite sua senha';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 2),

                      // BOTÃO ESQUECI SENHA
                      Align(
                        alignment: Alignment.centerLeft,
                        child: TextButton(
                          onPressed: _forgotPassword,
                          child: const Text(
                            'Esqueci minha senha',
                            style: TextStyle(
                              color: Color(0xFF3E3E3E),
                              fontWeight: FontWeight.w300
                            ),
                          ),
                        ),
                      ),


                      // BOTÃO ENTRAR
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _handleLogin,
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
                    ],
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
