import 'dart:convert';
import 'dart:typed_data';
import 'package:cached_network_image/cached_network_image.dart'; // Import CachedNetworkImage
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../colors/colors.dart';
import '../../../../model/profilemodel.dart';
import '../../../../routes/routesname.dart';
import '../../../../services/apiservices.dart';
import 'package:finalbesttutor/welcome/login.dart'; // Import your login page

class ProfilePage2 extends StatefulWidget {
  final profileModel profile;

  const ProfilePage2({Key? key, required this.profile}) : super(key: key);

  @override
  State<ProfilePage2> createState() => _ProfilePage2State();
}

class _ProfilePage2State extends State<ProfilePage2> {
  String uploadedimage='';
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // uploadedimage==""?const SizedBox():Container(
                  //   height: 100,
                  //   width: 100,
                  //   decoration: BoxDecoration(
                  //       color: Colors.teal,
                  //       image: DecorationImage(
                  //           image: NetworkImage(uploadedimage)
                  //       )
                  //   ),
                  // ),
                  Image.network(
                      height: 300,
                      width: 300,
                      widget.profile.image ?? 'https://via.placeholder.com/150'),
                  ListTile(
                    title: Text('Tutor ID: ${widget.profile.id}'),
                  ),
                  ListTile(
                    title: Text('Name: ${widget.profile.name}'),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.orangeAccent,
                      borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    child: ListTile(
                      title: Center(child: Text('Profile Completed: ${widget.profile.percentage ?? "N/A"}%')),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    child: ListTile(
                      title: Center(child: TextButton(
                        onPressed: (){
                          Get.toNamed(RouteName.profile2);
                        },
                        child: Text('Viwe Profile'),
                      )),
                    ),
                  ),

                  ListTile(
                    title: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.email_outlined),
                        SizedBox(width: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Email',style: TextStyle(
                                fontSize: 20
                            ),),
                            Text(' ${widget.profile.email}'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    title: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.call),
                        SizedBox(width: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Mobile',style: TextStyle(
                                fontSize: 20
                            ),),
                            Text(' ${widget.profile.mobile}'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    title: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.location_on_rounded),
                        SizedBox(width: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('PresentAddress',style: TextStyle(
                                fontSize: 20
                            ),),
                            Text(widget.profile.primaryInfo?.presentAddress ?? "N/A"),
                          ],
                        ),
                      ],
                    ),
                  ),


                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () async {
                          final ImagePicker picker = ImagePicker();
                          final XFile? image= await picker.pickImage(source: ImageSource.gallery);

                          if(image!= null){
                            Uint8List bytes = await image.readAsBytes();

                            Apiservices().uploadimage(bytes, image.name).then((value) {
                              print('Response${value.toString()}');

                              setState(() {
                                uploadedimage=value['location'].toString();
                              });

                            }).onError((error, stackTrace) {
                              print(error.toString());
                            });
                          }
                        },
                        child: Container(
                          height: 50,
                          width: 170,
                          child: Center(
                            child: Text(
                              'Change Image',
                              style: TextStyle(
                                  fontSize: 17, color: Appcolors.whiteColor),
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: Appcolors.ashColor,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          Get.toNamed(RouteName.setting);
                        },
                        child: Container(
                          height: 50,
                          width: 170,
                          child: Center(
                            child: Text(
                              'Setting',
                              style: TextStyle(
                                  fontSize: 17, color: Appcolors.whiteColor),
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: Appcolors.ashColor,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),

                  InkWell(
                    onTap: () => _logout(context),
                    child: Container(
                      height: 50,
                      width: 400,
                      child: Center(
                        child: Text(
                          'Log Out',
                          style: TextStyle(
                              fontSize: 17, color: Appcolors.whiteColor),
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Appcolors.ashColor,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _logout(BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear(); // Clear all saved data
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => LoginPage2()),
          (route) => false, // Prevent back navigation to ProfilePage
    );
  }
}

class FlottingactionButton2 extends StatefulWidget {
  const FlottingactionButton2({Key? key}) : super(key: key);

  @override
  State<FlottingactionButton2> createState() => _FlottingactionButton2State();
}

class _FlottingactionButton2State extends State<FlottingactionButton2> {
  late profileModel userProfile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<profileModel>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return ProfilePage2(profile: snapshot.data!);
          }
        },
      ),
    );
  }

  Future<profileModel> getData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('access_token');
    //String? role = prefs.getString('role');
    //bool? isLoggedIn = prefs.getBool('isLoggedIn');
    //print("isLoggedIn $isLoggedIn");
    //print("role $role");
    //print("Token $token");
    final response = await http.get(
      Uri.parse('https://api.besttutor.xyz/api/profile'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      //var jsonData = jsonDecode(response.body);
      var userJson = jsonData; // Since the user data is directly in the response
      profileModel userProfile = profileModel.fromJson(userJson);
      return userProfile;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
