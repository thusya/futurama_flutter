import 'dart:convert';
import 'package:futurama/data/futurama_info.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class FuturamaInfoProvider with ChangeNotifier {
  List<FuturamaInfo>? futuramaInfoList;
  bool isLoading = true;
  String? error;

  bool get hasError => error != null && error!.isNotEmpty;
  bool get hasData => futuramaInfoList != null && futuramaInfoList!.isNotEmpty;

  FuturamaInfoProvider() {
    fetchShowInfo();
  }

  Future<void> fetchShowInfo() async {
    final response =
        await http.get(Uri.parse('https://api.sampleapis.com/futurama/info'));

    if (response.statusCode == 200) {
      futuramaInfoList = (json.decode(response.body) as List<dynamic>)
          .map((data) => FuturamaInfo.fromJson(data))
          .toList();
      notifyListeners();
    } else {
      error = 'Failed to fetch info';
    }
    isLoading = false;
  }

  String get synopsis =>
      futuramaInfoList != null && futuramaInfoList!.isNotEmpty
          ? futuramaInfoList![0].synopsis
          : "";
}
