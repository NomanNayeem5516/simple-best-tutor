import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../model/jobModels/myjoblistmodel.dart';

class NearbyJob extends StatefulWidget {
  const NearbyJob({Key? key}) : super(key: key);

  @override
  State<NearbyJob> createState() => _NearbyJobState();
}

class _NearbyJobState extends State<NearbyJob> {
  late List<Jobs> _jobList = [];
  bool _isLoading = false;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    _fetchJobs();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _fetchJobs() async {
    setState(() {
      _isLoading = true;
    });

    final response = await http.get(Uri.parse('https://api.besttutor.xyz/api/all-job?country_id=1&division_id=1&district_id=1&area_id=3&related_areas_ids=1,3'));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      setState(() {
        _jobList = (jsonData['jobs'] as List)
            .map((jobJson) => Jobs.fromJson(jobJson))
            .toList();
        _isLoading = false;
      });
    } else {
      throw Exception('Failed to load jobs');
    }
  }

  void _scrollListener() {
    if (_scrollController.offset >= _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      _fetchJobs(); // Load more jobs when scrolled to the bottom
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nearby Job"),
      ),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: _jobList.length + 1,
        itemBuilder: (context, index) {
          if (index < _jobList.length) {
            final job = _jobList[index];
            return Card(
              child: ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Need ${job.categoryNames?.join(", ")} Tutor For',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Text(
                          '${job.classOrCourseNames?.join(", ")}',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          ' - ${job.daysOfWeek ?? "Not specified"} Days/Week',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'Job ID:${job.id ?? "Not specified"} Posted Date:${job.createdAt ?? "Not specified"}',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                subtitle: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.type_specimen,
                          size: 30,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Tutor Type',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              ' ${job.tuitionType?.name ?? "Not specified"}',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.attach_money,
                          size: 30,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Salary',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              '${job.salary ?? "Not specified"} ',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.location_on_rounded,
                          size: 30,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Location',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              '${job.area?.name ?? "Not specified"}, ${job.district?.name ?? "Not specified"}, ${job.division?.name ?? "Not specified"}, ${job.country?.name ?? "Not specified"}',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.subject,
                          size: 30,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Special Requirement',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              ' ${job.moreRequirement ?? "Not specified"}',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          job.tutorGender == 'Male'
                              ? Icons.male
                              : job.tutorGender == 'Female'
                              ? Icons.female
                              : Icons.person,
                          color: Colors.blue,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Tutor Preferred: ${job.tutorGender ?? "Not specified"}',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                // You can display other details in the subtitle if needed
              ),
            );
          } else if (_isLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
