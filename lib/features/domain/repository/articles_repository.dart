import 'package:newsapp5/features/data/data_sources/article_remote_data_source.dart';
import 'package:newsapp5/features/domain/entities/articles.dart';

class ArticlesRepository {
  final ArticleRemoteDataSource remoteDataSource;

  ArticlesRepository({required this.remoteDataSource});

  Future<List<Article>> fetchArticles() async {
    try {
      return await remoteDataSource.fetchArticles();
    } catch (e) {
      throw Exception('Failed to load articles: $e');
    }
  }

  Future<void> createArticle(
      String title, String content, String imageUrl) async {
    try {
      await remoteDataSource.createArticle(title, content, imageUrl);
    } catch (e) {
      throw Exception('Failed to create article: $e');
    }
  }
}
