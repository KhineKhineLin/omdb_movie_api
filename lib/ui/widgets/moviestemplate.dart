import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MoviesTemplate extends StatelessWidget {
  final String? Poster, Title, Year, imdbID;
  MoviesTemplate({this.Poster, this.Title, this.Year, this.imdbID});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: CachedNetworkImage(
                  imageUrl: Poster ?? '',
                  width: 150,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      Title ?? '',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      Year ?? '',
                      style: TextStyle(fontSize: 15, color: Colors.grey[800]),
                    ),
                   
                    
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
