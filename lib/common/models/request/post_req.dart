class PostReq {
  int? latestPostId;

  PostReq({this.latestPostId});

  factory PostReq.fromJson(Map<String, dynamic> json) => PostReq(
        latestPostId: json['latest_post_id'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'latest_post_id': latestPostId,
      };
}
