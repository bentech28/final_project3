import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:projet_final_flutter/view/screens/welcome_screen.dart';

void main() {
  testWidgets('Les éléments de la page WelcomeScreen sont présents', (WidgetTester tester) async {
    // Charger la page WelcomeScreen
    await tester.pumpWidget(
      const GetMaterialApp(
        home: WelcomeScreen(),
      ),
    );

    // Vérifier si l'image de fond est présente
    expect(find.byType(Image), findsOneWidget);

    // Vérifier si le texte "Bienvenu" est affiché
    expect(find.text('Bienvenu'), findsOneWidget);

    // Vérifier si le texte "ANFANI SHOP" est affiché
    expect(find.text('ANFANI'), findsOneWidget);
    expect(find.text('SHOP'), findsOneWidget);

    // Vérifier si le bouton "Allons-y" est présent
    expect(find.text("Allons-y"), findsOneWidget);

    // Vérifier si le texte "Vous n'avez pas de compte?" est affiché
    expect(find.text("Vous n'avez pas de compte?"), findsOneWidget);

    // Vérifier si le bouton "S'inscrire" est présent
    expect(find.text("S'inscrire"), findsOneWidget);
  });
}
