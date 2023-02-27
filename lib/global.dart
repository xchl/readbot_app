import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'common/index.dart';

class Global {
  static Future<void> init() async {
    // 这个表示先将原生端与flutter的接口初始化，然后再处理后续操作，这样能保证代码运行正确。
    WidgetsFlutterBinding.ensureInitialized();

    // await Future.wait([
    //   Get.putAsync<ConfigService>(() async => await ConfigService().init()),
    // ]).whenComplete(() {});
    Get.put<ConfigService>(ConfigService());
  }
}
