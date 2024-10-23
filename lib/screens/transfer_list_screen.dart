import 'package:flutter/material.dart';

class TransferListScreen extends StatelessWidget {
  const TransferListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transferencia a terceros'),
        backgroundColor: const Color(0xFFFF6B00),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Buscar',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                suffixIcon: const Icon(Icons.more_vert),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.grey[100],
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Mantén tu agenda al día',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Sincroniza tus contantos y transfiere más rápido',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: const BoxDecoration(
                    color: Color(0xFF4051B5),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.sync,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Mis contactos',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          _ContactListItem(
            initial: 'AB',
            name: 'Abraham Bernabe Munoz',
            subtitle: 'Abraham',
            bank: 'BancoEstado',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFF4051B5),
        child: const Icon(Icons.person_add),
      ),
    );
  }
}

class _ContactListItem extends StatelessWidget {
  final String initial;
  final String name;
  final String subtitle;
  final String bank;

  const _ContactListItem({
    required this.initial,
    required this.name,
    required this.subtitle,
    required this.bank,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.grey[200],
        child: Text(
          initial,
          style: const TextStyle(
            color: Colors.black54,
          ),
        ),
      ),
      title: Text(name),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(subtitle),
          Text(bank),
        ],
      ),
      trailing: Image.asset(
        'assets/images/banco_estado_icon.png',
        width: 24,
      ),
    );
  }
}