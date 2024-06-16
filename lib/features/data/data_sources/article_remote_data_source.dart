import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:newsapp5/features/data/models/article_model.dart';
import 'package:newsapp5/features/domain/entities/articles.dart';

abstract class ArticleRemoteDataSource {
  Future<List<Article>> fetchArticles();
  Future<void> createArticle(String title, String content, String imageUrl);
}

class ArticleRemoteDataSourceImpl implements ArticleRemoteDataSource {
  final FirebaseFirestore firestore;

  ArticleRemoteDataSourceImpl({required this.firestore});

  @override
  Future<List<Article>> fetchArticles() async {
    try {
      var snapshot = await firestore.collection('articles').get();
      return snapshot.docs
          .map((doc) =>
              ArticleModel.fromFirestore(doc.data()).toEntity())
          .toList();
    } catch (e) {
      throw Exception('Failed to load articles: $e');
    }
  }

  @override
  Future<void> createArticle(
      String title, String content, String imageUrl) async {
    try {
      await firestore.collection('articles').add({
        'title': title,
        'content': content,
        'imageUrl': imageUrl,
        'publishedDate': DateTime.now().toIso8601String(),
      });
    } catch (e) {
      throw Exception('Failed to create article: $e');
    }
  }
}
