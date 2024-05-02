import 'package:finalbesttutor/services/apiservices.dart';
import 'package:flutter/material.dart';

class AllJobs extends StatefulWidget {
  const AllJobs({super.key});

  @override
  State<AllJobs> createState() => _AllJobsState();
}

class _AllJobsState extends State<AllJobs> {
  bool isReady = false;
  dynamic multidata;
  _gettutoralljobs() {
    isReady = true;
    Apiservices().gettutorjobdetails().then((value) {
      setState(() {
        multidata = value;
        isReady = false;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _gettutoralljobs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isReady == true
          ? Center(
              child: CircularProgressIndicator(),
            )
          :Column() ,
    );
  }
}
