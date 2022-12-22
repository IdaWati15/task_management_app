import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:tas_management_app/app/data/controller/auth_controller.dart';

class PeopleYouMayKnow extends StatelessWidget {
  final authCon = Get.find<AuthController>();


  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                 const Positioned(
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
    );
  }
}