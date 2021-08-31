import 'package:flutter/material.dart';
import 'package:get_git_repos/models/repoModel.dart';
import 'package:get_git_repos/widgets/reposView.dart';

import '../main.dart';

class RepoScreen extends StatefulWidget {
  RepoScreen();

  @override
  _RepoScreenState createState() => _RepoScreenState();
}

class _RepoScreenState extends State<RepoScreen> {
  String profileUrl = "";
  bool listViewBool = true;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
        flex: 2,
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                flex: 6,
                child: TextField(
                  decoration: const InputDecoration(
                    prefix: Text('github.com/'),
                  ),
                  onSubmitted: (text) {
                    setState(() {
                      profileUrl = text;
                    });
                  },
                ),
              ),
              Expanded(
                flex: 2,
                child: IconButton(
                  icon: Icon(
                    Icons.grid_view_rounded,
                    color: !listViewBool ? Colors.blueAccent : Colors.black54,
                    size: 30.0,
                  ),
                  onPressed: () {
                    setState(() {
                      listViewBool = false;
                    });
                  },
                ),
              ),
              Expanded(
                flex: 2,
                child: IconButton(
                  icon: Icon(
                    Icons.view_list,
                    color: listViewBool ? Colors.blueAccent : Colors.black54,
                    size: 30.0,
                  ),
                  onPressed: () {
                    setState(() {
                      listViewBool = true;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      Expanded(
        flex: 12,
        child: FutureBuilder<List<Repo>>(
          future: fetchRepos(profileUrl),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text('No Repos Found - Check User Name'),
              );
            } else if (snapshot.hasData) {
              return reposView(snapshot.data!, listViewBool);
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    ]);
  }
}
