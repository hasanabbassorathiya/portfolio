import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:portfolio/Contants.dart';

import '../Models/Git/repo_model.dart';

class ControllerProvider extends ChangeNotifier {
  static var ho = http.Client();
  Future<List<RepoModel>> getRepoDetails() async {
    var response = await ho.get(
      Uri.parse(kGitUrl),
    );
    if (response.statusCode == 200) {
      List<RepoModel> model = repoModelFromJson(response.body.toString());

      return model;
    } else {
      return [
        RepoModel(
          name: 'Check my Git Repo Directly',
          owner: Owner(
            avatarUrl: 'https://avatars.githubusercontent.com/u/48181995?v=4',
          ),
        ),
      ];
    }
  }
}
