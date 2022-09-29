import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:jop_task/models/xray_model.dart';

class ApiControler {
  static const String _baseUrl = "https://10.50.15.182:8019";
  static const String _getVehicleXrayImage = "/Info/GetVehicleXrayImage";

  Future<XrayImageModel> getVehicleXrayImage() async {
    final response =
        await http.get(Uri.parse(_baseUrl + _getVehicleXrayImage), headers: {
      'PortCD': '31',
      'TRAN_SEQ': '1989999',
      'TRAN_DATE_H': '2021-07-01',
      'routePortCode': '31',
    });
    if (response.statusCode == 200) {
      return XrayImageModel.fromJson(json.decode(response.body)['data']);
    } else {
      throw Exception('Failed to load Xray Image');
    }
  }
}
