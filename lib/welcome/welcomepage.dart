import 'dart:async';

import 'package:finalbesttutor/colors/colors.dart';
import 'package:finalbesttutor/routes/routesname.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class WelcomePage extends StatefulWidget {
  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

final List<String> imagePaths = [
  "images/grouptutor.jpg",
  "images/hometutor.jpeg",
  "images/packagetutor.jpg",
  "images/onlinrtutor.jpg"
];
int _actingpage = 0;
final PageController _pageController = PageController(initialPage: 0);
late List<Widget> _pages;
Timer? _timer;

class _WelcomePageState extends State<WelcomePage> {
  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (_pageController.page == imagePaths.length - 1) {
        _pageController.animateToPage(0,
            duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
      } else {
        _pageController.nextPage(
            duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pages = List.generate(
        imagePaths.length,
        (index) => Imageplaceholder(
              imagepath: imagePaths[index],
            ));
    startTimer();
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Best Tutor"),
          automaticallyImplyLeading: false,
          actions: [
            TextButton(
                onPressed: () {
                  Get.toNamed(RouteName.signinpage);
                },
                child: Text(
                  'Sign In',
                  style: TextStyle(
                      fontSize: 15, color: Appcolors.blueColor),
                )),
            TextButton(
                onPressed: () {},
                child: Text(
                  'Tuition List',
                  style: TextStyle(
                      fontSize: 15, color: Appcolors.blueColor),
                )),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              'icons/abcd.svg',
              //color: Appcolors.whiteColor,
              height: 50.h,
              width: 100.w,
            ),
            Column(
              children: [
                Text(
                  "Connect and learn with the best and largest tutor ",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Text(
                  "community in Bangladesh. ",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Image.asset(
                  'images/tutor_animate.gif',
                  width: 200,
                  height: 200,
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.toNamed(RouteName.registrationpage);
                      },
                      child: Container(
                        height: 50,
                        width: 200,
                        child: Center(
                            child: Text(
                          'Hire a Tutor(It is Free)',
                          style: TextStyle(
                              fontSize: 15, color: Appcolors.blueColor),
                        )),
                        decoration: BoxDecoration(
                            color: Appcolors.whiteColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                        Get.toNamed(RouteName.registrationpage);
                      },
                      child: Container(
                        height: 50,
                        width: 200,
                        child: Center(
                            child: Text(
                          'Become a Tutor',
                          style: TextStyle(
                              fontSize: 15, color: Appcolors.whiteColor),
                        )),
                        decoration: BoxDecoration(
                            color: Appcolors.ashColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                      ),
                    ),
                  ],
                )
              ],
            ),
            Stack(children: [
              SizedBox(
                width: double.infinity,
                height: 160.h,
                child: PageView.builder(
                    controller: _pageController,
                    itemCount: imagePaths.length,
                    onPageChanged: (value) {
                      setState(() {
                        _actingpage = value;
                      });
                    },
                    itemBuilder: (context, index) {
                      return _pages[index];
                    }),
              ),
              Positioned(
                  bottom: 10,
                  left: 0,
                  right: 0,
                  child: Container(
                    color: Colors.transparent,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List<Widget>.generate(
                          _pages.length,
                          (index) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: InkWell(
                                  onTap: () {
                                    _pageController.animateToPage(index,
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.easeIn);
                                  },
                                  child: CircleAvatar(
                                    radius: 3,
                                    backgroundColor: _actingpage == index
                                        ? Colors.yellowAccent
                                        : Colors.grey,
                                  ),
                                ),
                              )),
                    ),
                  ))
            ])
          ],
        ),
      ),
    );
  }
}

class Imageplaceholder extends StatelessWidget {
  final String? imagepath;
  const Imageplaceholder({super.key, this.imagepath});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagepath!,
      fit: BoxFit.cover,
    );
  }
}
