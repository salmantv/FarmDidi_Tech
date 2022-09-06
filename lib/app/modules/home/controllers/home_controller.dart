import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:farmdiditask/app/data/api_service/model.dart';
import 'package:farmdiditask/app/data/local_db_service/db_model.dart';
import 'package:farmdiditask/app/data/local_db_service/local_db_service.dart';
import 'package:farmdiditask/app/modules/favourite/controllers/favourite_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/api_service/model.dart';

class HomeController extends GetxController {
  final fav = Get.put(FavouriteController());
  RxBool isFavourite = false.obs;

  Future<void> addtofavoutit(Model data) async {
    final thedata = FavoutieModel(
        name: data.name.toString(), weblink: data.webPages![0].toString());
    fav.addData(thedata);
  }

  Future<List<Model>> fetchingdata() async {
    try {
      final dio = Dio();
      final apiUrl = "http://universities.hipolabs.com/search?country=India";
      var response = await dio.get(apiUrl);

      if (response.statusCode == 200) {
        Iterable list = await response.data;

        return list.map((element) => Model.fromJson(element)).toList();
      }
    } catch (e) {
      log(e.toString());
      Get.snackbar("Error ", e.toString());
    }
    return <Model>[];
  }
}
