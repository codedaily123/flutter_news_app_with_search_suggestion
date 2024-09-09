import 'package:flutter/material.dart';
import 'package:learning/news.dart';
import 'package:learning/postList.dart';

class CustomSearchDelegate extends SearchDelegate {
  CustomSearchDelegate({required this.posts});

  final List<News> posts;
  List<News> localResult = [];

  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
          onPressed: () => query.isEmpty ? close(context, null) : query = "",
          icon: Icon(Icons.clear),
        ),
      ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
        onPressed: () => close(context, null),
        icon: Icon(Icons.arrow_back),
      );

  @override
  Widget buildResults(BuildContext context) => localResult.isEmpty
      ? Center(
          child: Text(
            "No Result",
            style: TextStyle(fontSize: 24),
          ),
        )
      : PostList(posts: localResult);

  @override
  Widget buildSuggestions(BuildContext context) {
    localResult = posts.where((News post) {
      final String title = post.title.toLowerCase();
      final String body = post.body.toLowerCase();
      final String input = query.toLowerCase();

      return title.contains(input) || body.contains(input);
    }).toList();

    return localResult.isEmpty
        ? Center(
            child: Text(
              "No Result",
              style: TextStyle(fontSize: 24),
            ),
          )
        : PostList(posts: localResult);
  }
}
