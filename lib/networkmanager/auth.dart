import 'dart:convert';
import 'package:flutter_application_1/networkmanager/secrets.dart';
import 'package:http/http.dart' as http;

/**
Authentication API class for user data management 
deals with authrozation header using POST,PATCH

 */

class AuthAPI {
//create a static promise method that ties quesry to api
  static Future login(id, password) async {
    //attach base to quesry
    var data = "find";
    var changePasswordUrl = "/api/Authentication/login";
    final encoding = Encoding.getByName('utf-8');
    Map<String, dynamic> body = {"email": id, "password": password};
    String jsonBody = json.encode(body);
    final headers = {
      'Content-Type': 'application/json',
      'APIKey': APIKey,
    };
    final uri = Uri.http(
      BASETRANSFERURL,
      changePasswordUrl,
    );
    //return parsed api
    return await http.post(
      uri,
      headers: headers,
      encoding: encoding,
      body: jsonBody,
    );
  }

  //create a static promise method that ties quesry to api
  static Future signup(email, password, confirmPassword) async {
    //attach base to quesry
    var signupUrl = "/api/Authentication/register";

    final encoding = Encoding.getByName('utf-8');
    Map<String, dynamic> body = {
      'email': email,
      'password': password,
      'confirmPassword': confirmPassword,
      'tenantId': '1'
    };
    String jsonBody = json.encode(body);
    final headers = {
      'Content-Type': 'application/json',
      'APIKey': APIKey,
    };
    final uri = Uri.http(
      BASETRANSFERURL,
      signupUrl,
    );
    //return parsed api
    return await http.post(
      uri,
      headers: headers,
      encoding: encoding,
      body: jsonBody,
    );
  }

  static Future updateSignUp(email, password, confirmPassword, userId) async {
    //attach base to quesry
    var updateSignUpUrl = "/api/Authentication/update-signup";
    final encoding = Encoding.getByName('utf-8');
    Map<String, dynamic> body = {
      'email': email,
      'password': password,
      'confirmPassword': confirmPassword,
      'userId': userId
    };
    String jsonBody = json.encode(body);
    final headers = {
      'Content-Type': 'application/json',
      'APIKey': APIKey,
    };
    final uri = Uri.http(
      BASETRANSFERURL,
      updateSignUpUrl,
    );
    //return parsed api
    return await http.post(
      uri,
      headers: headers,
      encoding: encoding,
      body: jsonBody,
    );
  }

  static Future userKYC(firstName, lastName, gender, dob, phone, bvn, privacy,
      terms, referral, country) async {
    var id = 'yyy';
    //attach base to quesry
    var userKYCUrl = "/api/UserDetails/submitKycInformation";
    final encoding = Encoding.getByName('utf-8');
    Map<String, dynamic> body = {
      "firstName": firstName,
      "lastName": lastName,
      "gender": gender,
      "dateOfBirth": dob,
      "phoneNumber": phone,
      "bvn": bvn,
      "privacyAccepted": privacy,
      "termsOfServiceAccepted": terms,
      "referralCode": referral,
      "country": country
    };
    String jsonBody = json.encode(body);
    final headers = {
      'Content-Type': 'application/json',
      'APIKey': APIKey,
    };

    final queryParameters = {
      "id": id,
    };
    final uri = Uri.http(BASETRANSFERURL, userKYCUrl, queryParameters);

    //return parsed api
    return await http.patch(
      uri,
      headers: headers,
      encoding: encoding,
      body: jsonBody,
    );
  }

  static Future otpSignup(id, otp) async {
    //attach base to quesry
    var otpSignupUrl = "/api/Authentication/verify-otp-signup";
    final encoding = Encoding.getByName('utf-8');
    Map<String, dynamic> body = {"userId": id, "otp": otp};
    String jsonBody = json.encode(body);
    final headers = {
      'Content-Type': 'application/json',
      'APIKey': APIKey,
    };
    final uri = Uri.http(
      BASETRANSFERURL,
      otpSignupUrl,
    );
    //return parsed api
    return await http.post(
      uri,
      headers: headers,
      encoding: encoding,
      body: jsonBody,
    );
  }

  static Future resetOTP(id, otp) async {
    //attach base to quesry
    var resetOTPUrl = "/api/Authentication/verify-otp-password-reset";
    final encoding = Encoding.getByName('utf-8');
    Map<String, dynamic> body = {"userId": id, "otp": otp};
    String jsonBody = json.encode(body);
    final headers = {
      'Content-Type': 'application/json',
      'APIKey': APIKey,
    };
    final uri = Uri.http(
      BASETRANSFERURL,
      resetOTPUrl,
    );
    //return parsed api
    return await http.post(
      uri,
      headers: headers,
      encoding: encoding,
      body: jsonBody,
    );
  }

  static Future changePassword(id, password) async {
    //attach base to quesry
    var changePasswordUrl = "/api/Authentication/update-password";
    final encoding = Encoding.getByName('utf-8');
    Map<String, dynamic> body = {"userId": id, "password": password};
    String jsonBody = json.encode(body);
    final headers = {
      'Content-Type': 'application/json',
      'APIKey': APIKey,
    };
    final uri = Uri.http(
      BASETRANSFERURL,
      changePasswordUrl,
    );
    //return parsed api
    return await http.post(
      uri,
      headers: headers,
      encoding: encoding,
      body: jsonBody,
    );
  }

  static Future forgotPassword(email) async {
    //attach base to quesry
    var forgotPasswordUrl = "/api/Authentication/reset-password";
    final encoding = Encoding.getByName('utf-8');
    Map<String, dynamic> body = {
      "email": email,
    };
    String jsonBody = json.encode(body);
    final headers = {
      'Content-Type': 'application/json',
      'APIKey': APIKey,
    };
    final uri = Uri.http(
      BASETRANSFERURL,
      forgotPasswordUrl,
    );
    //return parsed api
    return await http.post(
      uri,
      headers: headers,
      encoding: encoding,
      body: jsonBody,
    );
  }

  static Future resendOTP() async {
    //attach base to quesry
    var resendOTPUrl = "/api/Authentication/reset-password";
    final encoding = Encoding.getByName('utf-8');
    var email = "await UserPrefrences.showEmail()";

    Map<String, dynamic> body = {
      "email": 'ayoseunsolomon@gmail.com',
    };
    String jsonBody = json.encode(body);
    final headers = {
      'Content-Type': 'application/json',
      'APIKey': APIKey,
    };
    final uri = Uri.http(
      BASETRANSFERURL,
      resendOTPUrl,
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
