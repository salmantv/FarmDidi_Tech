import 'package:get/get.dart';

import 'package:farmdiditask/app/modules/bottomNavigatioScreen/bindings/bottom_navigatio_screen_binding.dart';
import 'package:farmdiditask/app/modules/bottomNavigatioScreen/views/bottom_navigatio_screen_view.dart';
import 'package:farmdiditask/app/modules/favourite/bindings/favourite_binding.dart';
import 'package:farmdiditask/app/modules/favourite/views/favourite_view.dart';
import 'package:farmdiditask/app/modules/home/bindings/home_binding.dart';
import 'package:farmdiditask/app/modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.BOTTOM_NAVIGATIO_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.BOTTOM_NAVIGATIO_SCREEN,
      page: () => BottomNavigationBarView(),
      binding: BottomNavigatioScreenBinding(),
    ),
    GetPage(
      name: _Paths.FAVOURITE,
      page: () => FavouriteView(),
      binding: FavouriteBinding(),
    ),
  ];
}
