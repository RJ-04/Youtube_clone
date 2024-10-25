import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'video_model.dart';

final longVideoProvider =
    Provider((ref) => VideoRepository(firestore: FirebaseFirestore.instance));

class VideoRepository {
  FirebaseFirestore firestore;

  VideoRepository({required this.firestore});

  uploadVideoToFirestore({
    required String videoUrl,
    required String thumbnail,
    required String title,
    required String videoId,
    required DateTime datePublished,
    required String userId,
    required String description,
  }) async {
    VideoModel video = VideoModel(
      videoUrl: videoUrl,
      thumbnail: thumbnail,
      title: title,
      datePublished: datePublished,
      views: 0,
      videoId: videoId,
      userId: userId,
      likes: [],
      type: 'video',
      description: description,
    );

    await firestore.collection('videos').doc(videoId).set(video.toMap());
  }
}
