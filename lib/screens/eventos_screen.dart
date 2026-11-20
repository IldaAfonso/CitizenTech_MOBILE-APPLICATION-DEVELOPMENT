import 'package:flutter/material.dart';

import '../data/app_state.dart';
import '../data/mock_data.dart';
import '../models/evento.dart';
import '../widgets/evento_card.dart';

class EventosScreen extends StatefulWidget {
  const EventosScreen({super.key});

  @override
  State<EventosScreen> createState() => _EventosScreenState();
}

class _EventosScreenState extends State<EventosScreen> {
  bool somentePendentes = true;

  String _nome(int id) => idososMock.firstWhere((i) => i.id == id).nome;

  @override
  Widget build(BuildContext context) {
    final lista = eventosApp.where((e) => !somentePendentes || e.status == 'PENDENTE').toList();
    return Scaffold(
      appBar: AppBar(title: const Text('Alertas')),
      body: Column(
        children: [
          SwitchListTile(
            title: const Text('Mostrar só pendentes'),
            value: somentePendentes,
            onChanged: (v) => setState(() => somentePendentes = v),
          ),
          Text('Itens na lista: ${lista.length}'),
          Expanded(
            child: lista.isEmpty
                ? const Center(child: Text('Nenhum alerta para mostrar.'))
                : ListView(
                    children: [
                      for (final e in lista)
                        EventoCard(
                          evento: e,
                          nomeIdoso: _nome(e.idosoId),
                          onTap: e.status == 'PENDENTE' ? () => _confirmarResolver(e) : null,
                        ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }

  void _confirmarResolver(Evento e) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Marcar como resolvido?'),
        content: Text('${e.titulo} - ${_nome(e.idosoId)}'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancelar')),
          FilledButton(
            onPressed: () {
              setState(() => e.status = 'RESOLVIDO');
              Navigator.pop(ctx);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Alerta marcado como resolvido.')),
              );
            },
            child: const Text('Resolver'),
          ),
        ],
      ),
    );
  }
}
