class UserFeed {
  int? userId;
  int? feedId;
  String? url;
  String? name;
  dynamic icon;
  String? logo;
  String? description;
  int? createdTime;

  UserFeed({
    this.userId,
    this.feedId,
    this.url,
    this.name,
    this.icon,
    this.logo,
    this.description,
    this.createdTime,
  });

  factory UserFeed.fromJson(Map<String, dynamic> json) => UserFeed(
        userId: json['user_id'] as int?,
        feedId: json['feed_id'] as int?,
        url: json['url'] as String?,
        name: json['name'] as String?,
        icon: json['icon'] as dynamic,
        logo: json['logo'] as String?,
        description: json['description'] as String?,
        createdTime: json['created_time'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'user_id': userId,
        'feed_id': feedId,
        'url': url,
        'name': name,
        'icon': icon,
        'logo': logo,
        'description': description,
        'created_time': createdTime,
      };
}
