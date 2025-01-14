import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as gttt;
import 'package:get/get_utils/get_utils.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:mobile_assignment/app/services/api_exceptions.dart';


class BaseClient {


  static Future<bool> checkInternetConnection() async {
    bool result = await InternetConnection().hasInternetAccess;
    return result;
  }

  static final Dio _dio = Dio(); //Network.getDio();

  static const int TIME_OUT_DURATION = 50000; // in milliseconds
  // GET request
  static get(
      String url, {
        Map<String, dynamic>? headers,
        Map<String, dynamic>? queryParameters,
        Map<String, dynamic>? data,
        required Function(Response response) onSuccess,
        Function(ApiException)? onError,
        Function(int value, int progress)? onReceiveProgress,
        Function? onLoading,
      }) async {
    bool check = await checkInternetConnection();
    if (check == true) {
      debugPrint("NET AVAILABLE");
      debugPrint("query params: $queryParameters");
      try {
        print(url);
        print(queryParameters);

        // 1) indicate loading state
        onLoading?.call();
        // 2) try to perform http request
        var response = await _dio
            .get(
          url,
          onReceiveProgress: onReceiveProgress,
          queryParameters: queryParameters,
          data: data,
          options: Options(

          ),
        )
            .timeout(const Duration(seconds: TIME_OUT_DURATION));
        debugPrint("$response");
        // 3) return response (api done successfully)
        await onSuccess(response);

      } on DioException catch (error) {
        // dio error (api reach the server but not performed successfully
        // no internet connection
        debugPrint("$error");
        if (error.message!.toLowerCase().contains('socket')) {
          onError?.call(ApiException(
            message: "no_internet_connection".tr,
            url: url,
          )) ??
              _handleError("no_internet_connection".tr);
        }
        print(url);
        // no response
        if (error.response == null) {
          var exception = ApiException(
            url: url,
            message: error.message!,
          );
          return onError?.call(exception) ?? handleApiError(exception);
        }


        // check if the error is 500 (server problem)
        if (error.response?.statusCode == 500) {
          var exception = ApiException(
            message: "server_error".tr,
            url: url,
            statusCode: 500,
          );
          return onError?.call(exception) ?? handleApiError(exception);
        }
      } on SocketException {
        // No internet connection
        onError?.call(ApiException(
          message: "no_internet_connection".tr,
          url: url,
        )) ??
            _handleError("no_internet_connection".tr);
      } on TimeoutException {
        // Api call went out of time
        onError?.call(ApiException(
          message: "server_not_responding".tr,
          url: url,
        )) ??
            _handleError("server_not_responding".tr);
      } catch (error) {
        // unexpected error for example (parsing json error)
        onError?.call(ApiException(
          message: error.toString(),
          url: url,
        )) ??
            _handleError(error.toString());
      }
    } else {
      return false;
    }
  }
  static handleApiError(ApiException apiException, {bool showToast = true}) {
    String msg = apiException.response?.data?['message'] ?? apiException.message;
    debugPrint(apiException.response?.data);
    if (showToast) {
      // CustomSnackBar.showCustomErrorToast(message: msg);
    }
  }

  /// handle errors without response (500, out of time, no internet,..etc)
  static _handleError(String msg) {
    // CustomSnackBar.showCustomErrorToast(message: msg);
  }


}
