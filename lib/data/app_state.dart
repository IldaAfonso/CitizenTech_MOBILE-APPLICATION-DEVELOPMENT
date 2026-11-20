import '../models/evento.dart';
import 'mock_data.dart';

// Lista única de eventos em memória, compartilhada pelas telas.
// As telas chamam setState() depois de alterar esta lista.
final List<Evento> eventosApp = criarEventosMock();

int proximoIdEvento() => eventosApp.length + 1;
