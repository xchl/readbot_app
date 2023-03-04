import 'dart:convert';

import 'package:crypto/crypto.dart';

/// 加密类
class EncryptUtil {
  static String sha256Encode(String content) {
    var bytes = utf8.encode(content);
    var digest = sha256.convert(bytes);
    return digest.toString();
  }
}
