class Post {
  int? userId;
  int? feedId;
  int? postId;
  String? link;
  String? content;
  String? title;
  String? authors;
  dynamic tags;
  dynamic category;
  dynamic notes;
  int? publishTime;

  Post({
    this.userId,
    this.feedId,
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

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        userId: json['user_id'] as int?,
        feedId: json['feed_id'] as int?,
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
