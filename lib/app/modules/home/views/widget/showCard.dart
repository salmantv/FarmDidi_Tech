import 'dart:developer';

import 'package:farmdiditask/app/data/api_service/model.dart';
import 'package:farmdiditask/app/modules/favourite/controllers/favourite_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../../../data/local_db_service/local_db_service.dart';
import '../../controllers/home_controller.dart';

class Showcard extends StatelessWidget {
  Showcard({Key? key, required this.data}) : super(key: key);

  final favouriteController = Get.put(FavouriteController());
  final homecontroller = Get.put(HomeController());
  final Model data;
  @override
  Widget build(BuildContext context) {
    bool isFav = favouriteController.isInFav(data.name!);
    NotesDatabase.instance.getalldata();
    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.width / 20),
      child: Container(
        child: Card(
            elevation: 10,
            child: ListTile(
              leading: GetBuilder<FavouriteController>(builder: (context) {
                return IconButton(
                  onPressed: () {
                    if (!isFav) {
                      homecontroller.addtofavoutit(data);
                    } else {
                      favouriteController.delete(data.name!);
                    }
                  },
                  icon: GetBuilder<FavouriteController>(builder: (context) {
                    return Icon(Icons.favorite_rounded,
                        color: isFav ? Colors.red : Colors.grey);
                  }),
                );
              }),
              subtitle: Text(
                data.webPages![0],
                style: TextStyle(
                    fontSize: 14,
                    letterSpacing: 2,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey),
              ),
              title: Text(
                data.name.toString(),
                maxLines: 2,
                style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    wordSpacing: 1,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
            )),
      ),
    );
  }
}
