import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:tas_management_app/app/utils/widget/header.dart';
import 'package:tas_management_app/app/utils/widget/sideBar.dart';
import 'package:tas_management_app/app/utils/widget/style/AppColors.dart';

import '../controllers/task_controller.dart';

class TaskView extends GetView<TaskController> {final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      drawer: const SideBar(),
      backgroundColor: AppColors.primaryBg,
      body: Row(
        children: [
      !context.isPhone 
      ? const Expanded(
          flex: 2,
          child:  SideBar(), 
        )
        : const  SizedBox(),
      Expanded(
        flex: 15,
        child: Column(children: [
          !context.isPhone 
          ? const header()
          : Container(
            // content / isi page / screen
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    _drawerKey.currentState!.openDrawer();
                  }, 
                  icon: const Icon(
                    Icons.menu, 
                    color: AppColors.primaryText ,
          ),
          ),
          const SizedBox(
              width: 15,
            ),
          Column(
         // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Task Management',
              style: TextStyle(
                fontSize: 20, color: AppColors.primaryText),
              ),
            Text(
              'Manage Task Made Easy with Friends',
                style: TextStyle(
                  fontSize: 13, color: AppColors.primaryText),
                ),
          ],
          ),
          const Spacer(),
          const Icon (
            Ionicons.notifications, 
                color: AppColors.primaryText,
            ),
            const SizedBox(
              width: 15,
            ),
            ClipRRect(borderRadius: BorderRadius.circular(30),
            child: const CircleAvatar(
              backgroundColor: Colors.amber, 
              radius: 25, 
              foregroundImage: NetworkImage(
                'https://static.independent.co.uk/s3fs-public/thumbnails/image/2017/09/27/08/jennifer-lawrence.jpg?quality=75&width=982&height=726&auto=webp%27'),
              ),
            )
          ],
          ),
          ),
          Expanded(
            child: Container(
              padding: !context.isPhone? EdgeInsets.all(50): EdgeInsets.all(20),
              margin: !context.isPhone? EdgeInsets.all(10): EdgeInsets.all(0),
              decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: !context.isPhone? BorderRadius.circular(50): BorderRadius.circular(20)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                                'My Task', 
                                style: TextStyle(
                                  color: AppColors.primaryText, 
                                  fontSize: 30,
                                         ),
                                         ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                   Expanded(
                    child: ListView.builder(
                      itemCount: 8,
                      clipBehavior: Clip.antiAlias,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return  Container(
                     //  width: 400,
                     height: 160,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                    color: AppColors.cardBg, ),
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Row(
         children:[
                       ClipRRect(
                              borderRadius: BorderRadius.circular(25),
                              child: const CircleAvatar(
                              backgroundColor: Colors.amber, 
                              radius: 20, 
                              foregroundImage: NetworkImage(
                                    'https://static.independent.co.uk/s3fs-public/thumbnails/image/2017/09/27/08/jennifer-lawrence.jpg?quality=75&width=982&height=726&auto=webp%27',
             ),
             ),
             ),
             ClipRRect(
                              borderRadius: BorderRadius.circular(25),
                              child: const CircleAvatar(
                              backgroundColor: Colors.amber, 
                              radius: 20, 
                              foregroundImage: NetworkImage(
                                    'https://static.independent.co.uk/s3fs-public/thumbnails/image/2017/09/27/08/jennifer-lawrence.jpg?quality=75&width=982&height=726&auto=webp%27',
             ),
             ),
             ),
             Spacer(),
             Container(
               height: 25,
               width: 80,
               color: AppColors.primaryBg,
               child: Center(child: Text('100 %', style: TextStyle(color: AppColors.primaryText,
               ),
               ),
               ),
             ),
             
         ],
         ),
         Spacer(),
          Container(
               height: 25,
               width: 80,
               color: AppColors.primaryBg,
               child: Center(child: Text('10 / 10 Task', style: TextStyle(color: AppColors.primaryText,
               ),
               ),
               ),
             ),  
             Text('Pemograman Mobile', style: TextStyle(color: AppColors.primaryText,fontSize: 20),
             ),
             Text('Deadline 2 hari lagi', style: TextStyle(color: AppColors.primaryText,fontSize: 15),
             ),
            ]),
            );
                  },
                 ),
                ),
                ],
              ),
             ),
           ),
          ],
         ),
        ),
        ]),
        floatingActionButton: Align(
          alignment: Alignment(0.95 , 0.95),
          child: FloatingActionButton.extended(
            onPressed: (){
              Get.bottomSheet(
                Container(
                  margin: context.isPhone 
                  ? EdgeInsets.zero
                  : EdgeInsets.only(left: 150, right: 150),
                  height: Get.height,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20), 
                      topRight: Radius.circular(20), 
                      ), 
                    color: Colors.white,
                  ),
              ),
              );
            },
            label: Text('Add Task'), 
            icon: Icon(Ionicons.add),
          ),
        ),
       );
  }
}
