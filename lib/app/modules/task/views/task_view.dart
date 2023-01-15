import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:tas_management_app/app/data/controller/auth_controller.dart';
import 'package:tas_management_app/app/utils/widget/header.dart';
import 'package:tas_management_app/app/utils/widget/myTask.dart';
import 'package:tas_management_app/app/utils/widget/sideBar.dart';
import 'package:tas_management_app/app/utils/widget/style/AppColors.dart';

import '../../../utils/widget/prosesTask.dart';
import '../controllers/task_controller.dart';

class TaskView extends GetView<TaskController> {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  final authCon = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      drawer: const SizedBox(width: 150, child: SideBar()),
      backgroundColor: AppColors.primaryBg,
      body: SafeArea(
        child: Row(
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
              child: CircleAvatar(
                backgroundColor: Colors.amber, 
                radius: 25, 
                foregroundImage: NetworkImage(
                   authCon.auth.currentUser!.photoURL!),
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
                child: MyTask(),
                    
             ),
           )
          ]),
      )
          ],
        ),
      ),
        floatingActionButton: Align(
          alignment: Alignment(0.95 , 0.95),
          child: FloatingActionButton.extended(
            onPressed: (){
              addEditTask(context: context, type: 'Add',docId: '');
            },
            label: Text('Add Task'), 
            icon: Icon(Ionicons.add),
          ),
        ),
       );
  }

    
}
