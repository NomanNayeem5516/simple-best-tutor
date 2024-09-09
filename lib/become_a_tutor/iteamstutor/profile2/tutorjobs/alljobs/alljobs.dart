import 'dart:convert';

import 'package:finalbesttutor/services/apiservices.dart';
import 'package:flutter/material.dart';

import '../../../../../hire_a_tutor/curvednavigationbar/itemesguardian/jobstatus/jobstatusitems/apointedjob/appointedjob.dart';
import '../../../../../model/tutordashboard/alljobmodel.dart';
import 'package:http/http.dart' as http;

class AllJobs extends StatefulWidget {
  const AllJobs({super.key});

  @override
  State<AllJobs> createState() => _AllJobsState();
}

class _AllJobsState extends State<AllJobs> {


  Future<AlljobModel> getalljob() async {
    final response =
        await http.get(Uri.parse('https://api.besttutor.xyz/api/all-job'));

    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {

      return AlljobModel.fromJson(data);
    } else {
      return AlljobModel.fromJson(data);
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<AlljobModel>(
          future: getalljob(),
          builder: (context, snapshot) {
            if(snapshot.hasData){
              return ListView.builder(
                itemCount: snapshot.data?.jobs?.length ?? 0,
                itemBuilder: (context, index) {
                  final job = snapshot.data?.jobs![index];
                  return ListTile(
                    title: Text('ID: ${job?.id}\nInstitute Name: ${job?.instituteName ?? "N/A"}'),
                  );
                },
              );

            }else{
              return Text('loading');
            }


          }),
    );
  }
}
