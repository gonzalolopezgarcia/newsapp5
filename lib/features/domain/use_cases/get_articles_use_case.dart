import 'package:newsapp5/features/domain/repository/articles_repository.dart';
import 'package:newsapp5/features/domain/entities/articles.dart';

class GetArticlesUseCase {
  final ArticlesRepository repository;

  GetArticlesUseCase(this.repository);

  Future<List<Article>> call() async {
    return await repository.fetchArticles();
  }
}
