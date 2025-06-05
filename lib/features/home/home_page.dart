import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Widget buildOrderCard({
    required String status,
    required String orderId,
    required String customer,
    required String time,
    required String buttonText,
    required Color buttonColor,
    Widget? timer,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text('#$orderId', style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(width: 8),
                Text('Pedido $customer'),
                const Spacer(),
                if (timer != null) timer,
              ],
            ),
            const SizedBox(height: 4),
            Text(
              status == 'Pendente' ? 'Aceite até $time' : 'Entregue até $time',
              style: const TextStyle(color: Colors.black54, fontSize: 13),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: buttonColor,
                minimumSize: const Size(double.infinity, 40),
              ),
              child: Text(buttonText),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSection(String title, List<Widget> orders) {
    return ExpansionTile(
      title: Row(
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(width: 6),
          Container(
            padding: const EdgeInsets.all(4),
            decoration: const BoxDecoration(
              color: Colors.black12,
              shape: BoxShape.circle,
            ),
            child: Text(
              orders.length.toString(),
              style: const TextStyle(fontSize: 12),
            ),
          ),
        ],
      ),
      children: orders,
      initiallyExpanded: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: const Color(0xF1F4F7FF),
        elevation: 0,
        title: Row(
          children: const [
            Icon(Icons.storefront, color: Colors.grey),
            SizedBox(width: 8),
            Text('Teste - Loja Teste', style: TextStyle(fontSize: 16)),
            Spacer(),
            Icon(Icons.arrow_drop_down, color: Colors.grey),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Row(
              children: const [
                Icon(Icons.circle, color: Colors.green, size: 10),
                SizedBox(width: 4),
                Text('Loja aberta', style: TextStyle(color: Colors.green)),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Aceite automático de pedidos',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Switch(value: false, onChanged: (_) {}),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: const [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Buscar pedido',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(),
                      isDense: true,
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Icon(Icons.filter_list),
              ],
            ),
            const SizedBox(height: 16),
            // Seção Pendente
            buildSection("Pendente", [
              buildOrderCard(
                status: 'Pendente',
                orderId: '7988',
                customer: 'J.',
                time: '15:20',
                buttonText: 'Aceitar pedido',
                buttonColor: Colors.red,
                timer: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.red.shade700,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Text(
                    '5 min',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ]),
            // Seção Em preparo
            buildSection("Em preparo", [
              buildOrderCard(
                status: 'Em preparo',
                orderId: '7988',
                customer: 'J.',
                time: '18:35',
                buttonText: 'Despachar pedido',
                buttonColor: Colors.green,
              ),
            ]),
            // Seção Saiu para entrega
            buildSection("Saiu para entrega", []),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Início'),
          BottomNavigationBarItem(icon: Icon(Icons.attach_money), label: 'Extrato'),
          BottomNavigationBarItem(icon: Icon(Icons.help_outline), label: 'Ajuda'),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: 'Mais'),
        ],
      ),
    );
  }
}
