import 'package:flutter/material.dart';

class SobreScreen extends StatelessWidget {
  const SobreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sobre')),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.health_and_safety, size: 64, color: Color(0xFF1565C0)),
            SizedBox(height: 12),
            Text('CitizenTech - Idoso em casa com mais segurança',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 12),
            Text('Um dispositivo na casa do idoso (botão de emergência, caixa de remédios e sensor de movimento) '
                'envia alertas. Este app mostra os alertas ao cuidador para que ele aja rápido.'),
            SizedBox(height: 12),
            Text('ODS 3 (Saúde e bem-estar) e ODS 10 (Redução das desigualdades).'),
            SizedBox(height: 12),
            Text('Versão 1.0 - dados de demonstração (mockados).'),
          ],
        ),
      ),
    );
  }
}
