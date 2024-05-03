import 'package:flutter/material.dart';
import 'package:omdb_movie_api/ui/widgets/moviedetailtemplate.dart';

import 'ui/pages/homepage.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => HomePage(),
      '/movie_detail': (context) => MoviesDetail()
    },
  ));
}
