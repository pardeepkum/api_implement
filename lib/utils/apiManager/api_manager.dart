import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:api_testing/utils/apiManager/Error_model.dart';
import 'package:api_testing/utils/apiManager/api_exception.dart';
import 'package:api_testing/utils/custom_snackbar.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

const String jsonContentType = 'application/json';

class ApiManager {
  static const String baseUrl = "https://jsonplaceholder.typicode.com/photos";

  Future<dynamic> get(
      String url, {
        bool isErrorSnackShow = true,
        bool isCheckResponse = true,
        bool isCheckError = true,
        Map<String, String>? headers,
      }) async {
    try {
      Map<String, String> header;

      header = {};

      if (headers != null) {
        header.addAll(headers);
      }

      Get.printInfo(info: 'Api GET, URL- ${baseUrl + url}');
      Get.printInfo(info: 'header- $header');

      final request = http.Request("GET", Uri.parse(baseUrl + url));
      request.headers.addAll(header);
      final http.StreamedResponse response = await request.send();
      debugPrint("${response.headers}");

      final map = _returnResponse(
        response,
        isShow: isErrorSnackShow,
        isCheckError: isCheckError,
      );

      return map;
    } on SocketException {
      Get.printInfo(info: 'No net');
      SnackBars.errorSnackBar(content: 'No Internet');
      throw FetchDataException('No Internet connection');
    } finally {}
  }

  ///
  /// This method is used for call API for the `POST` method, need to pass API Url endpoint
  ///
  Future<dynamic> post(
      String url,
      Map<String, String> parameters, {
        String objcontentType = jsonContentType,
        bool isLoaderShow = false,
        bool isErrorSnackShow = true,
        http.MultipartFile? file,
      }) async {
    Get.printInfo(info: 'Api Post, url $url');
    try {
      Map<String, String> header;

      header = {'Content-Type': 'application/x-www-form-urlencoded'};

      Get.printInfo(info: 'header- $header');
      Get.printInfo(info: 'URL- ${baseUrl + url}');
      Get.printInfo(info: 'BODY PARAMS- $parameters');
      final request = http.Request("POST", Uri.parse(baseUrl + url));
      request.bodyFields = parameters;
      request.headers.addAll(header);
      final http.StreamedResponse response = await request.send();

      final map = _returnResponse(
        response,
        isShow: isErrorSnackShow,
      );

      return map;
    } on SocketException {
      Get.printInfo(info: 'No net');
      SnackBars.errorSnackBar(content: 'No Internet');
      throw FetchDataException('No Internet connection');
    } finally {}
  }

  ///
  /// This method is used for call API for the `POST` method, need to pass API Url endpoint
  ///
  Future<dynamic> postObject({
    required String url,
    required Object parameters,
    Map<String, String>? headers,
    String? method,
    String objcontentType = jsonContentType,
    bool isLoaderShow = false,
    bool isErrorSnackShow = true,
    bool isCheckError = true,
    http.MultipartFile? file,
  }) async {
    Get.printInfo(info: 'Api Post, url $url');
    try {
      Map<String, String> header;

      header = {};

      if (headers != null) {
        header.addAll(headers);
      }

      Get.printInfo(info: 'URL- ${baseUrl + url}');
      Get.printInfo(info: 'BODY PARAMS- $parameters');
      Get.printInfo(info: 'header- $header');

      final request = http.Request(
        method ?? 'POST',
        Uri.parse(baseUrl + url),
      );
      request.body = json.encode(parameters);
      request.headers.addAll(header);

      final http.StreamedResponse response = await request.send();
      log('response $response');
      final map = _returnResponse(
        response,
        isShow: isErrorSnackShow,
        isCheckError: isCheckError,
      );

      return map;
    } on SocketException {
      Get.printInfo(info: 'No net');
      SnackBars.errorSnackBar(content: 'No Internet');
      throw FetchDataException('No Internet connection');
    } finally {}
  }

  Future<dynamic> postWithImage(
      String url,
      Map<String, String> parameters, {
        required String imageName,
        required String imagePath,
        String objcontentType = jsonContentType,
        bool isLoaderShow = false,
        bool isErrorSnackShow = true,
        http.MultipartFile? file,
      }) async {
    Get.printInfo(info: 'Api Post, url $url');
    Get.printInfo(info: 'Api Post, parameters $parameters');
    try {
      Map<String, String> header;
      header = {"Content-Type": "multipart/form-data"};

      Get.printInfo(info: 'header- $header');
      Get.printInfo(info: 'URL- ${baseUrl + url}');
      Get.printInfo(info: 'BODY PARAMS- $parameters');

      final request = http.MultipartRequest('POST', Uri.parse(baseUrl + url));
      request.fields.addAll(parameters);

      request.headers.addAll(header);
      if (imagePath != '') {
        request.files.add(await http.MultipartFile.fromPath(imageName, imagePath));
      }

      final http.StreamedResponse response = await request.send();

      final map = _returnResponse(
        response,
        isShow: isErrorSnackShow,
      );

      return map;
    } on SocketException {
      Get.printInfo(info: 'No net');
      SnackBars.errorSnackBar(content: 'No Internet');
      throw FetchDataException('No Internet connection');
    } finally {}
  }

