import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/services/news_service.dart';
import 'package:news_app/widgets/error_message.dart';
import 'package:news_app/widgets/news_list.dart';

class NewsListBuilder extends StatefulWidget {
  final String category;
  const NewsListBuilder({super.key, required this.category});

  @override
  State<NewsListBuilder> createState() => _NewsListBuilderState();
}

class _NewsListBuilderState extends State<NewsListBuilder> {
  late Future<List<ArticleModel>> future;

  bool isLoading = true;
  @override
  initState() {
    future = NewsService(Dio()).getNews(category: widget.category);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return NewsList(
              articles: snapshot.data!,
            );
          } else if (snapshot.hasError) {
            return SliverFillRemaining(
              child: Center(
                  child: ErrorMessage(
                      message: "Check you connection ,and try again")),
            );
          } else {
            return SliverFillRemaining(
                hasScrollBody: false,
                child: Center(
                  child: LoadingIndicator(
                    indicatorType: Indicator.ballClipRotatePulse,
                    colors: const [Colors.blue],
                  ),
                ));
          }
        });
  }
}
