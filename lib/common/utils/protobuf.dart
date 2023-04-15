import 'dart:convert';

import 'package:fixnum/fixnum.dart';
import 'package:protobuf/protobuf.dart';

String customToProto3Json(
  GeneratedMessage message,
) {
  Map<String, dynamic> json = message.toProto3Json() as Map<String, dynamic>;
  json.forEach((key, value) {
    if (value is Int64) {
      json[key] = value.toInt();
    }
  });
  return jsonEncode(json);
}
