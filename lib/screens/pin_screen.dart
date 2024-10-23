import 'package:flutter/material.dart';
import 'package:banco_estado/screens/home_screen.dart';

class PinScreen extends StatefulWidget {
  const PinScreen({super.key});

  @override
  State<PinScreen> createState() => _PinScreenState();
}

class _PinScreenState extends State<PinScreen> {
  final List<String> _pin = ['', '', '', ''];
  int _currentIndex = 0;

  void _addNumber(String number) {
    if (_currentIndex < 4) {
      setState(() {
        _pin[_currentIndex] = number;
        _currentIndex++;
      });

      if (_currentIndex == 4) {
        Future.delayed(const Duration(milliseconds: 500), () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 40),
          const Icon(
            Icons.lock_outline,
            size: 48,
            color: Color(0xFF4051B5),
          ),
          const SizedBox(height: 24),
          const Text(
            'Ingresa tu clave',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(4, (index) {
              return Container(
                width: 50,
                height: 50,
                margin: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey.shade300,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: _pin[index].isNotEmpty
                    ? const Icon(Icons.circle, size: 16)
                    : null,
                ),
              );
            }),
          ),
          const SizedBox(height: 24),
          TextButton(
            onPressed: () {},
            child: const Text(
              '¿Problemas con tu clave?',
              style: TextStyle(
                color: Color(0xFF4051B5),
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}