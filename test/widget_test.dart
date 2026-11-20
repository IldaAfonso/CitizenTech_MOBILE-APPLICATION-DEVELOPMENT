import 'package:flutter_test/flutter_test.dart';

import 'package:citizentech_app/main.dart';

void main() {
  testWidgets('abre a tela inicial', (tester) async {
    await tester.pumpWidget(const CitizenTechApp());
    expect(find.text('Olá, cuidador!'), findsOneWidget);
  });
}
