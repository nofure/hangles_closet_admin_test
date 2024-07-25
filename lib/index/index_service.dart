import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:http/http.dart' as http;

import '../global/constants.dart';

class IndexService extends GetConnect {
  var client = http.Client();
  String language = "";
  @override
  void onInit() {
    Get.locale.toString() == "th_TH" ? language = 'th' : language = 'en';

    super.onInit();
  }

  Future<Map<String, dynamic>?> getBoxInfo(int? page, int? pageSize) async {
    try {
      var url = Uri.parse(
          '${base_url}hanglesClosest/getBoxInfo?page=$page&pageSize=$pageSize'); //?page=1&pageSize=10

      final response = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': '*/*',
        'Accept-Encoding': 'gzip, deflate, br',
        'Authorization':
            'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJsb29rbnVtIiwicm9sZXMiOlsiVXNlciJdLCJpc3MiOiJodHRwOi8vaGFuZ2xlcy1hcGktdWF0LWVudi5lYmEtbW1wbXd5Z2MuYXAtc291dGhlYXN0LTEuZWxhc3RpY2JlYW5zdGFsay5jb20vYXBpL2xvZ2luIn0.GN39GZwQ45cThKbWqRkLt28A4MMYKNllZomqeBtTUWo',
      }).timeout(const Duration(seconds: 20), onTimeout: () {
        throw TimeoutException(
            'The connection has timed out, Please try again!');
      });
      if (response.statusCode == HttpStatus.ok) {
        var decodedData = jsonDecode(utf8.decode(response.bodyBytes));
        return decodedData;
      } else if (response.statusCode == 400) {
        return null;
      } else {
        print(response.body);
        return null;
      }
    } catch (e) {
      print('GetBoxInfo : ' + e.toString());
      return null;
    }
  }
}
