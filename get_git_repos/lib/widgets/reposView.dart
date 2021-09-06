import 'package:flutter/material.dart';
import 'package:get_git_repos/models/repoModel.dart';
import 'package:get_git_repos/widgets/repoCardGrid.dart';
import 'package:get_git_repos/widgets/repoCardList.dart';

import '../main.dart';

class reposView extends StatelessWidget {
  List<Repo> reposList = repos_data;
  bool listViewBool = true;

  reposView(this.reposList, this.listViewBool);

  @override
  build(BuildContext context) {
    if (listViewBool) {
      return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: reposList.length,
        itemBuilder: (context, index) {
          return RepoCardList(reposList[index]);
        },
      );
    } else {
      return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: MediaQuery.of(context).size.width /
                MediaQuery.of(context).size.height),
        itemCount: reposList.length,
        itemBuilder: (context, index) {
          return RepoCardGrid(reposList[index]);
        },
      );
    }
  }
}
