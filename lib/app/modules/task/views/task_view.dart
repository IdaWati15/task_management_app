import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:tas_management_app/app/data/controller/auth_controller.dart';
import 'package:tas_management_app/app/utils/widget/header.dart';
import 'package:tas_management_app/app/utils/widget/sideBar.dart';
import 'package:tas_management_app/app/utils/widget/style/AppColors.dart';

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
                    const Text(
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
                      // stream user for get task list 
                      child: StreamBuilder<DocumentSnapshot<Map<String,dynamic>>>(
                        stream: authCon.streamUsers(
                          authCon.auth.currentUser!.email!),
                        builder: (context, snapshot) {
                           if (snapshot.connectionState == ConnectionState.waiting) {
                             return const Center(child: CircularProgressIndicator());
                          }
                          // get task id 
                          var taskId = (snapshot.data!.data() 
                               as Map<String, dynamic>) ['task_id'] 
                            as List ;
                          return ListView.builder(
                            itemCount: taskId.length,
                            clipBehavior: Clip.antiAlias,
                                          shrinkWrap: true,
                                          itemBuilder: (context, index) {
                          return  StreamBuilder<
                                    DocumentSnapshot<
                                        Map<String, dynamic>>>(
                            stream: authCon.streamTask(taskId[index]),
                            builder: (context, snapshot2) {
                              if (snapshot2.connectionState == 
                              ConnectionState.waiting) {
                             return const Center(
                              child: CircularProgressIndicator());
                          }

                              // data task
                              var dataTask = snapshot2.data!.data();
                              // data user photo 
                              var dataUserList = (snapshot2.data!.data() 
                               as Map<String, dynamic>) ['asign_to'] 
                            as List ;
                              return GestureDetector(
                                onLongPress: () {
                                  Get.defaultDialog(
                                    title: dataTask!['title'],
                                    content: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                    TextButton.icon(
                                      onPressed: () {
                                        Get.back();
                                    controller
                                            .titleController
                                            .text =
                                        dataTask[
                                          'title'];
                                    controller
                                            .descriptionController
                                            .text = 
                                        dataTask[
                                          'descriptions'];
                                    controller
                                            .dueDateController
                                            .text = 
                                        dataTask[
                                          'due_date'];
                                    addEditTask(
                                           context: 
                                              context,
                                            type: 'Update', 
                                            docId: taskId[
                                              index]);
                                      }, 
                                      icon: const Icon(
                                        Ionicons.pencil),
                                        label: 
                                        const Text('Update')),
                                     TextButton.icon(
                                      onPressed: () {
                                        controller
                                          .deleteTask(
                                            taskId[
                                              index]);
                                      }, 
                                      icon: const Icon(
                                        Ionicons.trash),
                                        label: 
                                        Text('Delete')),   
                                    ],
                                  ));
                                  // addEditTask(
                                  //   context: context,
                                  //   type: 'Update', 
                                  //   docId: '2022-07-28T00:58:36.883963');
                                },
                                child: Container(
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
                                  SizedBox(
                                    height: 50,
                                    child: 
                                    Expanded(
                                      child: ListView.builder(
                                        padding: EdgeInsets.zero,
                                        itemCount: dataUserList.length,
                                        scrollDirection: Axis.horizontal,
                                        shrinkWrap: true,
                                        physics: ScrollPhysics(),
                                        itemBuilder: (context, index2) {
                                          return StreamBuilder<
                                          DocumentSnapshot<
                                              Map<String, dynamic>>>(
                                           stream: authCon.streamUsers(dataUserList[index2]),
                                           builder: (context, snapshot3) {
                                            if (snapshot3.connectionState == 
                                               ConnectionState.waiting) {
                                              return const Center(
                                              child: CircularProgressIndicator());
                                            }
                                            // data user photo 
                                            var dataUserImage = snapshot3
                                                .data!
                                                .data();
                                             return ClipRRect(
                                                    borderRadius: 
                                                      BorderRadius.circular(25),
                                                    child: 
                                                      CircleAvatar(
                                                    backgroundColor: 
                                                      Colors.amber, 
                                                    radius: 
                                                        20, 
                                                    foregroundImage: 
                                                        NetworkImage(dataUserImage!['photo']),
                                                       ),
                                                       );
                                           });
                                        },
                                        ),
                                    ),
                                  ),
                                            
                                             const Spacer(),
                                             Container(
                                               height: 25,
                                               width: 80,
                                               color: AppColors.primaryBg,
                                               child: Center(child: Text(
                                                '${dataTask!['status']} %', 
                                                style: TextStyle(
                                                  color: AppColors
                                                  .primaryText,
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
                                               child: Center(child: Text(
                                                  '${dataTask['total_task_finished']} / ${dataTask['total_task']} Task', 
                                                style: TextStyle(
                                                  color: AppColors
                                                  .primaryText,
                                               ),
                                               ),
                                               ),
                                             ),  
                                            Text(
                                              dataTask['title'], 
                                              style: TextStyle(
                                                color: AppColors
                                                    .primaryText,
                                                fontSize: 20
                                              ),
                                             ),
                                             Text(
                                              dataTask['descriptions'], 
                                              style: TextStyle(
                                                color: AppColors
                                                .primaryText,
                                                fontSize: 15
                                                ),
                                             ),
                                            ]),
                                            ),
                              );
                            }
                          );
                                          },
                                         );
                        }
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

    addEditTask({BuildContext? context, String? type, String? docId}){
      Get.bottomSheet(
                SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                    margin: context!.isPhone 
                    ? EdgeInsets.zero
                    : const EdgeInsets.only(left: 150, right: 150),
                    height: Get.height,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20), 
                        topRight: Radius.circular(20), 
                        ), 
                      color: Colors.white,
                    ),
                    child: Form(
                      key: controller.formKey,
                      child: Column(
                    children: [
                      Text(
                        '$type Task',
                        style: TextStyle(
                          color: AppColors.primaryText, 
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Title',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      controller: controller.titleController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Cannot be empty';
                        }
                        return null;
                      },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.multiline,
                        maxLines: 5,
                        decoration: InputDecoration(
                        hintText: 'Description',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      controller: controller.descriptionController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Cannot be empty';
                        }
                        return null;
                      },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      DateTimePicker(
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2100),
                        dateLabelText: 'Due Date',
                        decoration: InputDecoration(
                          hintText: 'Due Date',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      controller: controller.dueDateController,
                        validator: (value) {
                          if (value == null || value.isEmpty)  {
                            return 'Can not be empty';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ConstrainedBox(
                        constraints: 
                          BoxConstraints.tightFor(width: Get.width, height: 40),
                      child: ElevatedButton(
                        onPressed: () {
                          controller.saveUpdateTask(
                            controller.titleController.text,
                            controller.descriptionController.text,
                            controller.dueDateController.text,
                            docId!,
                            type,
                            );
                        }, 
                        child: Text(type!),
                        ),
                        ),
                        SizedBox(
                        height: 20,
                      ),
                      ],
                      )),
                              ),
                ),
              );
    }
}
