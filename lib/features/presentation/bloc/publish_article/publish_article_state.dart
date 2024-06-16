import 'package:equatable/equatable.dart';

abstract class PublishArticleState extends Equatable {
  const PublishArticleState();

  @override
  List<Object> get props => [];
}

class PublishArticleInitial extends PublishArticleState {}

class PublishArticleLoading extends PublishArticleState {}

class PublishArticleSuccess extends PublishArticleState {}

class PublishArticleError extends PublishArticleState {
  final String message;

  const PublishArticleError(this.message);

  @override
  List<Object> get props => [message];
}
