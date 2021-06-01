import 'package:flutter/material.dart';
import 'package:git/git.dart';

class CommitOverview extends StatelessWidget {
  final GitDir gitDir;

  const CommitOverview({Key? key, required this.gitDir}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<Map<String, Commit>>(
        future: gitDir.commits(),
        builder: (context, snapshot) => snapshot.hasData
            ? _buildCommitList(snapshot.data)
            : CircularProgressIndicator(),
      ),
    );
  }

  Widget _buildCommitList(Map<String, Commit>? commits) => commits != null
      ? ListView.separated(
          itemBuilder: (context, index) =>
              _buildCommit(commits.values.toList()[index]),
          separatorBuilder: (context, index) => Divider(),
          itemCount: commits.length)
      : Center(
          child: Text("No commits."),
        );

  Widget _buildCommit(Commit commit) => ListTile(
        leading: CircleAvatar(child: Text(commit.author[0].toUpperCase())),
        title: Text(
          commit.message,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      );
}
