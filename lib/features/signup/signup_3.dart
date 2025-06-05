import 'package:flutter/material.dart';

class Signup3 extends StatelessWidget {
  const Signup3({super.key});

  void _back(BuildContext context) async {
    Navigator.pushReplacementNamed((context), '/signup_2');
  }

  void _next(BuildContext context) async {
    Navigator.pushReplacementNamed((context), '/signup_4');
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
                'Qual o endereço do\nseu estabelecimento?',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3E3E3E),
                ),
              ),
              const SizedBox(height: 32),

              // CEP
              const Text('CEP', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              TextFormField(
                initialValue: '49001-365',
                decoration: _fieldDecoration(),
              ),
              const SizedBox(height: 24),

              // Rua
              const Text('Rua', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              TextFormField(
                initialValue: 'Rua João Alves',
                decoration: _fieldDecoration(),
              ),
              const SizedBox(height: 24),

              // Bairro e Número (linha dupla)
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Bairro', style: TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 8),
                        TextFormField(
                          initialValue: 'João Alves',
                          decoration: _fieldDecoration(),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Nº', style: TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 8),
                        TextFormField(
                          initialValue: '178',
                          decoration: _fieldDecoration(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const Spacer(),

              // Botão Avançar
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Avançar
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

  InputDecoration _fieldDecoration() {
    return const InputDecoration(
      filled: true,
      fillColor: Color(0xFFE3E4E5),
      border: InputBorder.none,
      contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
    );
  }
}
