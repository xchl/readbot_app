class FakeResponse {
  String? message;

  FakeResponse({this.message});

  factory FakeResponse.fromJson(Map<String, dynamic> json) => FakeResponse(
        message: json['message'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'message': message,
      };
}
