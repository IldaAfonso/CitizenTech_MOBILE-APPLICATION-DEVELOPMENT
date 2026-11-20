import 'package:flutter/material.dart';

import '../data/app_state.dart';
import '../data/mock_data.dart';
import '../models/evento.dart';
import '../models/idoso.dart';

class NovoEventoScreen extends StatefulWidget {
  const NovoEventoScreen({super.key});

  @override
  State<NovoEventoScreen> createState() => _NovoEventoScreenState();
}

class _NovoEventoScreenState extends State<NovoEventoScreen> {
  final _formKey = GlobalKey<FormState>();
  final _obsController = TextEditingController();
  final _horaController = TextEditingController();
  int? _idosoId;
  String? _tipo;
  bool _iniciado = false;

  static const tipos = {
    'BOTAO_EMERGENCIA': 'Botão de emergência',
    'MEDICAMENTO_TOMADO': 'Remédio tomado',
    'MEDICAMENTO_NAO_TOMADO': 'Remédio não tomado',
    'SEM_MOVIMENTO': 'Sem movimento',
  };

  @override
  void dispose() {
    _obsController.dispose();
    _horaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // se veio da tela de detalhe, o idoso já vem selecionado
    if (!_iniciado) {
      final arg = ModalRoute.of(context)?.settings.arguments;
      if (arg is Idoso) _idosoId = arg.id;
      _iniciado = true;
    }
    return Scaffold(
      appBar: AppBar(title: const Text('Registrar evento')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const Text('Use quando o dispositivo falhar ou para um registro manual.'),
            const SizedBox(height: 16),
            DropdownButtonFormField<int>(
              value: _idosoId,
              decoration: const InputDecoration(labelText: 'Idoso', border: OutlineInputBorder()),
              items: [for (final i in idososMock) DropdownMenuItem(value: i.id, child: Text(i.nome))],
              onChanged: (v) => setState(() => _idosoId = v),
              validator: (v) => v == null ? 'Escolha o idoso' : null,
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: _tipo,
              decoration: const InputDecoration(labelText: 'Tipo de evento', border: OutlineInputBorder()),
              items: [for (final t in tipos.entries) DropdownMenuItem(value: t.key, child: Text(t.value))],
              onChanged: (v) => setState(() => _tipo = v),
              validator: (v) => v == null ? 'Escolha o tipo do evento' : null,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _horaController,
              keyboardType: TextInputType.datetime,
              decoration: const InputDecoration(labelText: 'Horário (HH:MM)', border: OutlineInputBorder()),
              validator: (v) {
                final texto = (v ?? '').trim();
                if (texto.isEmpty) return 'Informe o horário';
                if (!RegExp(r'^([01]\d|2[0-3]):[0-5]\d$').hasMatch(texto)) {
                  return 'Use o formato HH:MM (ex.: 08:30)';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _obsController,
              maxLines: 3,
              decoration: const InputDecoration(labelText: 'Observação', border: OutlineInputBorder()),
              validator: (v) {
                final texto = (v ?? '').trim();
                if (texto.length < 5) return 'Escreva pelo menos 5 caracteres';
                return null;
              },
            ),
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: _salvar,
              icon: const Icon(Icons.save),
              label: const Text('Salvar evento'),
            ),
          ],
        ),
      ),
    );
  }

  void _salvar() {
    if (!_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: const Text('Corrija os campos destacados.'), backgroundColor: Colors.red.shade700),
      );
      return;
    }
    final evento = Evento(
      id: proximoIdEvento(),
      idosoId: _idosoId!,
      tipo: _tipo!,
      status: _tipo == 'MEDICAMENTO_TOMADO' ? 'RESOLVIDO' : 'PENDENTE',
      quando: 'Hoje ${_horaController.text.trim()}',
      observacao: _obsController.text.trim(),
    );
    eventosApp.insert(0, evento);
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Evento registrado'),
        content: Text('${evento.titulo} - gravidade ${evento.gravidade}.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(ctx); // fecha o diálogo
              Navigator.pop(context); // volta para a tela anterior
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
