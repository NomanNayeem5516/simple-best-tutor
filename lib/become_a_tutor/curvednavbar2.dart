import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:finalbesttutor/become_a_tutor/iteamstutor/dashboardtutor.dart';
import 'package:finalbesttutor/become_a_tutor/iteamstutor/joblist.dart';
import 'package:finalbesttutor/become_a_tutor/iteamstutor/jobpost2.dart';
import 'package:finalbesttutor/become_a_tutor/iteamstutor/nearbyjob.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../routes/routesname.dart';
class Curvednav2 extends StatefulWidget {
  const Curvednav2({super.key});

  @override
  State<Curvednav2> createState() => _Curvednav2State();
}

class _Curvednav2State extends State<Curvednav2> {

  var page = 2;
  final _pages = [Joblist(), Jobpost2(), NearbyJob(), TutorDashboard()];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            Get.toNamed(RouteName.flottingactionbutton2);
          },
          child: Image.asset('images/profile.png'),
        ),


        bottomNavigationBar: CurvedNavigationBar(
          color: Colors.white,
          buttonBackgroundColor: Colors.red,
          backgroundColor: Colors.white,
          index: 0,
          onTap: (index) {
            setState(() {
              page = index;
            });
          },
          items: [
            Icon(Icons.dashboard_rounded),
            Icon(Icons.local_post_office),
            Icon(Icons.ac_unit_sharp),
            Icon(Icons.confirmation_number),
          ],
        ),
        body: _pages[page],
      ),
    );
  }
}
