import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_storage/get_storage.dart';
import 'package:projet_final_flutter/main.dart';
import 'package:projet_final_flutter/routes/routes.dart';
import 'package:get/get.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    await GetStorage.init();
  });

  testWidgets('Test d\'intégration - Chargement de la page initiale en fonction de l\'état de l\'utilisateur', (WidgetTester tester) async {
    // Cas où l'utilisateur est authentifié
    GetStorage().write('auth', true);

    // Démarrer l'application
    await tester.pumpWidget(const MyApp());

    // Vérifier si l'application navigue vers la page principale
    await tester.pumpAndSettle();
    expect(find.text('Main Screen'), findsOneWidget); // Exemple de vérification

    // Simuler un utilisateur non connecté
    GetStorage().write('auth', false);

    // Redémarrer l'application
    await tester.pumpWidget(const MyApp());

    // Vérifier que l'application redirige vers la page de bienvenue
    await tester.pumpAndSettle();
    expect(find.text('Welcome'), findsOneWidget); // Exemple de vérification
  });
}
