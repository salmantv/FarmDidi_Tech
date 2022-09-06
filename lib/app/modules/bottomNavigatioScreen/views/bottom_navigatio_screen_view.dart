import 'package:farmdiditask/app/modules/bottomNavigatioScreen/controllers/bottom_navigatio_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavigationBarView extends GetView<BottomNavigatioScreenController> {
  final bottomcontroller = Get.put(BottomNavigatioScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
            onTap: (value) {
              bottomcontroller.pageindex.value = value;
            },
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            currentIndex: bottomcontroller.pageindex.value,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.black54,
            selectedFontSize: 10,
            unselectedFontSize: 10,
            iconSize: 25,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home, size: 25),
                label: "Home",
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite), label: "Favorite"),
            ]);
      }),
      body: Obx(
        (() {
          return bottomcontroller.pages[bottomcontroller.pageindex.value];
        }),
      ),
    );
  }
}
