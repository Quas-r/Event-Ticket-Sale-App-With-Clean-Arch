import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

@singleton
class RemoteConfig {
  //Dio? dio;

  RemoteConfig() {
    // Dio yapılandırması...
  }

  Future<Response<dynamic>?> getRequest(String url) async {
    try {
      Map<String?, dynamic> extractKeyFromUrl =
          extractFilePathAndIdFromUrl(url);

      url = extractKeyFromUrl['url'];
      String? key = extractKeyFromUrl['key'];

      Map<String, dynamic>? jsonMap;
      if (key != null && key.isNotEmpty) {
        jsonMap = await loadJsonDataFromLocalWithKey(url, key);
      } else {
        jsonMap = await loadJsonDataFromLocal(url);
      }
      return Response(
          requestOptions: RequestOptions(path: url),
          data: jsonMap,
          statusCode: 200);
    } catch (e) {
      return null;
    }
  }

  Map<String?, dynamic> extractFilePathAndIdFromUrl(String url) {
    String? key;

    if (url.contains('id=')) {
      RegExp regExp = RegExp(r'id=(\d+)'); // id=12345 gibi bir yapıyı arar
      Match? match = regExp.firstMatch(url);
      if (match != null) {
        key = match.group(1) ?? '';
        url = url.replaceAll(regExp, '');
        url = url.substring(0, url.length - 1);
      }
    }
    return {'url': url, 'key': key};
  }

  Future<Response<dynamic>?> postRequest(
      String url, Map<String, dynamic>? body) async {
    // Burada temsili bir post işlemi gerçekleştiriyoruz
    return Response(
        requestOptions: RequestOptions(path: url), data: body, statusCode: 200);
  }

  Future<Response<dynamic>?> patchRequest(
      String url, Map<String, dynamic>? body) async {
    // Burada temsili bir patch işlemi gerçekleştiriyoruz
    return Response(
        requestOptions: RequestOptions(path: url), data: body, statusCode: 200);
  }

  Future<Response<dynamic>?> putRequest(
      String url, Map<String, dynamic>? body) async {
    // Burada temsili bir put işlemi gerçekleştiriyoruz
    return Response(
        requestOptions: RequestOptions(path: url), data: body, statusCode: 200);
  }

  Future<Map<String, dynamic>?> loadJsonDataFromLocal(String url) async {
    try {
      String jsonData = await rootBundle.loadString(url);
      Map<String, dynamic> jsonMap = json.decode(jsonData);
      return jsonMap;
    } catch (e) {
      return null;
    }
  }

  Future<Map<String, dynamic>?> loadJsonDataFromLocalWithKey(
  String url, String key) async {
  try {
    String jsonData = await rootBundle.loadString(url);
    Map<String, dynamic> jsonMap = json.decode(jsonData);

    // Belirli bir anahtarla eşleşen veri bölümünü alma
    Map<String, dynamic>? matchedData;
    if (jsonMap.containsKey('dates')) {
      Map<String, dynamic> dateMap = jsonMap['dates'];
      if (dateMap.containsKey(key)) {
        matchedData = {
          'dates': {key: dateMap[key]},
        };
      }
    }

    return matchedData;
  } catch (e) {
    return null;
  }
}

}
