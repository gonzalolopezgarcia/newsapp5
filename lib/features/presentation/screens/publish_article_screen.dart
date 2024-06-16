import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/publish_article/publish_article_cubit.dart';

class PublishArticleScreen extends StatefulWidget {
  const PublishArticleScreen({super.key});

  @override
  _PublishArticleScreenState createState() => _PublishArticleScreenState();
}

class _PublishArticleScreenState extends State<PublishArticleScreen> {
  final _formKey = GlobalKey<FormState>();
  String _title = '';
  String _content = '';
  final String _imageUrl = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Publish Article'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'Title'),
              onSaved: (value) => _title = value ?? '',
              validator: (value) => value!.isEmpty ? 'This field cannot be empty' : null,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Content'),
              onSaved: (value) => _content = value ?? '',
              validator: (value) => value!.isEmpty ? 'This field cannot be empty' : null,
              maxLines: 10,
            ),
            ElevatedButton(
              onPressed: () => _submitArticle(context),
              child: const Text('Publish'),
            ),
          ],
        ),
      ),
    );
  }

  void _submitArticle(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Call the cubit to publish the article
      BlocProvider.of<PublishArticleCubit>(context).publishArticle(_title, _content, _imageUrl);
    }
  }
}
