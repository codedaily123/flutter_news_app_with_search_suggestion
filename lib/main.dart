import 'package:flutter/material.dart';
import 'package:learning/customSearchDelegate.dart';
import 'package:learning/postList.dart';
import 'package:learning/sampleData.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('All posts'),
          actions: [
            Builder(builder: (context) {
              return IconButton(
                icon: Icon(Icons.search),
                onPressed: () => showSearch(
                  context: context,
                  delegate: CustomSearchDelegate(posts: postsData),
                ),
              );
            })
          ],
        ),
        backgroundColor: Colors.white,
        body: PostList(
          posts: postsData,
        ),
      ),
    );
  }
}
