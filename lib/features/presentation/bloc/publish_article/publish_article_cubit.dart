import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp5/features/domain/use_cases/create_article_use_case.dart';
import 'publish_article_state.dart';

class PublishArticleCubit extends Cubit<PublishArticleState> {
  final CreateArticleUseCase createArticleUseCase;

  PublishArticleCubit(this.createArticleUseCase) : super(PublishArticleInitial());

  Future<void> publishArticle(String title, String content, String imageUrl) async {
    emit(PublishArticleLoading());
    try {
      await createArticleUseCase(title, content, imageUrl);
      emit(PublishArticleSuccess());
    } catch (e) {
      emit(PublishArticleError(e.toString()));
    }
  }
}
