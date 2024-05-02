



import 'package:finalbesttutor/become_a_tutor/curvednavbar2.dart';
import 'package:finalbesttutor/become_a_tutor/iteamstutor/profile2/profile2/credentialinfo.dart';
import 'package:finalbesttutor/become_a_tutor/iteamstutor/profile2/profile2/educationalinfo.dart';
import 'package:finalbesttutor/become_a_tutor/iteamstutor/profile2/profile2/personalinfo.dart';
import 'package:finalbesttutor/become_a_tutor/iteamstutor/profile2/profile2/quiz.dart';
import 'package:finalbesttutor/become_a_tutor/iteamstutor/profile2/profile2/tutionrelatedinfo.dart';
import 'package:finalbesttutor/become_a_tutor/iteamstutor/profile2/profile2/viwe/downloadcv.dart';
import 'package:finalbesttutor/become_a_tutor/iteamstutor/profile2/profile2/viweprofile.dart';
import 'package:finalbesttutor/hire_a_tutor/curvednavigationbar/itemesguardian/profile/jobstatus/jobstatusitems/pendingjob/pendingjob_details.dart';
import 'package:finalbesttutor/hire_a_tutor/curvednavigationbar/itemesguardian/profile/setting/setting.dart';
import 'package:finalbesttutor/hire_a_tutor/curvednavigationbar/itemesguardian/profile/setting/settings/name.dart';
import 'package:finalbesttutor/hire_a_tutor/curvednavigationbar/itemesguardian/profile/setting/settings/password.dart';
import 'package:finalbesttutor/hire_a_tutor/curvednavigationbar/itemesguardian/profile/setting/settings/phone.dart';
import 'package:finalbesttutor/welcome/guardianotp.dart';
import 'package:finalbesttutor/welcome/registration.dart';
import 'package:finalbesttutor/routes/routesname.dart';
import 'package:finalbesttutor/welcome/splashscreen.dart';
import 'package:finalbesttutor/welcome/tutorotp.dart';
import 'package:finalbesttutor/welcome/welcomepage.dart';
import 'package:get/get.dart';

import '../become_a_tutor/iteamstutor/profile2/flottingactionbutton2.dart';
import '../become_a_tutor/iteamstutor/profile2/profile2.dart';
import '../hire_a_tutor/curvednavigationbar/curvednavigationbar.dart';

import '../hire_a_tutor/curvednavigationbar/itemesguardian/profile/flottingactionbutton.dart';
import '../welcome/login.dart';

class AppRoures{
  static approute()=>[
    GetPage(name: RouteName.splashscreen, page: ()=> SplashScreen(),
        transitionDuration: Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade
    ),
    GetPage(name: RouteName.welcomepage, page: ()=> WelcomePage(),
        transitionDuration: Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade
    ),
    GetPage(name: RouteName.signinpage, page: ()=> LoginPage2(),
        transitionDuration: Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade
    ),
    GetPage(name: RouteName.registrationpage, page: ()=> RegistrationPage(),
        transitionDuration: Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade
    ),
    GetPage(name: RouteName.curvednavbar, page: ()=> Curvednavigationbar(),
        transitionDuration: Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade
    ),

    GetPage(name: RouteName.curvednavbar2, page: ()=> Curvednav2(),
        transitionDuration: Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade
    ),
    GetPage(name: RouteName.tutorotp, page: ()=> Tutorotp(),
        transitionDuration: Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade
    ),
    GetPage(name: RouteName.guardianotp, page: ()=> Guardianotp(),
        transitionDuration: Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade
    ),
    GetPage(name: RouteName.flotingactionbutton, page: ()=> FlottingactionButton(),
        transitionDuration: Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade
    ),
    GetPage(name: RouteName.setting, page: ()=> Setting(),
        transitionDuration: Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade
    ),
    GetPage(name: RouteName.name, page: ()=> Name(),
        transitionDuration: Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade
    ),
    GetPage(name: RouteName.phone, page: ()=> Phone(),
        transitionDuration: Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade
    ),
    GetPage(name: RouteName.password, page: ()=> Password(),
        transitionDuration: Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade
    ),



    GetPage(name: RouteName.flottingactionbutton2, page: ()=> FlottingactionButton2(),
        transitionDuration: Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade
    ),
    GetPage(name: RouteName.profile2, page: ()=> Profile2(),
        transitionDuration: Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade
    ),

    GetPage(name: RouteName.tutionrelated, page: ()=> TutionrelatedInfo(),
        transitionDuration: Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade
    ),
    GetPage(name: RouteName.educational, page: ()=> EducationalInfo(),
        transitionDuration: Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade
    ),
    GetPage(name: RouteName.personal, page: ()=> PersonalInfo(),
        transitionDuration: Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade
    ),
    GetPage(name: RouteName.credential, page: ()=> CredentialInfo(),
        transitionDuration: Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade
    ),
    GetPage(name: RouteName.quiz, page: ()=> Quiz(),
        transitionDuration: Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade
    ),
    GetPage(name: RouteName.viweprofile, page: ()=> ViweProfile(),
        transitionDuration: Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade
    ),
    GetPage(name: RouteName.viwe_downloadcv, page: ()=> Viwe_Download_cv(),
        transitionDuration: Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade
    ),
    GetPage(name: RouteName.pendingjobdtails, page: ()=> PendingJobDetails(),
        transitionDuration: Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade
    ),




  ];
}