import '../models/evento.dart';
import '../models/idoso.dart';

// Dados mockados (a integração com a API não é exigida nesta entrega).
const List<Idoso> idososMock = [
  Idoso(id: 1, nome: 'Maria Aparecida', idade: 82, dispositivo: 'ESP32-0001', cuidador: 'Carla (filha)', telefoneCuidador: '(11) 98888-0001'),
  Idoso(id: 2, nome: 'José Carlos', idade: 76, dispositivo: 'ESP32-0002', cuidador: 'Paulo (filho)', telefoneCuidador: '(11) 97777-0002'),
  Idoso(id: 3, nome: 'Benedito Ferreira', idade: 88, dispositivo: 'ESP32-0004', cuidador: 'Ana (vizinha)', telefoneCuidador: '(11) 96666-0003'),
  Idoso(id: 4, nome: 'Helena Souza', idade: 79, dispositivo: 'ESP32-0005', cuidador: 'Carla (filha)', telefoneCuidador: '(11) 98888-0001'),
];

List<Evento> criarEventosMock() => [
      Evento(id: 1, idosoId: 3, tipo: 'BOTAO_EMERGENCIA', status: 'PENDENTE', quando: 'Hoje 08:12', observacao: 'Botão pressionado na sala'),
      Evento(id: 2, idosoId: 1, tipo: 'MEDICAMENTO_NAO_TOMADO', status: 'PENDENTE', quando: 'Hoje 08:30', observacao: 'Losartana 08:00'),
      Evento(id: 3, idosoId: 2, tipo: 'SEM_MOVIMENTO', status: 'PENDENTE', quando: 'Hoje 09:40', observacao: 'Mais de 6 horas sem movimento'),
      Evento(id: 4, idosoId: 4, tipo: 'MEDICAMENTO_TOMADO', status: 'RESOLVIDO', quando: 'Ontem 20:05', observacao: 'Caixa aberta no horário'),
      Evento(id: 5, idosoId: 1, tipo: 'MEDICAMENTO_TOMADO', status: 'RESOLVIDO', quando: 'Ontem 08:02'),
    ];
