import 'package:flutter/material.dart';

import '../data/mock_data.dart';

class IdososScreen extends StatelessWidget {
  const IdososScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Idosos')),
      body: ListView.builder(
        itemCount: idososMock.length,
        itemBuilder: (context, i) {
          final idoso = idososMock[i];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
            child: ListTile(
              leading: const CircleAvatar(child: Icon(Icons.person)),
              title: Text(idoso.nome),
              subtitle: Text('${idoso.idade} anos · ${idoso.dispositivo}'),
              trailing: const Icon(Icons.chevron_right),
              // passagem de parâmetro: o objeto Idoso vai como argumento da rota
              onTap: () => Navigator.pushNamed(context, '/idoso', arguments: idoso),
            ),
          );
        },
      ),
    );
  }
}
