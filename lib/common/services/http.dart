import 'dart:async';

import 'package:dio/dio.dart';
import 'package:feed_inbox_app/common/index.dart';
import 'package:get/get.dart' hide Response, FormData, MultipartFile;

class HttpService extends GetxService {
  static HttpService get to => Get.find();

  late final Dio _dio;

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
  Future<String?> requestGet(String url) async {
    try {
      var res = await HttpService.to.get(url);
      return res.data;
    } catch (e) {
      LogService.to.e(e);
      return null;
    }
  }

  Future<Response> retry(RequestOptions requestOptions) async {
    Options options = Options(
      headers: requestOptions.headers,
      extra: requestOptions.extra,
      method: requestOptions.method,
      responseType: requestOptions.responseType,
      contentType: requestOptions.contentType,
      validateStatus: requestOptions.validateStatus,
      receiveTimeout: requestOptions.receiveTimeout,
    );
    options.extra ??= {};
    options.extra!['retried'] = true;

    Response response = await _dio.request(requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: options);
    return response;
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

  bool _shouldRetry(DioError err, RequestOptions requestOptions) {
    if (requestOptions.extra.containsKey('retried') &&
        requestOptions.extra['retried'] == true) {
      return false;
    }
    return err.type == DioErrorType.receiveTimeout ||
        err.type == DioErrorType.sendTimeout ||
        err.type == DioErrorType.connectionTimeout ||
        err.type == DioErrorType.unknown;
  }

  @override
  Future<void> onError(DioError err, ErrorInterceptorHandler handler) async {
    if (_shouldRetry(err, err.requestOptions)) {
      HttpService.to.retry(err.requestOptions);
      return;
    }
    switch (err.type) {
      case DioErrorType.badResponse: // 服务端自定义错误体处理
        {
          final response = err.response;
          // TODO 区分不同服务的错误
          var errorMessage = response?.data;
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
          LogService.to.e(errorMessage);
        }
        break;
      case DioErrorType.cancel:
        break;
      default:
        break;
    }
    // err.error = exception;
    handler.next(err);
  }
}
