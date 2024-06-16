import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp5/features/domain/use_cases/get_articles_use_case.dart';
import 'articles_state.dart';

class ArticlesCubit extends Cubit<ArticlesState> {
  final GetArticlesUseCase getArticlesUseCase;

  ArticlesCubit(this.getArticlesUseCase) : super(ArticlesLoading());

  Future<void> loadArticles() async {
    try {
      final articles = await getArticlesUseCase();
      emit(ArticlesLoaded(articles));
    } catch (e) {
      emit(ArticlesError());
    }
  }
}
