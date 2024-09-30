import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:projet_final_flutter/routes/routes.dart';
import 'package:projet_final_flutter/view/screens/welcome_screen.dart';

void main() {
  testWidgets('Vérification de la navigation depuis WelcomeScreen', (WidgetTester tester) async {
    // Simuler les routes avec GetMaterialApp
    await tester.pumpWidget(
      GetMaterialApp(
        initialRoute: '/welcome',
        getPages: [
          GetPage(name: '/welcome', page: () => const WelcomeScreen()),
          GetPage(name: Routes.loginScreen, page: () => const Placeholder()), // LoginScreen placeholder
          GetPage(name: Routes.signUpScreen, page: () => const Placeholder()), // SignUpScreen placeholder
        ],
      ),
    );

    // Vérifier que WelcomeScreen est chargé
    expect(find.byType(WelcomeScreen), findsOneWidget);

    // Appuyer sur le bouton "Allons-y"
    await tester.tap(find.text('Allons-y'));
    await tester.pumpAndSettle();

    // Vérifier que la navigation a eu lieu vers la page LoginScreen
    expect(find.byType(Placeholder), findsOneWidget); // Placeholder pour la page de login

    // Revenir en arrière pour tester l'autre navigation
    Get.back();
    await tester.pumpAndSettle();

    // Appuyer sur le bouton "S'inscrire"
    await tester.tap(find.text("S'inscrire"));
    await tester.pumpAndSettle();

    // Vérifier que la navigation a eu lieu vers la page SignUpScreen
    expect(find.byType(Placeholder), findsOneWidget); // Placeholder pour la page d'inscription
  });
}
