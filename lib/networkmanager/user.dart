import 'dart:convert';

import 'package:flutter_application_1/networkmanager/secrets.dart';
import 'package:http/http.dart' as http;

class UserAPI {
  static Future create() async {
    //attach base to quesry
    var transferUrl = "/create";
    final encoding = Encoding.getByName('utf-8');
    var email = "await UserPrefrences.showEmail()";

    final headers = {
      'Content-Type': 'application/json',
    };
    final uri = Uri.http(
      BASETRANSFERURL,
      transferUrl,
    );
    //return parsed api

    var data = await http.get(
      uri,
      headers: headers,
    );
   
    return data;
  }

  static Future transfer() async {
    //attach base to quesry
    var transferUrl = "/api/transfer";
    final encoding = Encoding.getByName('utf-8');
    var email = "await UserPrefrences.showEmail()";

    Map<String, dynamic> body = {
      "pk": 'ayoseunsolomon@gmail.com',
      "chain": "",
      "address": "",
      "amount": ""
    };
    String jsonBody = json.encode(body);
    final headers = {
      'Content-Type': 'application/json',
    };
    final uri = Uri.http(
      BASETRANSFERURL,
      transferUrl,
    );
    //return parsed api
    return await http.post(
      uri,
      headers: headers,
      encoding: encoding,
      body: jsonBody,
    );
  }


   static Future balance() async {
    //attach base to quesry
    var transferUrl = "/eth/balance";
    final encoding = Encoding.getByName('utf-8');
  

    Map<String, dynamic> body = {
     
      "chain": "",
      "address": "",
     
    };
    String jsonBody = json.encode(body);
    final headers = {
      'Content-Type': 'application/json',
    };
    final uri = Uri.http(
      BASETRANSFERURL,
      transferUrl,
    );
    //return parsed api
    return await http.post(
      uri,
      headers: headers,
      encoding: encoding,
      body: jsonBody,
    );
  }
}
