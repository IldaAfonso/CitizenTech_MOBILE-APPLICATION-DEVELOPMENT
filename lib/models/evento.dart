class Evento {
  final int id;
  final int idosoId;
  final String tipo;
  String status; // PENDENTE ou RESOLVIDO
  final String quando;
  final String observacao;

  Evento({
    required this.id,
    required this.idosoId,
    required this.tipo,
    required this.status,
    required this.quando,
    this.observacao = '',
  });

  String get gravidade {
    switch (tipo) {
      case 'BOTAO_EMERGENCIA':
        return 'CRITICA';
      case 'SEM_MOVIMENTO':
        return 'ALTA';
      case 'MEDICAMENTO_NAO_TOMADO':
        return 'MEDIA';
      default:
        return 'BAIXA';
    }
  }

  String get titulo {
    switch (tipo) {
      case 'BOTAO_EMERGENCIA':
        return 'Botão de emergência';
      case 'SEM_MOVIMENTO':
        return 'Sem movimento';
      case 'MEDICAMENTO_NAO_TOMADO':
        return 'Remédio não tomado';
      case 'MEDICAMENTO_TOMADO':
        return 'Remédio tomado';
      default:
        return tipo;
    }
  }
}
