import 'package:flutter/material.dart';
import 'package:tas_management_app/app/utils/widget/style/AppColors.dart';
import 'package:get/get.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(child: 
    !context.isPhone? Row(
      children:[
    Expanded(
      child: ClipRRect(
           child: CircleAvatar(
            backgroundColor: Colors.amber, 
            radius: 150,
            foregroundImage: NetworkImage(
              'https://static.independent.co.uk/s3fs-public/thumbnails/image/2017/09/27/08/jennifer-lawrence.jpg?quality=75&width=982&height=726&auto=webp%27',
           ),
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
        'Alicia Jasmine', 
        style: TextStyle(
          color: AppColors.primaryText,
          fontSize: 30,
            ),
           ),
      Text(
        'alicia@gmail.com', 
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
            'https://static.independent.co.uk/s3fs-public/thumbnails/image/2017/09/27/08/jennifer-lawrence.jpg?quality=75&width=982&height=726&auto=webp%27',
         ),
         ),
    ),
    SizedBox(
      height: 20,
      ),
    Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
      Text(
        'Alicia Jasmine',
        style: TextStyle(
          color: AppColors.primaryText, 
          fontSize: 30,
       ),
      ),
     Text(
      'alicia@gmail.com', 
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

