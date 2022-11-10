import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

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
        child: Container(
          color: Colors.blue[100],
          child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 100,
                alignment: Alignment.topCenter,
                child: const Image(
                  image: AssetImage('assets/icons/icon.png'),
                  ),
                  ),
            SizedBox(
            height : 100,
            child: Center(child: InkWell(
              child: Column(children: [
                Container(
                  height: 40,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                  color: Colors.white,
                  ),
                  child: const Icon(
                    Ionicons.desktop,
                    color: Colors.grey,
                    size: 30,
                  ),
              ),
              const SizedBox(
                height: 5,
              ),
             const Text(
                'Home',
              style:
                TextStyle(
                color: Colors.grey,
                fontSize: 16,
                ),
              ),
              ]),
              )),
            )
            ],
            
          ),
          ),
        ),
      ),
      Expanded(
        flex: 15,
        child: Container(
          color: Colors.white,
          ),
      )
        ], 
      ));
  }
}
