class UserPost {
  int? userId;
  int? feedId;
  String? feedName;
  dynamic cover;
  int? postId;
  String? link;
  String? content;
  String? title;
  String? authors;
  dynamic tags;
  dynamic category;
  dynamic notes;
  int? publishTime;

  UserPost({
    this.userId,
    this.feedId,
    this.feedName,
    this.cover,
    this.postId,
    this.link,
    this.content,
    this.title,
    this.authors,
    this.tags,
    this.category,
    this.notes,
    this.publishTime,
  });

  factory UserPost.fromJson(Map<String, dynamic> json) => UserPost(
        userId: json['user_id'] as int?,
        feedId: json['feed_id'] as int?,
        feedName: json['feed_name'] as String?,
        cover: json['cover'] as dynamic,
        postId: json['post_id'] as int?,
        link: json['link'] as String?,
        content: json['content'] as String?,
        title: json['title'] as String?,
        authors: json['authors'] as String?,
        tags: json['tags'] as dynamic,
        category: json['category'] as dynamic,
        notes: json['notes'] as dynamic,
        publishTime: json['publish_time'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'user_id': userId,
        'feed_id': feedId,
        'feed_name': feedName,
        'cover': cover,
        'post_id': postId,
        'link': link,
        'content': content,
        'title': title,
        'authors': authors,
        'tags': tags,
        'category': category,
        'notes': notes,
        'publish_time': publishTime,
      };
}
