import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../logic/controllers/cart_controller.dart';
import '../../utils/theme.dart';
import '../widgets/cart/cart_product_card.dart';
import '../widgets/cart/cart_total.dart';
import '../widgets/cart/empty_cart.dart';


class CartScreen extends StatelessWidget {
  CartScreen({super.key});

  // Le contrôleur du panier est récupéré ici
  final CartController controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.scaffoldBackgroundColor, // Utilisation de `scaffoldBackgroundColor` pour plus de précision
        appBar: AppBar(
          title: const Text("Mon panier"),
          elevation: 0,
          backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                controller.clearAllProducts(); // Efface tous les produits du panier
              },
              icon: const Icon(Icons.backspace),
            ),
          ],
        ),
        body: Obx(() {
          // Utilisation d'une réaction observable pour surveiller les changements du panier
          if (controller.productsMap.isEmpty) {
            return const EmptyCart(); // Affiche un écran vide si le panier est vide
          } else {
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 600, // Définition de la hauteur pour la liste des produits
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        return CartProductCard(
                          index: index,
                          productModels: controller.productsMap.keys.toList()[index],
                          quantity: controller.productsMap.values.toList()[index],
                        );
                      },
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 20,
                      ),
                      itemCount: controller.productsMap.length,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: CartTotal(), // Widget affichant le total du panier
                  ),
                ],
              ),
            );
          }
        }),
      ),
    );
  }
}
