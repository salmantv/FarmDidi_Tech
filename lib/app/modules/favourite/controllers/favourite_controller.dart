import 'dart:developer';

import 'package:farmdiditask/app/data/api_service/model.dart';
import 'package:farmdiditask/app/data/local_db_service/db_model.dart';
import 'package:farmdiditask/app/data/local_db_service/local_db_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';

class FavouriteController extends GetxController {
  Future<void> addData(FavoutieModel value) async {
    final db = await NotesDatabase.instance.database;
    String query = "INSERT INTO apidata (name,weblink) VALUES (?,?)";
    await db.rawInsert(query, [value.name, value.weblink]);
    update();
  }

  Future<int> delete(String name) async {
    Database db = await NotesDatabase.instance.database;
    int delId =
        await db.delete("apidata", where: 'name = ?', whereArgs: [name]);
    update();
    return delId;
  }

  bool isInFav(String name) {
    for (var item in NotesDatabase.instance.favouritedata) {
      if (item.name == name) return true;
    }
    return false;
  }

  Rx<bool> favourit = Rx(false);
  Color color = Colors.grey;
  bool isFav = false;
  Future<void> favouritlogic(FavoutieModel data) async {
    data.isfav = !data.isfav;
    update();
  }
}
