part of 'create_articles_cubit.dart';

@immutable
abstract class CreateArticleState {}

class CreateArticleInitial extends CreateArticleState {}

class CreatingArticle extends CreateArticleState {}

class ArticleCreated extends CreateArticleState {}

class CreateArticleError extends CreateArticleState {
  final String message;
  CreateArticleError(this.message);
}
