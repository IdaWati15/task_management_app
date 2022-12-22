import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:tas_management_app/app/data/controller/auth_controller.dart';
import 'package:tas_management_app/app/routes/app_pages.dart';
import 'package:tas_management_app/app/utils/widget/style/AppColors.dart';

class MyFriends extends StatelessWidget {
  final authCon = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child:SingleChildScrollView(
            child: Column (
              children: [
                Row(
                  children: [
                      const Text(
                        'My Friends', 
                        style: TextStyle(
                          color: AppColors.primaryText, 
                          fontSize: 30,
                        ),
                      ),
                      const Spacer(),
                       GestureDetector(
                         onTap: ()=> Get.toNamed(Routes.FRIENDS),
                         child: const Text(
                          'more', 
                          style: TextStyle
                          (color: AppColors.primaryText, 
                          fontSize: 25,
                        ),
                         ),
                       ),
                      Icon(
                        Ionicons.chevron_forward, 
                        color: AppColors.primaryText,
                      )
                  ],
                  ),
                       const SizedBox(
                        height: 20,
                        ),
                        StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                          stream: authCon.streamFriends(),
                           builder: (context, snapshot) {
                             if (snapshot.connectionState == ConnectionState.waiting) {
                             return const Center(child: CircularProgressIndicator
                             ());
                      }

                        var myfriends = (snapshot.data!.data() 
                        as Map<String, dynamic>) ['emailFriends'] as List ;

                            return GridView.builder(
                            shrinkWrap: true,
                            itemCount: myfriends.length,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount:context.isPhone? 2 : 3, 
                              crossAxisSpacing: 20, 
                              mainAxisSpacing: 20), 
                            itemBuilder: (context,index){
                             return StreamBuilder<
                             DocumentSnapshot<Map<String, dynamic>>>(
                               stream: authCon.streamUsers(myfriends[index]),
                               builder: (context, snapshot2) {
                                 if (snapshot.connectionState == ConnectionState.waiting) {
                             return const Center(child: CircularProgressIndicator
                             ());
                                 }


                            var data = snapshot2.data!.data();

                                 return Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                               child: Image(
                                                image : 
                                                NetworkImage(
                                                  data!['photo']),
                                                  height: Get.width * 0.35,
                                                  width: Get.width * 0.4,
                                                  fit:  BoxFit.cover,
                                               
                                               ),
                                    ),
                                               Text(
                                                data['name'],
                                                style: 
                                                const TextStyle(color: AppColors.primaryText),
                                               ),
                                 ],
                                 );
                               }
                             );
                          },
                          );
                           },
                           )
            ],
            ),
          ),
        ),
      ),
    );
  }
}

