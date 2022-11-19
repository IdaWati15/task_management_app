import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:tas_management_app/app/utils/widget/header.dart';
import 'package:tas_management_app/app/utils/widget/myfriends.dart';
import 'package:tas_management_app/app/utils/widget/sideBar.dart';
import 'package:tas_management_app/app/utils/widget/style/AppColors.dart';

import '../controllers/friends_controller.dart';

class FriendsView extends GetView<FriendsController> {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

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
                  'People You May Know',
                  style: TextStyle(
                    fontSize: 30,
                    color: AppColors.primaryText,
                    ),
                ),
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    clipBehavior: Clip.antiAlias,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Stack(
                          children: [
                             ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                           child: const Image(
                            image : NetworkImage(
                              'https://static.independent.co.uk/s3fs-public/thumbnails/image/2017/09/27/08/jennifer-lawrence.jpg?quality=75&width=982&height=726&auto=webp%27',
                         ),
                           ),
                             ),
                             Positioned(
                              bottom: 10,
                              left: 50,
                              child: Text(
                                'Alicia Jasmine', 
                                style: TextStyle(color: Colors.white),
                                ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: SizedBox(
                                    height: 36,
                                    width: 36,
                                    child: ElevatedButton(
                                      onPressed: (){},
                                      style: ElevatedButton.styleFrom(
                                        padding: EdgeInsets.zero,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(50),
                                        ),
                                      ),
                                    child: 
                                    Icon(Ionicons.add_circle_outline,)
                                    ),
                                  ),
                                ),
                        ],
                         
                        ),
                           );
                        
                    },
                  ),
                ),
               
                MyFriends()
              ]),
            ),
          )
        ]),
      )
        ],
      ),
      );
  }
}

