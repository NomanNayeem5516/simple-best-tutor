import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

import '../../../../../routes/routesname.dart';
class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Setting'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(height: 20.h),
            InkWell(
              onTap: (){
                Get.toNamed(RouteName.name);
              },
              child: Stack(

                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.all(Radius.circular(15))
                    ),
                    height: 150,

                  ),
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Positioned(
                            bottom: 18,left: 20,
                            child: CircleAvatar(radius: 50,
                        backgroundColor: Colors.orange,
                          child: Icon(Icons.settings,size: 50,),
                        )),
                        Text('Name',style: TextStyle(
                          fontSize: 30
                        ),),
                        Icon(Icons.arrow_right_alt,size: 50,),
                      ],
                    ),
                  )
                ]
              ),
            ),
            SizedBox(height: 20.h),
            InkWell(
              onTap: (){
                Get.toNamed(RouteName.phone);
              },
              child: Stack(

                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.all(Radius.circular(15))
                      ),
                      height: 150,

                    ),
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Positioned(
                              bottom: 18,left: 20,
                              child: CircleAvatar(radius: 50,
                                backgroundColor: Colors.orange,
                                child: Icon(Icons.phone,size: 50,),
                              )),
                          Text('Phone',style: TextStyle(
                              fontSize: 30
                          ),),
                          Icon(Icons.arrow_right_alt,size: 50,),
                        ],
                      ),
                    )
                  ]
              ),
            ),
            SizedBox(height: 20.h),
            InkWell(
              onTap: (){
                Get.toNamed(RouteName.password);
              },
              child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.all(Radius.circular(15))
                      ),
                      height: 150,

                    ),
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Positioned(
                              bottom: 18,left: 20,
                              child: CircleAvatar(radius: 50,
                                backgroundColor: Colors.orange,
                                child: Icon(Icons.password,size: 50,),
                              )),
                          Text('Password',style: TextStyle(
                              fontSize: 30
                          ),),
                          Icon(Icons.arrow_right_alt,size: 50,),
                        ],
                      ),
                    )
                  ]
              ),
            )
          ],
        ),
      ),

    );
  }
}
