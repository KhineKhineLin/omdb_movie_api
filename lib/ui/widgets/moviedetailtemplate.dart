import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../helper/moviedetaildata.dart';
import '../../model/moviesdetailmodel.dart';

class MoviesDetail extends StatefulWidget {
  String? imdbId, posters;
  MoviesDetail({this.imdbId, this.posters});

  @override
  State<MoviesDetail> createState() =>
      _MoviesDetailState(imdbId: imdbId, posters: posters);
}

class _MoviesDetailState extends State<MoviesDetail> {
  String? imdbId, posters;
  _MoviesDetailState({this.imdbId, this.posters});
  DetailMovies detailsMoviesList = DetailMovies();

  getDetailMovies() async {
    DetailMoviesData newsMoviesData = DetailMoviesData();
    await newsMoviesData.getDetailData();
    detailsMoviesList = newsMoviesData.detailMoviesData;
  }

  @override
  void initState() {
    super.initState();
    getDetailMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.indigo, Colors.cyan]),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text("IMDB Ratio:${widget.imdbId}"),
            // Text("IMDBVOTES:${detailsMoviesList.imdbVotes}"),
            // Text("IMDBRating:${detailsMoviesList.imdbRating}")
            Center(
              child: Container(
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: posters ?? "",
                  width: 200,
                  height: 250,
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  width: 400,
                  height: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient:
                          LinearGradient(colors: [Colors.indigo, Colors.cyan])),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "IMDB Ratio:    ${detailsMoviesList.imdbRating}",
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "IMDB Votes:    ${detailsMoviesList.imdbVotes}",
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Years:    ${detailsMoviesList.year}",
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Type :    ${detailsMoviesList.type}",
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "RunTime :     ${detailsMoviesList.runTime}",
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Center(
                child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                            colors: [Colors.indigo, Colors.cyan])),
                    child: Padding(
                      padding: const EdgeInsets.all(11.0),
                      child: Text("Watch Now"),
                    )))
          ],
        ),
      ),
    );
  }
}