  Future<dynamic> put(
      String url,
      Map<String, String> parameters, {
        String objcontentType = jsonContentType,
        bool isLoaderShow = false,
        bool isErrorSnackShow = true,
        http.MultipartFile? file,
      }) async {
    Get.printInfo(info: 'Api put, url $url');
    try {
      Map<String, String> header;

      header = {'Content-Type': 'application/x-www-form-urlencoded'};

      Get.printInfo(info: 'header- $header');
      Get.printInfo(info: 'URL- ${baseUrl + url}');
      Get.printInfo(info: 'BODY PARAMS- $parameters');

      final request = http.Request("PUT", Uri.parse(baseUrl + url));
      request.bodyFields = parameters;
      request.headers.addAll(header);

      final http.StreamedResponse response = await request.send();

      final map = _returnResponse(
        response,
        isShow: isErrorSnackShow,
      );

      return map;
    } on SocketException {
      Get.printInfo(info: 'No net');
      SnackBars.errorSnackBar(content: 'No Internet');
      throw FetchDataException('No Internet connection');
    } finally {
      if (isLoaderShow) {}
    }
  }

  Future<dynamic> patch(
      String url,
      Object parameters, {
        String objcontentType = jsonContentType,
        bool isLoaderShow = false,
        bool isErrorSnackShow = true,
        Map<String, String>? headers,
        http.MultipartFile? file,
      }) async {
    Get.printInfo(info: 'Api put, url $url');
    try {
      Map<String, String> header;

      header = {};

      if (headers != null) {
        header.addAll(headers);
      }

      Get.printInfo(info: 'header- $header');
      Get.printInfo(info: 'URL- ${baseUrl + url}');
      Get.printInfo(info: 'BODY PARAMS- ${jsonEncode(parameters)}');

      final request = http.Request("PATCH", Uri.parse(baseUrl + url));
      request.body = json.encode(parameters);

      request.headers.addAll(header);

      final http.StreamedResponse response = await request.send();

      final map = _returnResponse(
        response,
        isShow: isErrorSnackShow,
      );

      return map;
    } on SocketException {
      Get.printInfo(info: 'No net');
      SnackBars.errorSnackBar(content: 'No Internet');
      throw FetchDataException('No Internet connection');
    } finally {
      if (isLoaderShow) {}
    }
  }

  Future<dynamic> putRequest(
      String url,
      Object parameters, {
        String objcontentType = jsonContentType,
        bool isLoaderShow = false,
        bool isErrorSnackShow = true,
        http.MultipartFile? file,
      }) async {
    Get.printInfo(info: 'Api put, url $url');
    try {
      if (isLoaderShow) {}

      Map<String, String> header;
      header = {'Content-Type': 'application/json'};

      Get.printInfo(info: 'header- $header');
      Get.printInfo(info: 'URL- ${baseUrl + url}');
      Get.printInfo(info: 'BODY PARAMS- $parameters');

      final request = http.Request("PUT", Uri.parse(baseUrl + url));
      request.body = json.encode(parameters);

      request.headers.addAll(header);

      final http.StreamedResponse response = await request.send();

      final map = _returnResponse(
        response,
        isShow: isErrorSnackShow,
      );

      return map;
    } on SocketException {
      Get.printInfo(info: 'No net');
      SnackBars.errorSnackBar(content: 'No Internet');
      throw FetchDataException('No Internet connection');
    } finally {
      if (isLoaderShow) {}
    }
  }

