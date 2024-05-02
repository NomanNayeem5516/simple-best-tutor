import 'dart:convert';
import 'dart:typed_data';
import 'package:finalbesttutor/model/noticemodel.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/jobModels/nearbyjobmodel.dart';

class Apiservices {


  Future<dynamic> uploadimage(Uint8List bytes, String filename) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('access_token');

    var request = http.MultipartRequest(
      'post',
      Uri.parse('https://api.besttutor.xyz/api/profileUpdate'),
    );

    // Adding the authorization header
    request.headers['Authorization'] = 'Bearer $token';

    var multipartfile = http.MultipartFile(
      'image',
      http.ByteStream.fromBytes(bytes),
      bytes.length,
      filename: filename,
    );

    request.files.add(multipartfile);

    StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var data = await response.stream.bytesToString();
      return jsonDecode(data);
    } else {
      return null;
    }
  }

  Future<dynamic?> getnotice() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('access_token');

      var response = await http.get(
        Uri.parse('https://api.besttutor.xyz/api/notice'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final model = json.decode(response.body);
        return model;
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  Future<dynamic> getguardianjob() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('access_token');

      var response = await http.get(
        Uri.parse('https://api.besttutor.xyz/api/guardian/job'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final model = json.decode(response.body);
        return model;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<dynamic> getguardianjobdetails() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('access_token');

      var response = await http.get(
        Uri.parse('https://api.besttutor.xyz/api/guardian/job/177'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final model = json.decode(response.body);
        return model;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }


  Future<dynamic> gettutorjobdetails() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('access_token');

      var response = await http.get(
        Uri.parse('https://api.besttutor.xyz/api/all-job'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final model = json.decode(response.body);
        return model;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

}


  









