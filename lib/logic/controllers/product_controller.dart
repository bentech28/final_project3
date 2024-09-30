import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';

import '../../models/product_models.dart';
import '../../services/product_services.dart';

class ProductController extends GetxController {
  var productList = <ProductModels>[].obs;
  var favouritesList = <ProductModels>[].obs;
  var isLoading = true.obs;
  var storage = GetStorage();

  // Search
  var searchList = <ProductModels>[].obs;
  TextEditingController searchTextController = TextEditingController();

  @override
  void onInit() {
    super.onInit();

    List<dynamic>? storedShoppings = storage.read<List<dynamic>>('isFavouritesList');

    if (storedShoppings != null) {
      favouritesList.value = storedShoppings
          .map((e) => ProductModels.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    getProducts();
  }

  void getProducts() async {
    try {
      isLoading(true);
      var products = await ProductServices.getProduct();
      if (products.isNotEmpty) {
        productList.addAll(products);
      }
    } finally {
      isLoading(false);
    }
  }

  // Logic for Favourites Screen

  void manageFavourites(int productId) async {
    var existingIndex =
    favouritesList.indexWhere((element) => element.id == productId);

    if (existingIndex >= 0) {
      favouritesList.removeAt(existingIndex);
      await storage.write("isFavouritesList", favouritesList.map((e) => e.toJson()).toList());
    } else {
      favouritesList.add(productList.firstWhere((element) => element.id == productId));
      await storage.write("isFavouritesList", favouritesList.map((e) => e.toJson()).toList());
    }
  }

  bool isFavourites(int productId) {
    return favouritesList.any((element) => element.id == productId);
  }

  // Search Bar Logic

  void addSearchToList(String searchName) {
    searchName = searchName.toLowerCase();

    searchList.value = productList.where((search) {
      var searchTitle = search.title.toLowerCase();
      var searchPrice = search.price.toString().toLowerCase();

      return searchTitle.contains(searchName) ||
          searchPrice.toString().contains(searchName);
    }).toList();

    update();
  }

  void clearSearch() {
    searchTextController.clear();
    addSearchToList("");
  }
}
