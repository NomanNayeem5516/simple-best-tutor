import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../../../../routes/routesname.dart';
import '../../../../../../../services/apiservices.dart';

class PendingJobgerrdian extends StatefulWidget {
  const PendingJobgerrdian({super.key});

  @override
  State<PendingJobgerrdian> createState() => _PendingJobgerrdianState();
}

class _PendingJobgerrdianState extends State<PendingJobgerrdian>
    with AutomaticKeepAliveClientMixin {
  bool isReady = false;
  dynamic multiData;

  _getpendingJob() {
    isReady = true;
    Apiservices().getguardianjob().then((value) {
      setState(() {
        multiData = value;
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
                if(job["status"] == "0"){
                  return Card(
                    elevation: 3,
                    margin: EdgeInsets.all(8),
                    child: ListTile(
                      title: Text(
                        "Need ${job["category_names"][0]} Tutor For"
                            " ${job["class_or_course_names"].join(", ")} Student - ${job["days_of_week"]}"
                            "  Days/Week ",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              "Job ID: ${job["id"]} Posted Date:${job["created_at"]} ",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold)),

                          Row(
                            children: [
                              Icon(Icons.book),
                              SizedBox(width: 10,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Tuition Type',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    '${job["tuition_type"]["name"]}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.monetization_on),
                              SizedBox(width: 10,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Salary',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    '${job["salary"]}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.subject),
                              SizedBox(width: 10,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Subject',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    ' ${job["class_or_course_names"].join(", ")}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.location_on_rounded),
                              SizedBox(width: 10,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Location',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    ' ${job["area"]["name"]} , ${job["district"]["name"]}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.location_on_rounded),
                              SizedBox(width: 10,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Special Requirement',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    ' ${job["more_requirement"]}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),


                          Row(
                            children: [
                              Icon(
                                job["student_gender"] == 'male'
                                    ? Icons.male
                                    : job["student_gender"] == 'female'
                                    ? Icons.female
                                    : Icons.person,
                                color: Colors.blue,
                              ),
                              SizedBox(width: 8),
                              Text(
                                'Student Gender: ${job["student_gender"] ?? "Not specified"}',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                job["tutor_gender"] == 'male'
                                    ? Icons.male
                                    : job["tutor_gender"] == 'female'
                                    ? Icons.female
                                    : Icons.person,
                                color: Colors.blue,
                              ),
                              SizedBox(width: 8),
                              Text(
                                'Tutor Preferred: ${job["tutor_gender"] ?? "Not specified"}',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              ElevatedButton(onPressed: (){
                                Get.toNamed(RouteName.pendingjobdtails);

                              }, child: Text('Details')),
                              SizedBox(width: 20,),
                              ElevatedButton(onPressed: (){
                                _openLocationInMap(job["area"]["name"], job["district"]["name"]);
                              }, child: Text('Location'))
                            ],
                          )

                          // Text("Guardian Name: ${job["guardian_name"]}"),
                          // Text("Guardian Mobile: ${job["guardian_mobile"]}"),
                          // Text("Country: ${job["country"]["name"]}"),
                          // Text("Division: ${job["division"]["name"]}"),
                          // Text("District: ${job["district"]["name"]}"),
                          // Text("Area: ${job["area"]["name"]}"),
                          // Text("Institute Name: ${job["institute_name"]}"),
                          // Text("Number of Students: ${job["number_of_student"]}"),
                          // Text("Days of Week: ${job["days_of_week"]}"),
                          // Text("Hire Date: ${job["hire_date"]}"),
                          // Text("Salary: ${job["salary"]}"),
                          // Text(
                          //     "Class or Course: ${job["class_or_course_names"].join(", ")}"),
                          // Text("Tuition Type: ${job["tuition_type"]["name"]}"),
                          // Text("Subject Names: ${job["subject_names"].join(", ")}"),
                          // Text("Student Gender: ${job["student_gender"]}"),
                          // Text("Tutor Gender: ${job["tutor_gender"]}"),
                          // Text("More Requirement: ${job["more_requirement"]}"),
                          // Text("Address Details: ${job["address_details"]}"),
                          // Text("Application Fee: ${job["application_fee"]}"),
                          // Text("First Installment: ${job["first_installment"]}"),
                          // Text(
                          //     "Auto Approval Status: ${job["auto_approval_status"]}"),
                          // Text("Status: ${job["status"]}"),
                          // Text("ID: ${job["id"]}"),
                          // Text("Created At: ${job["created_at"]}"),
                        ],
                      ),
                    ),
                  );
                }
              },
            ),
    );
  }


  // Function to open location in map application
  void _openLocationInMap(String area, String district) {
    String formattedArea = Uri.encodeComponent(area);
    String formattedDistrict = Uri.encodeComponent(district);
    String googleMapsUrl = 'https://www.google.com/maps/search/?api=1&query=$formattedArea,$formattedDistrict';
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LocationWebView(url: googleMapsUrl),
      ),
    );
  }





}


class LocationWebView extends StatefulWidget {
  final String url;

  const LocationWebView({Key? key, required this.url}) : super(key: key);

  @override
  _LocationWebViewState createState() => _LocationWebViewState();
}

class _LocationWebViewState extends State<LocationWebView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Location'),
      ),
      body: WebView(
        initialUrl: widget.url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}


