import 'dart:developer';

import 'package:farmdiditask/app/data/local_db_service/db_model.dart';
import 'package:farmdiditask/app/data/local_db_service/local_db_service.dart';
import 'package:farmdiditask/app/modules/favourite/views/widget/favourit_card.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/favourite_controller.dart';

class FavouriteView extends GetView<FavouriteController> {
  final data = Get.put(NotesDatabase.instance);
  @override
  Widget build(BuildContext context) {
    NotesDatabase.instance.getalldata();
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourite'),
        backgroundColor: Color.fromARGB(255, 51, 105, 52),
        actions: [IconButton(onPressed: () async {}, icon: Icon(Icons.abc))],
      ),
      body: GetBuilder<FavouriteController>(
        builder: (context) {
          return data.favouritedata.isEmpty
              ? Center(
                  child: Icon(Icons.hourglass_empty),
                )
              : ListView.separated(
                  itemBuilder: (context, index) {
                    final value = data.favouritedata[index];
                    return FavouritUicard(
                      data: value,
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 20,
                    );
                  },
                  itemCount: data.favouritedata.length);
        },
      ),
    );
  }
}
