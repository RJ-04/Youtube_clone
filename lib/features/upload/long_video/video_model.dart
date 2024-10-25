class VideoModel {
  final String videoUrl;
  final String thumbnail;
  final String title;
  final DateTime datePublished;
  final String description;
  final int views;
  final String videoId;
  final String userId;
  final List likes;
  final String type;

  VideoModel({
    required this.description,
    required this.videoUrl,
    required this.thumbnail,
    required this.title,
    required this.datePublished,
    required this.views,
    required this.videoId,
    required this.userId,
    required this.likes,
    required this.type,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'videoUrl': videoUrl,
      'thumbnail': thumbnail,
      'description': description,
      'title': title,
      'datePublished': datePublished,
      'views': views,
      'videoId': videoId,
      'userId': userId,
      'likes': likes,
      'type': type,
    };
  }

  factory VideoModel.fromMap(Map<String, dynamic> map) {
    return VideoModel(
      videoUrl: map['videoUrl'],
      thumbnail: map['thumbnail'],
      title: map['title'],
      datePublished: map['datePublished'],
      views: map['views'],
      videoId: map['videoId'],
      userId: map['userId'],
      likes: List.from(map['likes']),
      type: map['type'],
      description: map['description'],
    );
  }
}
