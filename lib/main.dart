import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:newsapp5/features/presentation/bloc/articles/articles_cubit.dart';
import 'package:newsapp5/features/presentation/bloc/publish_article/publish_article_cubit.dart';
import 'package:newsapp5/features/presentation/screens/home_screen.dart';
import 'package:newsapp5/features/domain/repository/articles_repository.dart';
import 'package:newsapp5/features/domain/use_cases/get_articles_use_case.dart';
import 'package:newsapp5/features/domain/use_cases/create_article_use_case.dart';
import 'package:newsapp5/features/data/data_sources/article_remote_data_source.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final firestore = FirebaseFirestore.instance;
  final articleRemoteDataSource = ArticleRemoteDataSourceImpl(firestore: firestore);
  final articlesRepository = ArticlesRepository(remoteDataSource: articleRemoteDataSource);
  final getArticlesUseCase = GetArticlesUseCase(articlesRepository);
  final createArticleUseCase = CreateArticleUseCase(articlesRepository);

  runApp(MyApp(
    getArticlesUseCase: getArticlesUseCase,
    createArticleUseCase: createArticleUseCase,
  ));
}

class MyApp extends StatelessWidget {
  final GetArticlesUseCase getArticlesUseCase;
  final CreateArticleUseCase createArticleUseCase;

  const MyApp({super.key, 
    required this.getArticlesUseCase,
    required this.createArticleUseCase,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ArticlesCubit(getArticlesUseCase),
        ),
        BlocProvider(
          create: (context) => PublishArticleCubit(createArticleUseCase),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}

