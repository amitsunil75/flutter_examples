import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RefreshAdaptiveExample extends StatefulWidget {
  const RefreshAdaptiveExample({super.key});

  @override
  State<RefreshAdaptiveExample> createState() => _RefreshAdaptiveExampleState();
}

class _RefreshAdaptiveExampleState extends State<RefreshAdaptiveExample> {
  late Future<List<Post>> _postsFuture;

  @override
  void initState() {
    super.initState();
    _postsFuture = fetchPosts();
  }

  Future<List<Post>> fetchPosts() async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/posts?_limit=15');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((json) => Post.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch posts');
    }
  }

  Future<void> _onRefresh() async {
    final posts = await fetchPosts();
    setState(() {
      _postsFuture = Future.value(posts);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Adaptive RefreshIndicator')),
      body: FutureBuilder<List<Post>>(
        future: _postsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final posts = snapshot.data!;
          return RefreshIndicator.adaptive(
            onRefresh: _onRefresh,
            child: ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: posts.length,
              itemBuilder: (context, i) {
                final post = posts[i];
                return ListTile(
                  title: Text(post.title, maxLines: 1, overflow: TextOverflow.ellipsis),
                  subtitle: Text(post.body, maxLines: 2, overflow: TextOverflow.ellipsis),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class Post {
  final String title;
  final String body;

  Post({required this.title, required this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      title: json['title'] as String,
      body: json['body'] as String,
    );
  }
}
