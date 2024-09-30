import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:projet_final_flutter/logic/controllers/product_controller.dart';
import 'package:projet_final_flutter/view/screens/favorites_screen.dart';

void main() {
  testWidgets('Vérification de l\'affichage lorsque la liste des favoris est vide', (WidgetTester tester) async {
    // Initialiser ProductController avec une liste vide
    final controller = Get.put(ProductController());
    controller.favouritesList.clear();

    // Charger la page FavoritesScreen
    await tester.pumpWidget(
      GetMaterialApp(
        home: FavoritesScreen(),
      ),
    );

    // Vérifier que l'image et le message sont affichés lorsque la liste est vide
    expect(find.text('Please, Add your favorites products.'), findsOneWidget);
    expect(find.byType(Image), findsOneWidget);
  });
}
