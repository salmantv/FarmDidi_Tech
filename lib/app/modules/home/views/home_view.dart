import 'dart:developer';

import 'package:farmdiditask/app/data/api_service/model.dart';
import 'package:farmdiditask/app/data/local_db_service/db_model.dart';
import 'package:farmdiditask/app/modules/favourite/controllers/favourite_controller.dart';
import 'package:farmdiditask/app/modules/home/views/widget/showCard.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/local_db_service/local_db_service.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final homecontroller = Get.put(HomeController());
  final favController = Get.put(FavouriteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('University list'),
          elevation: 5,
          backgroundColor: Color.fromARGB(255, 51, 105, 52),
        ),
        body: FutureBuilder<List<Model>>(
          future: homecontroller.fetchingdata(),
          builder: (BuildContext context, snapshot) {
            if (snapshot.hasData) {
              return ListView.separated(
                  itemBuilder: (context, index) {
                    final data = snapshot.data![index];
                    return GetBuilder<FavouriteController>(
                        builder: (controller) {
                      return Showcard(
                        data: data,
                      );
                    });
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 20,
                    );
                  },
                  itemCount: snapshot.data!.length);
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}
