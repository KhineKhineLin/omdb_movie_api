import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:omdb_movie_api/helper/moviesdata.dart';
import 'package:omdb_movie_api/model/moviesmodel.dart';

import '../widgets/moviestemplate.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ArticleModel> articles = <ArticleModel>[];
  bool _loading = true;

  getMovies() async {
    Movies moviesdata = Movies();
    await moviesdata.getMovies();
    articles = moviesdata.datatobesavedin;
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'OMDb',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: ListView.builder(
              itemCount: articles.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => Navigator.pushNamed(context, '/movie_detail'),
                  child: MoviesTemplate(
                    Poster: articles[index].Poster,
                    Title: articles[index].Title,
                    Year: articles[index].Year,
                    
                  ),
                );
              }),
        ),
      ),
    );
  }
}
