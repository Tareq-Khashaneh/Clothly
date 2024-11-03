import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart' as dio;
import '../core/constants/api_endpoint.dart';
import '../core/constants/error.dart';
import '../core/constants/typedef.dart';

abstract class NetworkService {
  Future<dynamic> get({required String url, parameters? params});
  Future<dynamic> post({required String url, required parameters data});
}

class NetworkServiceDio implements NetworkService {
  final dio.Dio _dio = dio.Dio();
  NetworkServiceDio() {
    dio.BaseOptions options = dio.BaseOptions(
      baseUrl: Api.baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 8), // 60 seconds
      receiveTimeout: const Duration(seconds: 8),
      sendTimeout: const Duration(seconds: 8),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
    );
    _dio.options = options;
  }
  @override
  Future<dioRes?> get({required String url, parameters? params}) async {
    try {
      dioRes response = await _dio.get(url, queryParameters: params);
      return response;
    } on dio.DioException catch (e) {
      print("error in get service $e");
      DioExceptions.getExceptionType(e);
      return null;
    }
  }

  @override
  Future<dioRes?> post({required String url, required parameters data}) async {
    try {
      dioRes? response = await _dio.post(url, data: data);
      return response;
    } on dio.DioException catch (e) {
      print("error in post service ${e.toString()}");
      DioExceptions.getExceptionType(e);
      return null;
    }
  }
}

class NetworkServiceHttp implements NetworkService {
  @override
  Future<http.Response?> get({required String url, parameters? params, Map<String, String>? headers,}) async {
    try {
      Uri uri = Uri.parse(url);
      if (params != null) {
        uri = uri.replace(queryParameters: params);
      }
      http.Response? response = await http.get(uri,headers: headers);
      return response;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<http.Response?> post(
      {required String url, required parameters data,    Map<String, String>? headers,}) async {
    try {
      http.Response? response = await http.post(
        Uri.parse(url),
        headers: headers ?? {'Content-Type': 'application/json'},
        body: json.encode(data), // Convert data to JSON
      );
      return response;
    }  catch (e) {
      print("error in post service ${e.toString()}");

      return null;
    }
  }
}
