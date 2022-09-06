import 'package:farmdiditask/app/modules/favourite/views/favourite_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home/views/home_view.dart';

class BottomNavigatioScreenController extends GetxController {
  RxInt pageindex = 0.obs;

  var pages = <Widget>[
    HomeView(),
    FavouriteView(),
  ];
}
