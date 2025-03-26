import 'dart:convert';
import 'package:clothly/core/constants/auth_storage.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart' as dio;
import '../core/constants/api_endpoint.dart';
import '../core/constants/error.dart';
import '../core/constants/typedef.dart';
import 'auth_interceptor.dart';

abstract class NetworkService {
  Future<dynamic> get({required String url, parameters? params});
  Future<dynamic> post({required String url, required parameters data});
  Future<dynamic> update({required String url, required parameters data});
  Future<dynamic> delete({required String url});
}

class NetworkServiceDio implements NetworkService {
  final dio.Dio _dio = dio.Dio();
  NetworkServiceDio() {
    _initializeDio();
  }

  /// Initializes Dio settings
  Future<void> _initializeDio() async {
    _dio.options = dio.BaseOptions(
        baseUrl: Api.baseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 8),
        receiveTimeout: const Duration(seconds: 8),
        sendTimeout: const Duration(seconds: 8),
        headers: {
          'Content-Type': 'application/json',
        });

    // Fetch token asynchronously and add interceptor
    String? token = await AuthStorage.getToken();
    _dio.interceptors.add(AuthInterceptor(token));
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
      print("data ${data}");
      dioRes? response = await _dio.post(url, data: dio.FormData.fromMap(data));

      return response;
    } on dio.DioException catch (e) {
      print("error in post service ${e.toString()}");
      DioExceptions.getExceptionType(e);
      return null;
    }
  }
  @override
  Future<dioRes?> update({required String url, required parameters data}) async {
    try {
      dioRes? response = await _dio.put(url,data: data,);
      return response;
    } on dio.DioException catch (e) {
      print("error in post service ${e.toString()}");
      DioExceptions.getExceptionType(e);
      return null;
    }
  }

  @override
  Future<dioRes?> delete({required String url}) async {
    try {
      dioRes? response = await _dio.delete(url);
      print("response in delete $response");
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
  Future<http.Response?> get({
    required String url,
    parameters? params,
    Map<String, String>? headers,
  }) async {
    try {
      Uri uri = Uri.parse(url);
      if (params != null) {
        uri = uri.replace(queryParameters: params);
      }
      http.Response? response = await http.get(uri, headers: headers);
      return response;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<http.Response?> post({
    required String url,
    required parameters data,
    Map<String, String>? headers,
  }) async {
    try {
      http.Response? response = await http.post(
        Uri.parse(url),
        headers: headers ?? {'Content-Type': 'application/json'},
        body: json.encode(data), // Convert data to JSON
      );
      return response;
    } catch (e) {
      print("error in post service ${e.toString()}");

      return null;
    }
  }

  @override
  Future delete({required String url}) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future update({required String url, required parameters data}) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
