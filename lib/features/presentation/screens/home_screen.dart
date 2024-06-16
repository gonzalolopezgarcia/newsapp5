import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp5/features/presentation/bloc/articles/articles_cubit.dart';
import 'package:newsapp5/features/presentation/bloc/articles/articles_state.dart';
import 'package:newsapp5/features/domain/entities/articles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NewsApp'),
      ),
      body: BlocBuilder<ArticlesCubit, ArticlesState>(
        builder: (context, state) {
          if (state is ArticlesLoading) {
            return const CircularProgressIndicator();
          } else if (state is ArticlesLoaded) {
            return ListView.builder(
              itemCount: state.articles.length,
              itemBuilder: (context, index) {
                Article article = state.articles[index];
                return ListTile(
                  title: Text(article.title),
                  subtitle: Text(article.content),
                  leading: Image.network(article.imageUrl),
                );
              },
            );
          } else {
            return const Text('Error loading articles');
          }
        },
      ),
    );
  }
}
