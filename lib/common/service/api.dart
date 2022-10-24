/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-10-23 21:48:29
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-10-24 21:28:36
 * @FilePath: /flutter_clone_github/lib/common/service/api.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'dart:collection';

import 'package:dio/dio.dart';
import 'package:flutter_clone_github/common/service/result_data.dart';

class HttpManager {
  static const CONTENT_TYPE_JSON = 'application/json';
  static const CONTENT_TYPE_FORM = "application/x-www-form-urlencoded";

  final Dio _dio = Dio();

  HttpManager() {
    // _dio.interceptors.add(ResponseInterceptors());
  }

  /// 使用默认配置

  Future<ResultData?> netFetch(
      url, params, Map<String, dynamic>? header, Options? option,
      {noTip = false}) async {
    Map<String, dynamic> headers = HashMap();
    if (header != null) {
      headers.addAll(header);
    }

    if (option != null) {
      option.headers = headers;
    } else {
      option = Options(method: 'get');
      option.headers = headers;
    }

    resultError(DioError e) {
      Response? errorResponse;
      print(e);
      if (e.response != null) {
        errorResponse = e.response;
      } else {
        errorResponse = Response(
            requestOptions: RequestOptions(path: url), statusCode: 666);
      }
      if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout) {
        errorResponse!.statusCode = 500;
      }
      return ResultData({}, '', errorResponse?.statusCode);
    }

    Response response;
    try {
      print("########response");
      response = await _dio.request(url, data: params, options: option);
    } on DioError catch (e) {
      return resultError(e);
    }
    if (response.data is DioError) {
      return resultError(response.data);
    }
    return ResultData(
        response.data['data'], response.data['msg'], response.data['status']);
  }
}

final HttpManager httpManager = HttpManager();
