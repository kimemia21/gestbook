import 'dart:convert';

import 'package:application/widgets/popup.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthServices {
  Future<void> getGuestInfo(
      {required qrCode, required BuildContext context}) async {
    String jsonResponse = '''
    {
        "id": 17,
        "guest_id": "0716d9708d321ffb6a00818614779e779925365c",
        "corp": "Gnovation",
        "name": "James Mbaaro",
        "e_mail": "newemail@example.com"
    } 
  ''';

    // Parse the JSON response into a Map
    Map<String, dynamic> responseMap = jsonDecode(jsonResponse);

    // Define the keys to verify
    List<String> keysToVerify = ['id', 'guest_id', 'corp', 'name', 'e_mail'];

    // Check if all keys are present and their values are not empty
    bool allKeysPresentAndNotEmpty = keysToVerify.every((key) {
      return responseMap.containsKey(key) &&
          responseMap[key] != null &&
          responseMap[key] != '';
    });

    if (allKeysPresentAndNotEmpty) {
      print('All keys are present and their values are not empty.');
      popups().successINFO(context: context,name:responseMap["name"] );
    } else {
      print('Some keys are missing or have empty values.');
     
    }

    // final url = "http://143.244.180.244:4303/?k=0716d9708d321ffb6a00818614779e779925365c";
    // try {
    //   final response = await http.get(Uri.parse(url));
    //   if (response.statusCode == 200) {
    //     print("Request succesful :${response.body}");
    //   } else {
    //     print('Request failed with status: ${response.statusCode}');
    //   }
    // } catch (e) {
    //   print('Error making request: $e');
    // }
  }
}
