import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:readbot/common/index.dart';

Future<bool> askInternetPermission() async {
  final connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile ||
      connectivityResult == ConnectivityResult.wifi) {
    return true;
  } else {
    return false;
  }
}

Future<void> checkNetwork() async {
  bool isNetworkConnected = await askInternetPermission();
  if (!isNetworkConnected) {
    Loading.toast(LocaleKeys.networkError.tr);
  }
}
