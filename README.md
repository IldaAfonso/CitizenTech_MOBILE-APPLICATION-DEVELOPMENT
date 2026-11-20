# CitizenTech - App do cuidador
**Global Solution 2026/2 · FIAP · Mobile Application Development (Flutter)**

## Integrantes
| Nome | RM | Turma |
|------|----|-------|
| Ilda Afonso | 568233 | 2TDS |

## Solução
**Idoso em casa com mais segurança.** Um dispositivo (Arduino/ESP32) na casa do idoso tem botão de emergência, sensor na caixa de remédios e sensor de movimento. Cada ocorrência vira um evento. Este app é a visão do **cuidador** (familiar, profissional ou vizinho): ele vê os alertas, a gravidade, o histórico de cada idoso e registra eventos manualmente.

- **Cidadão beneficiado:** idosos que vivem sozinhos e seus cuidadores.
- **ODS:** 3 (Saúde e bem-estar) e 10 (Redução das desigualdades).
- Os dados são **mockados** (sem integração com API nesta entrega).

## Telas e navegação
| Tela | Rota | O que faz |
|------|------|-----------|
| Início | `/` | Resumo de alertas pendentes e atalhos (GridView) |
| Idosos | `/idosos` | Lista dos idosos (ListView) |
| Detalhe do idoso | `/idoso` | Recebe o `Idoso` por **parâmetro de rota**; histórico de eventos |
| Alertas | `/eventos` | Lista de eventos com filtro e resolução |
| Registrar evento | `/novo-evento` | **Formulário** validado |
| Sobre | `/sobre` | Descrição e ODS |

Navegação com `Navigator.pushNamed`, rotas nomeadas em `main.dart` e `arguments` para passar o idoso.

## Requisitos da disciplina
- **Gerenciamento de estado (`StatefulWidget` + `setState`):** filtro "só pendentes" e contador "Itens na lista" (Alertas), resolver alerta (atualiza a lista e o contador da tela inicial), mostrar/ocultar contato (Detalhe).
- **Formulário:** `Form` com `GlobalKey<FormState>`, `TextFormField` e `DropdownButtonFormField`, validações (idoso e tipo obrigatórios, horário `HH:MM`, observação com 5+ caracteres), feedback com `SnackBar` (erro) e `AlertDialog` (sucesso).
- **Widgets:** Scaffold, AppBar, Column, Row, Container, Card, Padding, SizedBox, Image (logo em `assets/logo.png`), Icon, ListView, GridView.
- **Identidade visual:** Material 3, cor principal azul, cores de gravidade (vermelho, laranja, amarelo, verde).

## Como executar
Pré-requisitos: Flutter 3.x instalado e um emulador ou celular.
```bash
flutter pub get
flutter run
```
Testes: `flutter test`. APK: `flutter build apk --release` (arquivo em `build/app/outputs/flutter-apk/app-release.apk`).

## Publicação do app
O APK de release (`app-release.apk`) está anexado na seção **Releases** deste repositório, gerado a partir deste mesmo código com `flutter build apk --release`.

## Vídeo
Link (YouTube, não listado): (colar o link depois de publicar)

## Uso de IA generativa
Foi usada a ferramenta Claude (Anthropic) para gerar a estrutura inicial do app (telas, navegação, formulário e gerenciamento de estado), o logo e este README. O código foi executado no emulador, testado e revisado pela autora, que consegue explicá-lo.
