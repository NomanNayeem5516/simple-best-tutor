
import 'package:finalbesttutor/hire_a_tutor/curvednavigationbar/itemesguardian/profile/jobstatus/jobstatusitems/apointedjob/appointedjob.dart';
import 'package:finalbesttutor/hire_a_tutor/curvednavigationbar/itemesguardian/profile/jobstatus/jobstatusitems/canceledjob/canceljob.dart';
import 'package:finalbesttutor/hire_a_tutor/curvednavigationbar/itemesguardian/profile/jobstatus/jobstatusitems/livejob/livejob.dart';
import 'package:flutter/material.dart';

import 'jobstatusitems/confarmjob/confarmedjob.dart';
import 'jobstatusitems/pendingjob/pendingjob.dart';

class Jobstatus extends StatefulWidget {
  const Jobstatus({super.key});

  @override
  State<Jobstatus> createState() => _JobstatusState();
}

class _JobstatusState extends State<Jobstatus> with SingleTickerProviderStateMixin{
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
                icon: Icon(Icons.running_with_errors),text: 'Pending Job',
              ),
              Tab(
                icon: Icon(Icons.live_tv),text: 'Live Job',
              ),
              Tab(
                icon: Icon(Icons.approval_outlined),text: 'Appointed Job',
              ),
              Tab(
                icon: Icon(Icons.confirmation_number_sharp),text: 'Confirmed Job',
              ),
              Tab(
                icon: Icon(Icons.cancel),text: 'Cancel Job',
              ),

            ],
          ),
        ),
        body: TabBarView(
          controller: controller,
          children: [
            PendingJobgerrdian(),
            LiveJobgerrdian(),
            AppointedJobGerdian(),
            ConfarmedJobGerdian(),
            CancelJobGerdian()
          ],
        ),

    );
  }
}
