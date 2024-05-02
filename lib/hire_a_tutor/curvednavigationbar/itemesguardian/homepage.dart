import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../../../../services/apiservices.dart';


class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> with AutomaticKeepAliveClientMixin{

  bool isReady = false;
  dynamic multiData;


  _getpendingJob (){
    isReady = true;
    Apiservices().getguardianjob().then((value) {
      setState(() {
        multiData=value;
        isReady = false;
      });
    });
  }

  @override
  void initState() {
    _getpendingJob();
    super.initState();
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: isReady == true
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: multiData.length,
        itemBuilder: (context, index) {
          var job = multiData[index];
          return ListTile(

            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // Add more fields as needed
              ],
            ),
          );
        },
      ),
    );
  }

}
