import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import 'model.dart';

enum DataSourceType { douban, imdb }

extension TypeName on DataSourceType {
  String typeName() {
    return "${name[0].toUpperCase()}${name.substring(1)}";
  }
}

class RequestUtil {
  // Mock data
  static Future<List<MovieItems>> readFromAssets() async {
    String imdb = await rootBundle.loadString('assets/imdb.json');
    List<MovieItems> list = [];
    for (var element in jsonDecode(imdb)) {
      list.add(MovieItems.fromMap(element));
    }
    return list;
  }

  static Future<List<MovieItems>> requestDouban(DataSourceType type) async {
    final response = await http.get(Uri.parse(
        'https://api.wmdb.tv/api/v1/top?type=${type.typeName()}&skip=0&limit=5&lang=Cn'));

    if (response.statusCode == 200) {
      List<MovieItems> list = [];
      for (var element in jsonDecode(response.body)) {
        list.add(MovieItems.fromMap(element));
      }
      return list;
    } else {
      throw Exception('Failed to load movie list');
    }
  }
}
