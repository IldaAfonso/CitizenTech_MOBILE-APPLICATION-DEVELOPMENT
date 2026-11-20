import 'package:flutter/material.dart';

import '../data/app_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final pendentes = eventosApp.where((e) => e.status == 'PENDENTE').length;
    return Scaffold(
      appBar: AppBar(title: const Text('CitizenTech')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Image.asset(
                    'assets/logo.png',
                    width: 56,
                    height: 56,
                    errorBuilder: (context, error, stack) =>
                        const Icon(Icons.health_and_safety, size: 56, color: Color(0xFF1565C0)),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Olá, cuidador!', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                        SizedBox(height: 4),
                        Text('Acompanhe quem você cuida, com segurança em casa.'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Card(
              color: pendentes > 0 ? Colors.red.shade50 : Colors.green.shade50,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Icon(pendentes > 0 ? Icons.notifications_active : Icons.check_circle,
                        size: 40, color: pendentes > 0 ? Colors.red : Colors.green),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        pendentes > 0 ? 'Alertas pendentes: $pendentes' : 'Nenhum alerta pendente',
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                children: [
                  _atalho(context, Icons.elderly, 'Idosos', '/idosos'),
                  _atalho(context, Icons.notifications, 'Alertas', '/eventos'),
                  _atalho(context, Icons.add_alert, 'Registrar evento', '/novo-evento'),
                  _atalho(context, Icons.info_outline, 'Sobre', '/sobre'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _atalho(BuildContext context, IconData icone, String texto, String rota) {
    return Card(
      child: InkWell(
        // await + setState: ao voltar, o contador de pendentes é atualizado
        onTap: () async {
          await Navigator.pushNamed(context, rota);
          setState(() {});
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icone, size: 48, color: Theme.of(context).colorScheme.primary),
            const SizedBox(height: 8),
            Text(texto, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }
}
