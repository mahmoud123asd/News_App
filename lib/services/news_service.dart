import 'package:dio/dio.dart';
import 'package:news_app/models/article_model.dart';

class NewsService {
  final Dio dio;
  NewsService(this.dio);

  Future<List<ArticleModel>> getNews({required String category}) async {
    try {
      var response = await dio.get(
          'https://newsapi.org/v2/top-headlines?country=us&apiKey=1efc355c5d8644469b0e2b91fadbe114&category=$category');
      Map<String, dynamic> jsonData = response.data;
      List<dynamic> articles = jsonData['articles'];
      List<ArticleModel> articleList = [];
      for (var article in articles) {
        ArticleModel articlemodel = ArticleModel.fromJson(article);
        articleList.add(articlemodel);
      }
      return articleList;
    }  on DioException catch (dioError) {
    // Handle Dio-specific errors here
    //print('Dio error: ${dioError.message}');
    //print('Response data: ${dioError.response?.data}');
    throw Exception("Failed to fetch news: ${dioError.message}");
  } catch (e) {
    // Handle other types of exceptions
    //print("Unexpected error: $e");
    throw Exception("Something went wrong: $e");
  }
  }
}
