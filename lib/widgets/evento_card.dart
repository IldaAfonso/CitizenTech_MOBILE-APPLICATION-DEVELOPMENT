import 'package:flutter/material.dart';

import '../models/evento.dart';

Color corGravidade(String g) {
  switch (g) {
    case 'CRITICA':
      return Colors.red.shade700;
    case 'ALTA':
      return Colors.orange.shade800;
    case 'MEDIA':
      return Colors.amber.shade800;
    default:
      return Colors.green.shade700;
  }
}

class EventoCard extends StatelessWidget {
  final Evento evento;
  final String nomeIdoso;
  final VoidCallback? onTap;

  const EventoCard({super.key, required this.evento, required this.nomeIdoso, this.onTap});

  @override
  Widget build(BuildContext context) {
    final cor = corGravidade(evento.gravidade);
    final resolvido = evento.status == 'RESOLVIDO';
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      child: ListTile(
        onTap: onTap,
        leading: CircleAvatar(
          backgroundColor: cor,
          child: Icon(resolvido ? Icons.check : Icons.warning_amber, color: Colors.white),
        ),
        title: Text(evento.titulo),
        subtitle: Text('$nomeIdoso · ${evento.quando}\nGravidade: ${evento.gravidade}'),
        isThreeLine: true,
        trailing: Text(
          evento.status,
          style: TextStyle(color: resolvido ? Colors.green.shade700 : cor, fontWeight: FontWeight.bold, fontSize: 12),
        ),
      ),
    );
  }
}
