import 'package:equatable/equatable.dart';
import 'package:newsapp5/features/domain/entities/articles.dart';

abstract class ArticlesState extends Equatable {
  const ArticlesState();

  @override
  List<Object> get props => [];
}

class ArticlesLoading extends ArticlesState {}

class ArticlesLoaded extends ArticlesState {
  final List<Article> articles;

  const ArticlesLoaded(this.articles);

  @override
  List<Object> get props => [articles];
}

class ArticlesError extends ArticlesState {}
