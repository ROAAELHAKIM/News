import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/models/NewsResponse.dart';

class NewsItem extends StatelessWidget {
  Articles artical;

  NewsItem({required this.artical, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),

      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
              child: CachedNetworkImage(
                imageUrl: artical.urlToImage??" ",
                placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  artical.source?.name ?? " ",
                  style: TextStyle(fontWeight: FontWeight.w300, color: Colors.grey),
                ),
                Text(
                  artical.title ?? " ",
                  style:
                      TextStyle(fontWeight: FontWeight.w700, color: Colors.black),
                ),
                Text(
                  artical.description ?? " ",
                  style:
                      TextStyle(fontWeight: FontWeight.w300, color: Colors.black),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
