import 'dart:convert';
import 'dart:typed_data';

class XrayImageModel {
  final String xrayScanId;
  final DateTime entryDateTime;
  final String? xrayImagePath;
  final Uint8List xrayImage;

  XrayImageModel({
    required this.xrayScanId,
    required this.entryDateTime,
    this.xrayImagePath,
    required this.xrayImage,
  });

  factory XrayImageModel.fromJson(Map<String, dynamic> json) {
    return XrayImageModel(
      xrayScanId: json['xray_scan_id'],
      entryDateTime: DateTime.parse(json['entry_date_time']),
      xrayImagePath: json['xray_image_path'],
      xrayImage: base64.decode(json['xray_image']).buffer.asUint8List(),
    );
  }
}
