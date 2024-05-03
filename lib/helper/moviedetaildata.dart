import 'dart:convert';

import 'package:http/http.dart';

import '../model/moviesdetailmodel.dart';

class DetailMoviesData {
  DetailMovies detailMoviesData = DetailMovies();
  static var imdbResult;

  Future<void> getDetailData() async {
    var url = Uri.http(
        'www.omdbapi.com', '', {'apiKey': 'C80666d6', 'i': imdbResult});

    var response = await get(url);
    var detailData = jsonDecode(response.body);

    DetailMovies detailMovies = DetailMovies(
        title: detailData['Title'],
        year: detailData['Year'],
        imdbRating: detailData['imdbRating'],
        imdbVotes: detailData['imdbVotes'],
        runTime: detailData['Runtime'],
        type: detailData['Type'],
        poster: detailData['Poster']);

    detailMoviesData = detailMovies;
  }
}
