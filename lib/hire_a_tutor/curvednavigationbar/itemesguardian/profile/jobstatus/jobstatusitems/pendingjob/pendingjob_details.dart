import 'package:flutter/material.dart';



import '../../../../../../../services/apiservices.dart';
class PendingJobDetails extends StatefulWidget {
  const PendingJobDetails({super.key});

  @override
  State<PendingJobDetails> createState() => _PendingJobDetailsState();
}

class _PendingJobDetailsState extends State<PendingJobDetails>
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
                      Icon(Icons.request_page),
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
                      Icon(Icons.people),
                      SizedBox(width: 10,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Student Gender',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            ' ${job["student_gender"]}',
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
                      Icon(Icons.access_time),
                      SizedBox(width: 10,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Tutoring Time',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            ' ${job["hire_date"]}',
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
                      Icon(Icons.date_range),
                      SizedBox(width: 10,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Tutoring Days',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            ' ${job["days_of_week"]} Days/Week',
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
                      Icon(Icons.format_list_numbered_sharp),
                      SizedBox(width: 10,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Number of Student',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            ' ${job["number_of_student"]} ',
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
                      Icon(Icons.school),
                      SizedBox(width: 10,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Preferable Institute',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            ' ${job["institute_name"]} ',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),

                          SizedBox(width: 20,),
                          ElevatedButton(onPressed: (){

                          }, child: Text('Direction'))

                        ],
                      ),
                    ],
                  ),
            
            
            
            
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
        },
      ),
    );
  }
}
