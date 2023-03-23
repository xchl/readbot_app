///
//  Generated code. Do not modify.
//  source: readbot_proto/request.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use registerInfoDescriptor instead')
const RegisterInfo$json = const {
  '1': 'RegisterInfo',
  '2': const [
    const {'1': 'username', '3': 1, '4': 1, '5': 9, '10': 'username'},
    const {'1': 'email', '3': 2, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'password', '3': 3, '4': 1, '5': 9, '10': 'password'},
  ],
};

/// Descriptor for `RegisterInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List registerInfoDescriptor = $convert.base64Decode('CgxSZWdpc3RlckluZm8SGgoIdXNlcm5hbWUYASABKAlSCHVzZXJuYW1lEhQKBWVtYWlsGAIgASgJUgVlbWFpbBIaCghwYXNzd29yZBgDIAEoCVIIcGFzc3dvcmQ=');
@$core.Deprecated('Use loginInfoDescriptor instead')
const LoginInfo$json = const {
  '1': 'LoginInfo',
  '2': const [
    const {'1': 'email', '3': 1, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
  ],
};

/// Descriptor for `LoginInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginInfoDescriptor = $convert.base64Decode('CglMb2dpbkluZm8SFAoFZW1haWwYASABKAlSBWVtYWlsEhoKCHBhc3N3b3JkGAIgASgJUghwYXNzd29yZA==');
@$core.Deprecated('Use clientInfoDescriptor instead')
const ClientInfo$json = const {
  '1': 'ClientInfo',
  '2': const [
    const {'1': 'client_name', '3': 1, '4': 1, '5': 9, '10': 'clientName'},
  ],
};

/// Descriptor for `ClientInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List clientInfoDescriptor = $convert.base64Decode('CgpDbGllbnRJbmZvEh8KC2NsaWVudF9uYW1lGAEgASgJUgpjbGllbnROYW1l');
@$core.Deprecated('Use authRequestDescriptor instead')
const AuthRequest$json = const {
  '1': 'AuthRequest',
  '2': const [
    const {'1': 'client_info', '3': 1, '4': 1, '5': 11, '6': '.request.ClientInfo', '10': 'clientInfo'},
    const {'1': 'register_info', '3': 2, '4': 1, '5': 11, '6': '.request.RegisterInfo', '9': 0, '10': 'registerInfo'},
    const {'1': 'login_info', '3': 3, '4': 1, '5': 11, '6': '.request.LoginInfo', '9': 0, '10': 'loginInfo'},
  ],
  '8': const [
    const {'1': 'request'},
  ],
};

/// Descriptor for `AuthRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List authRequestDescriptor = $convert.base64Decode('CgtBdXRoUmVxdWVzdBI0CgtjbGllbnRfaW5mbxgBIAEoCzITLnJlcXVlc3QuQ2xpZW50SW5mb1IKY2xpZW50SW5mbxI8Cg1yZWdpc3Rlcl9pbmZvGAIgASgLMhUucmVxdWVzdC5SZWdpc3RlckluZm9IAFIMcmVnaXN0ZXJJbmZvEjMKCmxvZ2luX2luZm8YAyABKAsyEi5yZXF1ZXN0LkxvZ2luSW5mb0gAUglsb2dpbkluZm9CCQoHcmVxdWVzdA==');
