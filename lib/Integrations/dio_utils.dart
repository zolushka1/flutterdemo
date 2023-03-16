import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioUtils {
  static final DioUtils _instance = DioUtils._internal();
  static var navigatorKey = GlobalKey<NavigatorState>();

  factory DioUtils() => _instance;

  DioUtils._internal();

  Dio client = _createDioInstance();

  static Dio _createDioInstance() {
    Dio dio = Dio();
    // adding interceptor
    dio.interceptors.clear();
    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      return handler.next(options); //modify your request
    }, onResponse: (response, handler) {
      return handler.next(response);
    }, onError: (DioError e, handler) async {
      print("Error on Dio utilis");
      // if (e.response == null) return;
      // // int statusCode = e.response.statusCode;
      // if (statusCode == 401 || statusCode == 403) {
      //   print('logout please... $statusCode');
      //   // Navigator.po
      //   navigatorKey?.currentState?.pushNamed("/");
      //   await Storage().secureStorage.write(key: 'access_token', value: null);

      //   return null;
      // } else {
      //   handler.next(e);
      // }
    }));
    return dio;
  }
}


//method for getting dio instance
  // static Dio getInstance() {
  //   if (_instance == null) {
  //     _instance = createDioInstance();
  //   }
  //   return _instance;
  // }

  // Dio createDioInstance() {
  //   var dio = Dio();
  //   // adding interceptor
  //   dio.interceptors.clear();
  //   dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
  //     return handler.next(options); //modify your request
  //   }, onResponse: (response, handler) {
  //     if (response != null) {
  //       //on success it is getting called here
  //       return handler.next(response);
  //     } else {
  //       return null;
  //     }
  //   }, onError: (DioError e, handler) async {
  //     if (e.response != null) {
  //       if (e.response.statusCode == 401) {
  //         //catch the 401 here
  //         dio.interceptors.requestLock.lock();
  //         dio.interceptors.responseLock.lock();
  //         RequestOptions requestOptions = e.requestOptions;

  //         await refreshToken();
  //         Repository repository = Repository();
  //         var accessToken = await repository.readData("accessToken");
  //         final opts = new Options(method: requestOptions.method);
  //         dio.options.headers["Authorization"] = "Bearer " + accessToken;
  //         dio.options.headers["Accept"] = "*/*";
  //         dio.interceptors.requestLock.unlock();
  //         dio.interceptors.responseLock.unlock();
  //         final response = await dio.request(requestOptions.path,
  //             options: opts,
  //             cancelToken: requestOptions.cancelToken,
  //             onReceiveProgress: requestOptions.onReceiveProgress,
  //             data: requestOptions.data,
  //             queryParameters: requestOptions.queryParameters);
  //         if (response != null) {
  //           handler.resolve(response);
  //         } else {
  //           return null;
  //         }
  //       } else {
  //         handler.next(e);
  //       }
  //     }
  //   }));
  //   return dio;
  // }

  // static refreshToken() async {
  //   Response response;
  //   Repository repository = Repository();
  //   var dio = Dio();
  //   final Uri apiUrl = Uri.parse(BASE_PATH + "auth/reIssueAccessToken");
  //   var refreshToken = await repository.readData("refreshToken");
  //   dio.options.headers["Authorization"] = "Bearer " + refreshToken;
  //   try {
  //     response = await dio.postUri(apiUrl);
  //     if (response.statusCode == 200) {
  //       RefreshTokenResponse refreshTokenResponse =
  //           RefreshTokenResponse.fromJson(jsonDecode(response.toString()));
  //       repository.addValue(
  //           'accessToken', refreshTokenResponse.data.accessToken);
  //       repository.addValue(
  //           'refreshToken', refreshTokenResponse.data.refreshToken);
  //     } else {
  //       print(response.toString()); //TODO: logout
  //     }
  //   } catch (e) {
  //     print(e.toString()); //TODO: logout
  //   }
  // }
