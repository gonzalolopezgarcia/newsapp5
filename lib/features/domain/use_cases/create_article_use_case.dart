import 'package:newsapp5/features/domain/repository/articles_repository.dart';

class CreateArticleUseCase {
  final ArticlesRepository repository;

  CreateArticleUseCase(this.repository);

  Future<void> call(String title, String content, String imageUrl) async {
    return await repository.createArticle(title, content, imageUrl);
  }
}
