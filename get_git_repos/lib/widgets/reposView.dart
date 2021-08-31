import 'package:flutter/material.dart';
import 'package:get_git_repos/models/repoModel.dart';
import 'package:get_git_repos/widgets/repoCardGrid.dart';
import 'package:get_git_repos/widgets/repoCardList.dart';

import '../main.dart';

class reposView extends StatefulWidget {
  List<Repo> reposList = repos_data;
  bool listViewBool = true;

  reposView(this.reposList, this.listViewBool);

  @override
  _RepoListState createState() => _RepoListState();
}

class _RepoListState extends State<reposView> {
  void updateModel() {
    setState(() {
      widget.reposList = repos_data;
    });
  }

  void changeToList() {
    setState(() {
      widget.listViewBool = true;
    });
  }

  void changeToGrid() {
    setState(() {
      widget.listViewBool = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.listViewBool) {
      return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: widget.reposList.length,
        itemBuilder: (context, index) {
          return RepoCardList(widget.reposList[index]);
        },
      );
    } else {
      return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: MediaQuery.of(context).size.width /
                MediaQuery.of(context).size.height),
        itemCount: widget.reposList.length,
        itemBuilder: (context, index) {
          return RepoCardGrid(widget.reposList[index]);
        },
      );
    }
  }
}
