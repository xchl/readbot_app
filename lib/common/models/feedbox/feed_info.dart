class FeedInfo {
  String? url;
  String? icon;
  String? name;

  FeedInfo({this.url, this.icon, this.name});

  factory FeedInfo.fromJson(Map<String, dynamic> json) => FeedInfo(
        url: json['url'] as String?,
        icon: json['icon'] as String?,
        name: json['name'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'url': url,
        'icon': icon,
        'name': name,
      };
}
