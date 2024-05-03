import 'dart:convert';

import 'package:http/http.dart';
import 'package:omdb_movie_api/model/moviesmodel.dart';

class Movies {
  List<ArticleModel> datatobesavedin = [];
  Future<void> getMovies() async {
    var url =
        Uri.http('www.omdbapi.com', '', {'s': 'dog', 'apiKey': '8e320842'});
    var response = await get(url);
    var jsonData = jsonDecode(response.body);
    jsonData['Search'].forEach((element) {
      if (element['Poster'] != null && element['Title'] != null) {
        ArticleModel articleModel = ArticleModel(
          Title: element['Title'],
          Poster: element['Poster'],
          Year: element['Year'],
          Type: element['Type'],
        );
        datatobesavedin.add(articleModel);
      }
    });
  }
}
