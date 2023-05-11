import 'dart:async';

import 'package:dio/dio.dart';
import 'package:feed_inbox_app/common/index.dart';
import 'package:retry/retry.dart';
import 'package:get/get.dart' hide Response, FormData, MultipartFile;

class HttpService extends GetxService {
  static HttpService get to => Get.find();

  late final Dio _dio;

  final retryOption = const RetryOptions(maxAttempts: 2);

  @override
  void onInit() {
    super.onInit();
    // 初始 dio
    var options = BaseOptions(
      baseUrl: ConfigService.to.serverUrl,
      connectTimeout: const Duration(seconds: 10), // 10秒
      receiveTimeout: const Duration(seconds: 10), // 10秒
      headers: {},
      contentType: 'application/json; charset=utf-8',
      responseType: ResponseType.json,
    );

    _dio = Dio(options);
    // 拦截器
    _dio.interceptors.add(RequestInterceptors());
  }

  Future<Response> get(
    String url, {
    Map<String, dynamic>? params,
    dynamic data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    Options requestOptions = options ?? Options();
    Response response = await _dio.get(
      url,
      data: data,
      queryParameters: params,
      options: requestOptions,
      cancelToken: cancelToken,
    );
    return response;
  }

  // TODO 与get融合
  Future<String?> request(String url) async {
    try {
      var res = await HttpService.to.get(url);
      return res.data;
    } catch (e) {
      LogService.to.e(e);
      return null;
    }
  }

  Future<Response> post(
    String url, {
    dynamic data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    var requestOptions = options ?? Options();
    Response response = await _dio.post(
      url,
      data: data ?? {},
      options: requestOptions,
      cancelToken: cancelToken,
    );
    return response;
  }

  Future<Response> put(
    String url, {
    dynamic data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    var requestOptions = options ?? Options();
    Response response = await _dio.put(
      url,
      data: data ?? {},
      options: requestOptions,
      cancelToken: cancelToken,
    );
    return response;
  }

  Future<Response> delete(
    String url, {
    dynamic data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    var requestOptions = options ?? Options();
    Response response = await _dio.delete(
      url,
      data: data ?? {},
      options: requestOptions,
      cancelToken: cancelToken,
    );
    return response;
  }
}

/// 拦截
class RequestInterceptors extends Interceptor {
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // 如果提供了authorization，就不再添加
    // 如果是绝对路径，即不是系统api，也不添加
    if (!options.headers.containsKey('Authorization') &&
        !Uri.parse(options.path).isAbsolute) {
      await UserService.to.refreshTokenIfNeed();
      if (UserService.to.hasActiveAccessToken()) {
        options.headers['Authorization'] =
            'Bearer ${UserService.to.accessToken}';
      }
    }
    handler.next(options);
  }

  @override
  Future<void> onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    handler.next(response);
  }

  @override
  Future<void> onError(DioError err, ErrorInterceptorHandler handler) async {
    // final exception = HttpException(err.message);
    switch (err.type) {
      case DioErrorType.badResponse: // 服务端自定义错误体处理
        {
          final response = err.response;
          String errorMessage = response?.data;
          switch (response?.statusCode) {
            case 401:
              Get.toNamed(RouteNames.systemLogin);
              break;
            case 404:
              break;
            case 500:
              break;
            case 502:
              break;
            default:
              break;
          }
          Loading.error(errorMessage);
          LogService.to.e(errorMessage);
        }
        break;
      case DioErrorType.cancel:
        break;
      case DioErrorType.connectionTimeout:
        break;
      default:
        break;
    }
    // err.error = exception;
    handler.next(err);
  }
}
