import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:newsapp5/main.dart';
import 'package:newsapp5/features/data/data_sources/article_remote_data_source.dart';
import 'package:newsapp5/features/domain/repository/articles_repository.dart';
import 'package:newsapp5/features/domain/use_cases/get_articles_use_case.dart';
import 'package:newsapp5/features/domain/use_cases/create_article_use_case.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  // Create instances of your dependencies
  final firestore = FirebaseFirestore.instance;
  final articleRemoteDataSource = ArticleRemoteDataSourceImpl(firestore: firestore);
  final articlesRepository = ArticlesRepository(remoteDataSource: articleRemoteDataSource);
  final getArticlesUseCase = GetArticlesUseCase(articlesRepository);
  final createArticleUseCase = CreateArticleUseCase(articlesRepository);

  runApp(MyApp(
    getArticlesUseCase: getArticlesUseCase,
    createArticleUseCase: createArticleUseCase,
  ));

  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp(
      getArticlesUseCase: getArticlesUseCase,
      createArticleUseCase: createArticleUseCase,
    ));

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}

