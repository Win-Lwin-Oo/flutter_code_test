import 'dart:convert';
import 'dart:io';
import 'package:code_manage_test/constant/base_api.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class HttpService {
  /// Base api uri
  static const String baseUri = BASE_URI;

  /// GET
  Future get(String uri) async {
    String fullUri = baseUri + uri + '?api_key=' + API_KEY;
    print('Full url => $fullUri');
    dynamic responseJson;
    try {
      final response = await http.get(
        Uri.parse(fullUri),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      responseJson = jsonDecode(response.body);
      print('http response => $responseJson');
    } on SocketException {
      Get.snackbar('Network connection fail!', 'Please, Try again');
      throw Exception('No Internet Connection');
    }
    return responseJson;
  }
}
