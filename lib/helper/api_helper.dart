import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:planet_news/exceptions/app_exceptions.dart';

class ApiBaseHelper {
  static const String _baseUrl = 'https://eapp.planethrmsystem.com/newsapp/api.php';
  static const int _TIMEOUT = 10;

  Future<dynamic> get({
    required String url,
    Map<String, dynamic>? params,
  }) async {
    dynamic jsonResponse;
    try {
      final Response response =
      await Dio().get(_baseUrl + url, queryParameters: params).timeout(
        const Duration(seconds: _TIMEOUT),
        onTimeout: () {
          Fluttertoast.showToast(msg: "Your internet is too slow check your internet connection");
          throw SlowInternetException(
            message: 'Your internet is too slow check your internet connection',
          );

        },
      );
      jsonResponse = _returnResponse(response);
    } on TimeoutException {
      Fluttertoast.showToast(msg: "Something went wrong, your internet may be slow");
      throw FetchDataException(
        message: 'Something went wrong, your internet may be slow',
      );
    } on SocketException {
      throw NoInternetException(message: 'Check your internet connection');
    } on DioError catch (e) {
      _handleDioError(e);
    }
    return jsonResponse;
  }

  Future<dynamic> post(
      {Map<String, dynamic>? body}) async {
    dynamic jsonResponse;
    try {
      // FormData formData = FormData.fromMap(body!);
      final Response response =
      await Dio().post(_baseUrl, data: body).timeout(
        Duration(seconds: _TIMEOUT),
        onTimeout: () {
          Fluttertoast.showToast(msg: "Your internet is too slow check your internet connection");
          throw SlowInternetException(
            message: 'Your internet is too slow check your internet connection',
          );
        },
      );
      jsonResponse = _returnResponse(response);
    } on TimeoutException {
      Fluttertoast.showToast(msg: "Something went wrong, your internet may be slow");
      throw FetchDataException(
        message: 'Something went wrong, your internet may be slow',
      );
    } on SocketException {
      Fluttertoast.showToast(msg: "Check your internet connection");
      throw NoInternetException(message: 'Check your internet connection');
    } on DioError catch (e) {
      _handleDioError(e);
    }
    return jsonResponse;
  }

  dynamic _handleDioError(DioError e) {
    if (e.type == DioErrorType.receiveTimeout ||
        e.type == DioErrorType.connectTimeout) {
      throw FetchDataException(
        message: 'Something went wrong, your internet may be slow',
      );
    } else if (e.type == DioErrorType.response) {
      if (e.response != null) {
        switch (e.response!.statusCode) {
          case 400:
            throw BadRequestException(
                message: _parseErrorMessage(e.response!.data));
          case 401:
          case 403:
            throw UnauthorisedException(
              message: _parseErrorMessage(e.response!.data),
            );
          case 500:
          default:
            throw FetchDataException(
              message: 'Error occurred while communication with server' +
                  ' with status code : ${e.response!.statusCode}',
            );
        }
      } else {
        throw FetchDataException(
          message: 'Error occurred while communication with server',
        );
      }
    } else if (e.type == DioErrorType.other) {
      if (e.message.contains('SocketException')) {
        throw NoInternetException(message: 'Check your internet connection');
      }
    } else {
      throw FetchDataException(
        message: 'Something went wrong, your internet may be slow',
      );
    }
  }

  dynamic _returnResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        return response.data;
      case 201:
        return response.data;
      case 202:
        return response.data;
      case 203:
        return response.data;
      case 204:
        return response.data;
      default:
        throw FetchDataException(
          message: 'Error occurred while communication with server' +
              ' with status code : ${response.statusCode}',
        );
    }
  }

  String _parseErrorMessage(dynamic response) {
    return response['message']
        .toString()
        .replaceAll('[', '')
        .replaceAll(',', '')
        .replaceAll(']', '');
  }
}