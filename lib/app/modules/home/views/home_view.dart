import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tas_management_app/app/utils/widget/header.dart';
import 'package:tas_management_app/app/utils/widget/sideBar.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: Row(
        children: [
      Expanded(
        flex: 2,
        child: SideBar(),
      ),
      Expanded(
        flex: 15,
        child: Column(children: [
          header(),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(50),
              margin: const EdgeInsets.all(10),
              color: Colors.white,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          )
        ]),
      )
        ],
      ));
  }
}

