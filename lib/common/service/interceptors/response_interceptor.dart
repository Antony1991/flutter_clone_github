/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-10-24 12:34:46
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-10-24 21:05:30
 * @FilePath: /flutter_clone_github/lib/common/service/interceptors/response_interceptor.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:dio/dio.dart';
import 'package:flutter_clone_github/common/service/result_data.dart';

class ResponseInterceptors extends InterceptorsWrapper {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    ResultData value = ResultData({}, '', 0);
    RequestOptions option = response.requestOptions;
    // value;
    try {
      var header = response.headers[Headers.contentTypeHeader];
      if (header != null && header.toString().contains("text")) {
        value = ResultData(response.data, 'error', 200);
      } else if (response.statusCode! >= 200 && response.statusCode! < 300) {
        value =
            ResultData(response.data, 'error', 200, headers: response.headers);
      }
    } catch (e) {
      print(e.toString());
      value = ResultData(response.data, 'success', response.statusCode,
          headers: response.headers);
    }
    response.data = value;
    super.onResponse(response, handler);
  }
}
