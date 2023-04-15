import 'package:get/get.dart';
import 'package:logger/logger.dart';

/// 用户服务
class LogService extends GetxService {
  static LogService get to => Get.find();

  late Logger logger;

  @override
  void onInit() async {
    super.onInit();
    logger = Logger(
      printer: PrettyPrinter(
        methodCount: 0,
        errorMethodCount: 8,
        lineLength: 120,
        colors: true,
        printEmojis: true,
        printTime: true,
      ),
    );
  }

  void d(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    logger.d(message, error, stackTrace);
  }

  void e(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    logger.e(message, error, stackTrace);
  }

  void i(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    logger.i(message, error, stackTrace);
  }
}
