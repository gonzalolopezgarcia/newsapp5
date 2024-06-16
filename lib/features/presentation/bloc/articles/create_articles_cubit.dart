import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../domain/use_cases/create_article_use_case.dart';

part 'create_articles_state.dart';

class CreateArticleCubit extends Cubit<CreateArticleState> {
  final CreateArticleUseCase createArticleUseCase;

  CreateArticleCubit(this.createArticleUseCase) : super(CreateArticleInitial());

  void createArticle(String title, String content, String imageUrl) async {
    emit(CreatingArticle());
    try {
      await createArticleUseCase.call(title, content, imageUrl);
      emit(ArticleCreated());
    } catch (e) {
      emit(CreateArticleError('Failed to create article'));
    }
  }
}
