import 'package:flutter/material.dart';
import 'package:tas_management_app/app/data/controller/auth_controller.dart';
import 'package:tas_management_app/app/utils/widget/style/AppColors.dart';
import 'package:get/get.dart';

class ProfileWidget extends StatelessWidget {
final authConn =Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Expanded(child: 
    !context.isPhone? Row(
      children:[
    Expanded(
      child: ClipRRect(
           child: CircleAvatar(
            backgroundColor: Colors.amber, 
            radius: 120,
            foregroundImage: NetworkImage(
              authConn.auth.currentUser!.photoURL!),
           ),
           ),
      ),
    // SizedBox(width: 20,),
    Expanded
    (flex: 2,
      child: Column(

        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
      Text(
        authConn.auth.currentUser!.displayName!,
        style: TextStyle(
          color: AppColors.primaryText,
          fontSize: 30,
            ),
           ),
      Text(
        authConn.auth.currentUser!.email!, 
        style: TextStyle(
          color: AppColors.primaryText, 
          fontSize: 15,
          ),
        ),
                             
      ],
      ),
    ), 
             ],
       )
    : Center(
      child: Column(
      children: [
        SizedBox(
      height: 20,
      ),
    ClipRRect(
         child: CircleAvatar(
          backgroundColor: Colors.amber,
          radius: 100,
          foregroundImage: NetworkImage(
            authConn.auth.currentUser!.photoURL!
         ),
         ),
    ),
    const SizedBox(
      height: 20,
      ),
    Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
      Text(
        authConn.auth.currentUser!.displayName!,
        style: TextStyle(
          color: AppColors.primaryText, 
          fontSize: 30,
       ),
      ),
     Text(
      authConn.auth.currentUser!.email!, 
      style: TextStyle(color: AppColors.primaryText, 
      fontSize: 15,
      ),
    ),
                             
      ],
      ),
    ), 
             ],
       ),
    ),
    );
  }
}

