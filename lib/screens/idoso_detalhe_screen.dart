import 'package:flutter/material.dart';

import '../data/app_state.dart';
import '../models/idoso.dart';
import '../widgets/evento_card.dart';

class IdosoDetalheScreen extends StatefulWidget {
  const IdosoDetalheScreen({super.key});

  @override
  State<IdosoDetalheScreen> createState() => _IdosoDetalheScreenState();
}

class _IdosoDetalheScreenState extends State<IdosoDetalheScreen> {
  bool mostrarContato = false;

  @override
  Widget build(BuildContext context) {
    final idoso = ModalRoute.of(context)!.settings.arguments as Idoso;
    final eventos = eventosApp.where((e) => e.idosoId == idoso.id).toList();
    return Scaffold(
      appBar: AppBar(title: Text(idoso.nome)),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          await Navigator.pushNamed(context, '/novo-evento', arguments: idoso);
          setState(() {});
        },
        icon: const Icon(Icons.add_alert),
        label: const Text('Registrar evento'),
      ),
      body: ListView(
        padding: const EdgeInsets.only(bottom: 90),
        children: [
          Card(
            margin: const EdgeInsets.all(12),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${idoso.idade} anos', style: const TextStyle(fontSize: 18)),
                  const SizedBox(height: 4),
                  Text('Dispositivo: ${idoso.dispositivo}'),
                  const SizedBox(height: 4),
                  Text('Cuidador: ${idoso.cuidador}'),
                  // estado: exibir ou ocultar informação
                  if (mostrarContato) Text('Telefone: ${idoso.telefoneCuidador}'),
                  TextButton.icon(
                    onPressed: () => setState(() => mostrarContato = !mostrarContato),
                    icon: Icon(mostrarContato ? Icons.visibility_off : Icons.visibility),
                    label: Text(mostrarContato ? 'Ocultar contato' : 'Mostrar contato'),
                  ),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text('Histórico de eventos', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          if (eventos.isEmpty)
            const Padding(padding: EdgeInsets.all(16), child: Text('Nenhum evento registrado.')),
          for (final e in eventos) EventoCard(evento: e, nomeIdoso: idoso.nome),
        ],
      ),
    );
  }
}
