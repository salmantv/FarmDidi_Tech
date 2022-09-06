import 'package:farmdiditask/app/data/api_service/model.dart';
import 'package:farmdiditask/app/modules/favourite/controllers/favourite_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../../../data/local_db_service/db_model.dart';
import '../../../../data/local_db_service/local_db_service.dart';

class FavouritUicard extends StatelessWidget {
  FavouritUicard({
    Key? key,
    required this.data,
  }) : super(key: key);
  final favouriteController = Get.put(FavouriteController());
  final FavoutieModel data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.width / 20),
      child: Container(
        child: Card(
            elevation: 10,
            child: ListTile(
              subtitle: Text(
                data.weblink,
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