  Future<dynamic> putWithImage(
      String url,
      Map<String, String> parameters, {
        required String imageName,
        required String imagePath,
        String objcontentType = jsonContentType,
        bool isLoaderShow = false,
        bool isErrorSnackShow = true,
        http.MultipartFile? file,
      }) async {
    Get.printInfo(info: 'Api Post, url $url');
    try {
      if (isLoaderShow) {}
      Map<String, String> header;
      header = {"Content-Type": "multipart/form-data"};

      Get.printInfo(info: 'header- $header');
      Get.printInfo(info: 'URL- ${baseUrl + url}');
      Get.printInfo(info: 'BODY PARAMS- $parameters');
      Get.printInfo(info: 'BODY Image Path- $imagePath');

      final request = http.MultipartRequest('PUT', Uri.parse(baseUrl + url));
      request.fields.addAll(parameters);

      request.headers.addAll(header);
      if (imagePath != '') {
        request.files.add(await http.MultipartFile.fromPath(imageName, imagePath));
      }

      final http.StreamedResponse response = await request.send();

      final map = _returnResponse(
        response,
        isShow: isErrorSnackShow,
      );

      return map;
    } on SocketException {
      Get.printInfo(info: 'No net');
      SnackBars.errorSnackBar(content: 'No Internet');
      throw FetchDataException('No Internet connection');
    } finally {
      if (isLoaderShow) {}
    }
  }

  Future<dynamic> delete(
      String url, {
        Map<String, String>? parameters,
        String objcontentType = jsonContentType,
        bool isLoaderShow = false,
        bool isErrorSnackShow = true,
        http.MultipartFile? file,
      }) async {
    Get.printInfo(info: 'Api Post, url $url');
    try {
      if (isLoaderShow) {}
      Map<String, String> header;
      // if (GetStorage().read(AppPreferencesHelper.USER_INFO) != null) {
      //   var token = GetStorage().read(AppPreferencesHelper.USER_INFO) as Map;
      //   header = {
      //     'Content-Type': 'multipart/form-data',
      //     'Authorization': 'Bearer${token['auth_token']}',
      //   };
      // } else {
      header = {'Content-Type': 'multipart/form-data'};
      // }

      Get.printInfo(info: 'header- $header');
      Get.printInfo(info: 'URL- ${baseUrl + url}');
      // Get.printInfo(info: 'BODY PARAMS- $parameters');

      final request = http.MultipartRequest("DELETE", Uri.parse(baseUrl + url));
      // request.fields.addAll(parameters);
      if (file != null) {
        request.files.add(file);
      }

      request.headers.addAll(header);
      final http.StreamedResponse response = await request.send();
      final map = _returnResponse(
        response,
        isShow: isErrorSnackShow,
      );
      return map;
    } on SocketException {
      Get.printInfo(info: 'No net');
      SnackBars.errorSnackBar(content: 'No Internet');
      throw FetchDataException('No Internet connection');
    } finally {
      if (isLoaderShow) {}
    }
  }

  dynamic _returnResponse(
      http.StreamedResponse response, {
        bool isShow = true,
        bool isCheckError = true,
      }) async {
    final responseString = await response.stream.bytesToString();
    log('response String :~~~~ $responseString');
    if (kDebugMode) {
      debugPrint("${response.statusCode}");
      log('response String :~~~~ $responseString');
    }
    switch (response.statusCode) {
      case 200:
        final responseJson = json.decode(responseString);
        if (isCheckError) {
          if ((responseJson as Map)['status'].toString() != "Success") {
            if (isShow) {
              SnackBars.errorSnackBar(content: 'Login failed.');
            }
            throw BadRequestException(responseJson['message']);
          }
        }

        return responseJson;
      case 201:
        final Map responseJson = json.decode(responseString);
        if (responseJson['code'] == "0") {
          if (isShow) {
            SnackBars.errorSnackBar(content: responseJson['message']);
          }
          throw BadRequestException(responseJson['message']);
        }
        return responseJson;
      case 400:
        if (isShow) {
          SnackBars.errorSnackBar(
            content: ErrorModel.fromJson(json.decode(responseString)).msg ?? '  ',
          );
        }
        throw BadRequestException(
          ErrorModel.fromJson(json.decode(responseString)).msg ?? '  ',
        );
      case 401:
        if (isShow) {
          SnackBars.errorSnackBar(
            content: ErrorModel.fromJson(json.decode(responseString)).msg ?? '  ',
          );
        }
        throw BadRequestException(
          ErrorModel.fromJson(json.decode(responseString)).msg ?? '  ',
        );
      case 403:
        if (isShow) {
          SnackBars.errorSnackBar(
            content: ErrorModel.fromJson(json.decode(responseString)).msg ?? '  ',
          );
        }
        throw UnauthorisedException(
          ErrorModel.fromJson(json.decode(responseString)).msg ?? '  ',
        );

      case 404:
        if (isShow) {
          SnackBars.errorSnackBar(
            content: ErrorModel.fromJson(json.decode(responseString)).msg ?? '  ',
          );
        }
        throw UnauthorisedException(
          ErrorModel.fromJson(json.decode(responseString)).msg ?? '  ',
        );
      case 500:
      default:
        throw FetchDataException(
          'Error occured while Communication with Server with StatusCode : ${response.statusCode}',
        );
    }
  }
}
