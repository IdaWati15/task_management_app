import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tas_management_app/app/utils/widget/sideBar.dart';
import 'package:tas_management_app/app/utils/widget/style/AppColors.dart';


class myTask extends SideBar{
  const myTask({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: ListView(
        clipBehavior: Clip.antiAlias
        ,scrollDirection: Axis.horizontal,
    shrinkWrap: true,
    children: [
      Container(width: 400,decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
      color: AppColors.cardBg, ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Row(
          children:[
        ClipRRect(borderRadius: BorderRadius.circular(25),
         child: CircleAvatar(backgroundColor: Colors.amber, radius: 20,
         foregroundImage: NetworkImage( 'https://static.independent.co.uk/s3fs-public/thumbnails/image/2017/09/27/08/jennifer-lawrence.jpg?quality=75&width=982&height=726&auto=webp%27',
         ),
         ),
         ),
         ClipRRect(borderRadius: BorderRadius.circular(25),
         child: CircleAvatar(backgroundColor: Colors.amber, radius: 20,
         foregroundImage: NetworkImage( 'https://static.independent.co.uk/s3fs-public/thumbnails/image/2017/09/27/08/jennifer-lawrence.jpg?quality=75&width=982&height=726&auto=webp%27',
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
      ),
      Container(width: 400,decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
      color: AppColors.cardBg, ),
       margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Row(
          children:[
        ClipRRect(borderRadius: BorderRadius.circular(25),
         child: CircleAvatar(backgroundColor: Colors.amber, radius: 20,
         foregroundImage: NetworkImage( 'https://static.independent.co.uk/s3fs-public/thumbnails/image/2017/09/27/08/jennifer-lawrence.jpg?quality=75&width=982&height=726&auto=webp%27',
         ),
         ),
         ),
         ClipRRect(borderRadius: BorderRadius.circular(25),
         child: CircleAvatar(backgroundColor: Colors.amber, radius: 20,
         foregroundImage: NetworkImage( 'https://static.independent.co.uk/s3fs-public/thumbnails/image/2017/09/27/08/jennifer-lawrence.jpg?quality=75&width=982&height=726&auto=webp%27',
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
      ),
       Container(width: 400,decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
      color: AppColors.cardBg, ),
       margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Row(
          children:[
        ClipRRect(borderRadius: BorderRadius.circular(25),
         child: CircleAvatar(backgroundColor: Colors.amber, radius: 20,
         foregroundImage: NetworkImage( 'https://static.independent.co.uk/s3fs-public/thumbnails/image/2017/09/27/08/jennifer-lawrence.jpg?quality=75&width=982&height=726&auto=webp%27',
         ),
         ),
         ),
         ClipRRect(borderRadius: BorderRadius.circular(25),
         child: CircleAvatar(backgroundColor: Colors.amber, radius: 20,
         foregroundImage: NetworkImage( 'https://static.independent.co.uk/s3fs-public/thumbnails/image/2017/09/27/08/jennifer-lawrence.jpg?quality=75&width=982&height=726&auto=webp%27',
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
      ),
       Container(width: 400,decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
      color: AppColors.cardBg, ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Row(
          children:[
        ClipRRect(borderRadius: BorderRadius.circular(25),
         child: CircleAvatar(backgroundColor: Colors.amber, radius: 20,
         foregroundImage: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/2/20/20220121%E2%80%94Tzuyu_Campaign_Film%2C_Pearlygates_x_Twice_2022.jpg',
         ),
         ),
         ),
         ClipRRect(borderRadius: BorderRadius.circular(25),
         child: CircleAvatar(backgroundColor: Colors.amber, radius: 20,
         foregroundImage: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/2/20/20220121%E2%80%94Tzuyu_Campaign_Film%2C_Pearlygates_x_Twice_2022.jpg',
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
      ),
     
     ],
    
    ),
    );
  }
}
