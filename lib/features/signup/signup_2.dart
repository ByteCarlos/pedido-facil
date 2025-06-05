import 'package:flutter/material.dart';

class Signup2 extends StatelessWidget {
  const Signup2({super.key});

  void _back(BuildContext context) async {
    Navigator.pushReplacementNamed((context), '/signup_1');
  }

  void _next(BuildContext context) async {
    Navigator.pushReplacementNamed((context), '/signup_3');
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
                'Insira os dados\ndo seu estabelecimento',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3E3E3E),
                ),
              ),
              const SizedBox(height: 32),

              // Nome Completo
              const Text(
                'Nome Fantasia',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              TextFormField(
                initialValue: 'Loja Teste',
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
                'CNPJ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              TextFormField(
                initialValue: '98.032.894/0001-04',
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
                'ID IFood',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              TextFormField(
                initialValue: '00000020f51bb4362eee2a4d',
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
