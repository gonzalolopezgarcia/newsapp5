import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:newsapp5/features/domain/entities/articles.dart';

class ArticleModel {
  final String id;
  final String title;
  final String content;
  final String imageUrl;
  final DateTime publishedDate;

  ArticleModel({
    required this.id,
    required this.title,
    required this.content,
    required this.imageUrl,
    required this.publishedDate,
  });

  factory ArticleModel.fromFirestore(Map<String, dynamic> firestoreData) {
    return ArticleModel(
      id: firestoreData['id'] as String? ?? '',
      title: firestoreData['title'] as String? ?? '',
      content: firestoreData['content'] as String? ?? '',
      imageUrl: firestoreData['imageUrl'] as String? ?? '',
      publishedDate: (firestoreData['publishedDate'] as Timestamp?)?.toDate() ?? DateTime.now(),
    );
  }

  Article toEntity() {
    return Article(
      id: id,
      title: title,
      content: content,
      imageUrl: imageUrl,
      publishedDate: publishedDate,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'imageUrl': imageUrl,
      'publishedDate': publishedDate.toIso8601String(),
    };
  }
}
