import 'package:http/http.dart' as http;

class AuthServices {
  Future<void> getGuestInfo({required qrCode}) async {
    final url = "http://143.244.180.244:4303/?k=$qrCode";
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        print("Request succesful :${response.body}");
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error making request: $e');
    }
  }
}
