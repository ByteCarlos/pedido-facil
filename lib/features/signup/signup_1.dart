import 'package:flutter/material.dart';

class Signup1 extends StatelessWidget {
  const Signup1({super.key});

  void _back(BuildContext context) async {
    Navigator.pushReplacementNamed((context), '/');
  }

  void _next(BuildContext context) async {
    Navigator.pushReplacementNamed((context), '/signup_2');
  }

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: const Color(0xFFF1F4F6),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF1F4F6),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF3E3E3E)),
          onPressed: () => _back(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Vamos começar\nconhecendo você',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3E3E3E),
                ),
              ),
              const SizedBox(height: 32),

              // Nome Completo
              const Text(
                'Nome Completo',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              TextFormField(
                initialValue: 'Lojista Teste',
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xFFE3E4E5),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                ),
              ),
              const SizedBox(height: 24),

              // Telefone
              const Text(
                'Telefone',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              TextFormField(
                initialValue: '(79) 9 9988-0011',
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xFFE3E4E5),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                ),
              ),
              const SizedBox(height: 24),

              // CPF
              const Text(
                'CPF',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              TextFormField(
                initialValue: '982.580.280-49',
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xFFE3E4E5),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                ),
              ),
              const Spacer(),

              // Botão Avançar
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _next(context);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: const Color(0xFFEA1D2C),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Avançar',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
