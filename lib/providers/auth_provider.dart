import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;



import 'dart:convert' as convert;

import '../networkmanager/auth.dart';

class AuthProvider extends ChangeNotifier {
  Future<Map<String, dynamic>> login(email, pw) async {
    dynamic data;
    notifyListeners();

    try {
      var response = await AuthAPI.login(email, pw);
      var responseData = json.decode(response.body);

      notifyListeners();

      data = responseData;
    } catch (e) {
      notifyListeners();
      data = {'error': e};
    }
    return data;
  }

  Future<Map<String, dynamic>> updateSignUp(email, pw, cpw, id) async {
    dynamic data;
    notifyListeners();

    try {
      var response = await AuthAPI.updateSignUp(email, pw, cpw, id);
      var responseData = json.decode(response.body);

      notifyListeners();

      data = {
        "statusCode": responseData['statusCode'],
        "description": responseData['description'],
        "success": responseData['success'],
        "data": responseData['data'],
      };

      print(data['data']);
    } catch (e) {
      notifyListeners();
      data = {'error': e};
    }
    return data;
  }

  Future<Map<String, dynamic>> register(email, pw, cpw) async {
    dynamic data;

    notifyListeners();

    try {
      var response = await AuthAPI.signup(email, pw, cpw);
      var responseData = json.decode(response.body);

      notifyListeners();
      if (responseData['statusCode'] != null) {
        data = responseData;
      }
    } catch (e) {
      notifyListeners();
      data = {'error': e};
    }
    return data;
  }

  Future<Map<String, dynamic>> verifyOTPSignUp(id, otp) async {
    dynamic data;

    notifyListeners();

    try {
      var response = await AuthAPI.otpSignup(id, otp);
      var responseData = json.decode(response.body);

      notifyListeners();
      if (responseData['statusCode'] != null) {
        data = responseData;
        // data = {
        //   "statusCode": responseData['statusCode'],
        //   "tenantId": responseData['data']['tenantId'],
        //   "customerId": responseData['data']['customerId'],
        //   "success": responseData['success'],
        //   "description": responseData['description'],
        // };
        //print(data['description'].toString());
      }
      print(data);
    } catch (e) {
      notifyListeners();
      data = {'error': e};
    }
    return data;
  }

  Future<Map<String, dynamic>> resetOTP(id, otp) async {
    dynamic data;

    notifyListeners();

    try {
      var response = await AuthAPI.resetOTP(id, otp);
      var responseData = json.decode(response.body);

      notifyListeners();
      if (responseData['statusCode'] != null) {
        data = responseData;
        // data = {
        //   "statusCode": responseData['statusCode'],
        //   "tenantId": responseData['data']['tenantId'],
        //   "customerId": responseData['data']['customerId'],
        //   "success": responseData['success'],
        //   "description": responseData['description'],
        // };
        //print(data['description'].toString());
      }
      print(data);
    } catch (e) {
      notifyListeners();
      data = {'error': e};
    }
    return data;
  }

  Future<Map<String, dynamic>> changePassword(id, password) async {
    dynamic data;

    notifyListeners();

    try {
      var response = await AuthAPI.changePassword(id, password);
      var responseData = json.decode(response.body);

      notifyListeners();
      if (responseData['statusCode'] != null) {
        data = responseData;
        // data = {
        //   "statusCode": responseData['statusCode'],
        //   "tenantId": responseData['data']['tenantId'],
        //   "customerId": responseData['data']['customerId'],
        //   "success": responseData['success'],
        //   "description": responseData['description'],
        // };
        //print(data['description'].toString());
      }
      print(data);
    } catch (e) {
      notifyListeners();
      data = {'error': e};
    }
    return data;
  }

  Future<Map<String, dynamic>> forgotPassword(email) async {
    dynamic data;

    notifyListeners();

    try {
      var response = await AuthAPI.forgotPassword(email);

      var responseData = json.decode(response.body);
      print(responseData);
      notifyListeners();
      if (responseData['statusCode'] != null) {
        data = responseData;
        // data = {
        //   "statusCode": responseData['statusCode'],
        //   "tenantId": responseData['data']['tenantId'],
        //   "customerId": responseData['data']['customerId'],
        //   "success": responseData['success'],
        //   "description": responseData['description'],
        // };
        //print(data['description'].toString());
      }
    } catch (e) {
      notifyListeners();
      data = {'error': e};
    }
    return data;
  }

  Future<Map<String, dynamic>> resendOTP() async {
    dynamic data;

    notifyListeners();

    try {
      var response = await AuthAPI.resendOTP();

      var responseData = json.decode(response.body);
      print(responseData);
      notifyListeners();
      if (responseData['statusCode'] != null) {
        data = responseData;
        // data = {
        //   "statusCode": responseData['statusCode'],
        //   "tenantId": responseData['data']['tenantId'],
        //   "customerId": responseData['data']['customerId'],
        //   "success": responseData['success'],
        //   "description": responseData['description'],
        // };
        //print(data['description'].toString());
      }
    } catch (e) {
      notifyListeners();
      data = {'error': e};
    }
    return data;
  }

  Future<Map<String, dynamic>> KYC(name, lastName, gender, dob, phone, bvn,
      privacy, terms, code, country) async {
    dynamic data;

    notifyListeners();

    try {
      var response = await AuthAPI.userKYC(name, lastName, gender, dob, phone,
          bvn, privacy, terms, code, country);
      var responseData = json.decode(response.body);
      print(responseData);
      notifyListeners();
      if (responseData['statusCode'] != null) {
        data = responseData;
        // data = {
        //   "statusCode": responseData['statusCode'],
        //   "tenantId": responseData['data']['tenantId'],
        //   "customerId": responseData['data']['customerId'],
        //   "success": responseData['success'],
        //   "description": responseData['description'],
        // };
        //print(data['description'].toString());
      }
      print(data);
    } catch (e) {
      notifyListeners();
      data = {'error': e};
    }
    return data;
  }
}


// To parse this JSON data, do
//
//     final policyData = policyDataFromMap(jsonString);

