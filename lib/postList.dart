import 'package:flutter/material.dart';
import 'package:learning/news.dart';

class PostList extends StatelessWidget {
  const PostList({super.key, required this.posts});

  final List<News> posts;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  posts[index].title,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(posts[index].body),
              ],
            ),
          ),
        );
      },
    );
  }
}
