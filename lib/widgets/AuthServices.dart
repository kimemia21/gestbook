import 'dart:convert';

import 'package:application/widgets/popup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:quickalert/quickalert.dart';

class AuthServices {
  Future<void> getGuestInfo(
      {required qrCode, required BuildContext context}) async {
        //"0716d9708d321ffb6a00818614779e779925365c"
    final url =
        "http://143.244.180.244:4303/?k=$qrCode";
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        Map<String, dynamic> responseMap = jsonDecode(response.body);

        // Define the keys to verify
        List<String> keysToVerify = [
          'id',
          'guest_id',
          'corp',
          'name',
          'e_mail',
       
 
        ];

        // Check if all keys are present and their values are not empty
        bool allKeysPresentAndNotEmpty = keysToVerify.every((key) {
          return responseMap.containsKey(key) &&
              responseMap[key] != null &&
              responseMap[key] != '';
        });

        // Collect keys that are missing or have empty values

        List<String> keysWithNotEmptyValues = keysToVerify.where((key) {
          return !responseMap.containsKey(key) &&
              responseMap[key] != null &&
              responseMap[key] != '';
        }).toList();

        print(keysWithNotEmptyValues);

        if (allKeysPresentAndNotEmpty) {
          popups().successINFO(context: context, name: responseMap["name"]);
        } else {
          popups().displayFormDialog(
              context: context,
              name: responseMap["name"],
              guest_id: responseMap["guest_id"],
              email: responseMap["e_mail"],
              corp: responseMap["corp"]);
        }
      } else {
        print('Request failed with status: ${response.statusCode}');
        popups().userNotAvailable(context: context);
      }
    } catch (e) {
      print('Error making request: $e');
    }

    // Parse the JSON response into a Map
  }

  Future<void> postUserInfo(
      {required BuildContext context,
      required String guest_id,
      required String email}) async {
    final url = Uri.parse("http://143.244.180.244:4303/update-email");

    final Map body = {"guestId": guest_id, "email": email};

    try {
      final response = await http.post(url, body: jsonEncode(body), headers: {
        "Content-Type": "application/json",
      });

      if (response.statusCode == 200) {
        popups().addSuccess(context: context);

        print("updated : ${response.body}");
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error making request: $e');
    }
  }
}
