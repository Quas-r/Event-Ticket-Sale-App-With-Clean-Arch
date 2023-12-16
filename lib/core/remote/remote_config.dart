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
      Map<String, dynamic>? jsonMap = await loadEventDataFromLocal(url);
      return Response(requestOptions: RequestOptions(path: url), data: jsonMap, statusCode: 200);
    } catch (e) {
      return null;
    }
  }

  Future<Response<dynamic>?> postRequest(String url, Map<String, dynamic>? body) async {
    // Burada temsili bir post işlemi gerçekleştiriyoruz
    // Gerçek bir post isteği göndermek için gerekli yapılandırmaları ve işlemleri burada yapmalısınız
    return Response(requestOptions: RequestOptions(path: url), data: body, statusCode: 200);
  }

  Future<Response<dynamic>?> patchRequest(String url, Map<String, dynamic>? body) async {
    // Burada temsili bir patch işlemi gerçekleştiriyoruz
    // Gerçek bir patch isteği göndermek için gerekli yapılandırmaları ve işlemleri burada yapmalısınız
    return Response(requestOptions: RequestOptions(path: url), data: body, statusCode: 200);
  }

  Future<Response<dynamic>?> putRequest(String url, Map<String, dynamic>? body) async {
    // Burada temsili bir put işlemi gerçekleştiriyoruz
    // Gerçek bir put isteği göndermek için gerekli yapılandırmaları ve işlemleri burada yapmalısınız
    return Response(requestOptions: RequestOptions(path: url), data: body, statusCode: 200);
  }

  Future<Map<String, dynamic>?> loadEventDataFromLocal(String url) async {
    try {
      String jsonData = await rootBundle.loadString(url);
      Map<String, dynamic> jsonMap = json.decode(jsonData);
      return jsonMap;
    } catch (e) {
      return null;
    }
  }
}
