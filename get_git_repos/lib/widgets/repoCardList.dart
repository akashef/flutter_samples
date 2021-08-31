import 'package:flutter/material.dart';
import 'package:get_git_repos/models/repoModel.dart';

class RepoCardList extends StatelessWidget {
  final Repo listCardRepo;
  RepoCardList(this.listCardRepo);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            tileColor: Theme.of(context).accentColor,
            leading: Icon(Icons.code),
            title: Text(
              listCardRepo.title,
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            subtitle: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    listCardRepo.language,
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox.fromSize(
                    size: Size(45, 45), // button width and height
                    child: ClipOval(
                      child: Material(
                        color: Colors.orangeAccent, // button color
                        child: InkWell(
                          splashColor: Colors.green, // splash color
                          onTap: () {}, // button pressed
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.remove_red_eye_sharp), // icon
                              Text((listCardRepo.watchersCount)
                                  .toString()), // text
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox.fromSize(
                    size: Size(45, 45), // button width and height
                    child: ClipOval(
                      child: Material(
                        color: Colors.orangeAccent, // button color
                        child: InkWell(
                          splashColor: Colors.green, // splash color
                          onTap: () {}, // button pressed
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.call_merge), // icon
                              Text(
                                  (listCardRepo.forksCount).toString()), // text
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ]),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              listCardRepo.description,
              style: TextStyle(
                color: Theme.of(context).accentColor,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
