import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import '../../model/profilemodel.dart';
import '../../routes/routesname.dart';
import 'itemesguardian/confarmation.dart';
import 'itemesguardian/homepage.dart';
import 'itemesguardian/jobpost.dart';



class Curvednavigationbar extends StatefulWidget {
  const Curvednavigationbar({Key? key}) : super(key: key);

  @override
  State<Curvednavigationbar> createState() => _CurvednavigationbarState();
}

class _CurvednavigationbarState extends State<Curvednavigationbar> {
  var page = 0;
  final _pages = [Homepage(), Jobpost(), Confarmation()];

   late Future<profileModel> _profileData;

  @override
  void initState() {
    super.initState();
    _profileData = getData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FutureBuilder<profileModel>(
          future: _profileData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return FloatingActionButton(
                onPressed: () {
                  Get.toNamed(RouteName.flotingactionbutton);
                },
                // Displaying the user's profile image fetched from the backend
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(

                      snapshot.data!.image ?? ''),
                ),
              );
            } else if (snapshot.hasError) {
              return FloatingActionButton(
                onPressed: () {
                  Get.toNamed(RouteName.flotingactionbutton);
                },
                // Placeholder image or icon if there's an error fetching the image
                child: Icon(Icons.error),
              );
            }
            // Display a loading indicator while fetching the image
            return CircularProgressIndicator();
          },
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

Future<profileModel> getData() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('access_token');
  final response = await http.get(
    Uri.parse('https://api.softpark.xyz/api/profile'),
    headers: {
      'Authorization': 'Bearer $token',
    },
  );
  if (response.statusCode == 200) {
    var jsonData = jsonDecode(response.body);
    profileModel userProfile = profileModel.fromJson(jsonData);
    return userProfile;
  } else {
    throw Exception('Failed to load data');
  }
}
