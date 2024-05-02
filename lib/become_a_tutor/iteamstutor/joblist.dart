
import 'package:finalbesttutor/become_a_tutor/iteamstutor/profile2/tutorjobs/alljobs/alljobs.dart';
import 'package:finalbesttutor/become_a_tutor/iteamstutor/profile2/tutorjobs/filter/filter.dart';
import 'package:finalbesttutor/become_a_tutor/iteamstutor/profile2/tutorjobs/myoffer/MyOffer.dart';
import 'package:finalbesttutor/become_a_tutor/iteamstutor/profile2/tutorjobs/nearbyjobs/nearbyjobs.dart';
import 'package:finalbesttutor/hire_a_tutor/curvednavigationbar/itemesguardian/profile/jobstatus/jobstatusitems/apointedjob/appointedjob.dart';
import 'package:finalbesttutor/hire_a_tutor/curvednavigationbar/itemesguardian/profile/jobstatus/jobstatusitems/canceledjob/canceljob.dart';
import 'package:finalbesttutor/hire_a_tutor/curvednavigationbar/itemesguardian/profile/jobstatus/jobstatusitems/livejob/livejob.dart';
import 'package:flutter/material.dart';



class Joblist extends StatefulWidget {
  const Joblist({super.key});

  @override
  State<Joblist> createState() => _JoblistState();
}

class _JoblistState extends State<Joblist> with SingleTickerProviderStateMixin{
  TabController? controller;
  final screentitle =[
    'Pending Job',
    'Live Job',
    'Appointed Job',
    'Confirmed Job',
    'Canceled Job',
  ];
  @override
  void initState() {
    controller=TabController(length:5, vsync: this);
    controller!.addListener(() {
      setState(() {

      });
    });
    // TODO: implement initState
    super.initState();
  }
  @override
  void dispose() {
    controller!.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return
      // DefaultTabController(
      // length: 5,
      // child:
      Scaffold(
        appBar: AppBar(
          //backgroundColor: Colors.blue,
          title: Text(
            screentitle[controller!.index],
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          bottom: TabBar(
            controller: controller,
            isScrollable: true,
            tabs: [
              Tab(
                icon: Icon(Icons.running_with_errors),text: 'All Jobs',
              ),
              Tab(
                icon: Icon(Icons.live_tv),text: 'Nearby Jobs',
              ),
              Tab(
                icon: Icon(Icons.approval_outlined),text: 'My Jobs',
              ),
              Tab(
                icon: Icon(Icons.confirmation_number_sharp),text: 'Filter',
              ),


            ],
          ),
        ),
        body: TabBarView(
          controller: controller,
          children: [
            AllJobs(),
            NearByJobs(),
            MyOffer(),
            Filter(),

          ],
        ),

      );
  }
}
