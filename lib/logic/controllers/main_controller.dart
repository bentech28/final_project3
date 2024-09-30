import 'package:get/get.dart';

import '../../view/screens/category_screen.dart';
import '../../view/screens/favorites_screen.dart';
import '../../view/screens/home_screen.dart';
import '../../view/screens/settings_screen.dart';

class MainController extends GetxController {
  RxInt currentIndex = 0.obs;

  var tabs = [
    HomeScreen(),
    CategoryScreen(),
    FavoritesScreen(),
    SettingsScreen(),
  ].obs;

  var title = [
    "Asroo Shop",
    "Categories",
    'Favourites',
    "Settings",
  ].obs;
}
