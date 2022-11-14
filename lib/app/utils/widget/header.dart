import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:tas_management_app/app/routes/app_pages.dart';
import 'package:tas_management_app/app/utils/widget/style/AppColors.dart';

class header extends StatelessWidget {
  const header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:Get.height * 0.1, 
      child: Padding(
        padding: const EdgeInsets.only(left: 40, right: 40, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Column(
         // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Task Management',
              style: TextStyle(fontSize: 20, color: AppColors.primaryText),
              ),
            Text(
              'Manage Task Made Easy with Friends',
                style: TextStyle(fontSize: 15, color: AppColors.primaryText),
                ),
          ],
          ),
          const Spacer(flex: 1),
          Expanded(
            flex: 1,
            child: TextField(
            decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            contentPadding: 
                EdgeInsets.only(left: 40, right: 10),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Colors.white), 
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Colors.blue), 
              ),
              prefixIcon: Icon(
                Icons.search,
                color: Colors.black,),
              hintText: 'Seacrh',

            ),
            ),
          ),
          const SizedBox(
            width: 20,
            ),
        const Icon(Ionicons.notifications, 
              color: AppColors.primaryText),
        const SizedBox(
            width: 20,
           ),
          GestureDetector(
            onTap: () {
              Get.defaultDialog(
                title: 'Sign Out',
                content: const Text(
                  'Are you sure want to Sign Out?'),
                cancel: ElevatedButton(
                  onPressed: () => Get.back(),
                  child: const Text(
                    'Cancel'),
                  ), 
                confirm:  ElevatedButton(
                  onPressed: () => Get.toNamed(Routes.LOGIN),  
                  child: const Text(
                    'Sign Out'),
                ),
              );
            },
            child: Row(
                children: const [
                    Text(
                      'Sign Out', 
                      style: TextStyle(color: AppColors.primaryText, fontSize: 15), 
                    ),
                    SizedBox(
                        width: 5,
            ),
            Icon
            (Ionicons.log_out_outline, 
            color: AppColors.primaryText,
            size: 30,
          ),
          ],
          ),
            ), 
      ]),
    ),
    );
  }
}

