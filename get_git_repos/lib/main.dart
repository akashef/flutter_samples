import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_git_repos/screens/reposScreen.dart';
import 'package:http/http.dart' as http;
import 'models/repoModel.dart';

void main() => runApp(const MyApp());

List<Repo> repos_data = [];
String repoURL = "kashef123";

Future<List<Repo>> fetchRepos(String newUrl) async {
  // check if it is same url
  // true : don't make new request
  if (newUrl != repoURL) {
    repoURL = newUrl;
    final response = await http
        .get(Uri.parse("https://api.github.com/users/" + repoURL + "/repos"));
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
      repos_data = parsed.map<Repo>((json) => Repo.fromJson(json)).toList();
      return repos_data;
    } else {
      // If the server did not return a 200 OK response,
      throw Exception('Failed to load Repos');
    }
  } else {
    return repos_data;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTitle = 'GitHub Repos';

    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.white,
        accentColor: Colors.cyan[600],
        textTheme: TextTheme(
            bodyText2: TextStyle(
          color: Colors.white,
        )),
      ),
      home: Padding(
        padding: const EdgeInsets.all(8.0),
        child: MyHomePage(title: appTitle),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: RepoScreen(),
    );
  }
}
