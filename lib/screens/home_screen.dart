import 'package:flutter/material.dart';
import 'package:banco_estado/screens/transfer_list_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _showTransferMenu = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      const Color(0xFFFF6B00),
                      const Color(0xFFFF6B00).withOpacity(0.8),
                    ],
                  ),
                ),
                child: SafeArea(
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/banco_estado_logo.png',
                        height: 30,
                      ),
                      const Spacer(),
                      const Icon(Icons.notifications_outlined, color: Colors.white),
                      const SizedBox(width: 16),
                      const CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(Icons.person_outline),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    _AccountCard(),
                    const SizedBox(height: 16),
                    _PromotionalCard(),
                    const SizedBox(height: 16),
                    const Text(
                      'Tus tarjetas',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _DebitCard(),
                    const SizedBox(height: 24),
                    const Text(
                      '¿Qué necesitas?',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _QuickActionsGrid(),
                  ],
                ),
              ),
            ],
          ),
          if (_showTransferMenu)
            GestureDetector(
              onTap: () => setState(() => _showTransferMenu = false),
              child: Container(
                color: Colors.black54,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(16),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Transferir',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.close),
                                onPressed: () => setState(() => _showTransferMenu = false),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          ListTile(
                            leading: const Icon(Icons.people_outline),
                            title: const Text('A terceros'),
                            trailing: const Icon(Icons.chevron_right),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const TransferListScreen(),
                                ),
                              );
                            },
                          ),
                          ListTile(
                            leading: const Icon(Icons.compare_arrows),
                            title: const Text('Entre mis cuentas'),
                            trailing: const Icon(Icons.chevron_right),
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
              onTap: () => setState(() => _showTransferMenu = true),
              child: const Icon(Icons.compare_arrows),
            ),
            label: 'Transferir',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.lock_outline),
            label: 'Seguridad',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.grid_view),
            label: 'Más',
          ),
        ],
      ),
    );
  }
}

class _AccountCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text(
                  'CuentaRUT',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  '0002066958',
                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                ),
                const Spacer(),
                const Icon(Icons.share),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              '\$37.379',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Saldo disponible',
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Implement remaining widget classes (_PromotionalCard, _DebitCard, _QuickActionsGrid)
// following the same pattern and matching the design from the images