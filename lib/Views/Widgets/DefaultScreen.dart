import 'package:flutter/material.dart';
import 'package:portfolio/Contants.dart';

import '../Screens/About.dart';
import '../Screens/Homepage.dart';
import '../Screens/footer.dart';
import '../Screens/my_project.dart';

class DefaultScreen extends StatefulWidget {
  @override
  State<DefaultScreen> createState() => _DefaultScreenState();
}

class _DefaultScreenState extends State<DefaultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        title: const Text('Hasan Abbas Sorathiya'),
        actions: [
          InkWell(
            onTap: () async {
              await launchInBrowser(url: Uri.parse(kLinkedInUrl));
            },
            child: Image.asset(
              'assets/icons/linkedin.png',
              height: 50,
              width: 50,
            ),
          ),
          InkWell(
            onTap: () async {
              await launchInBrowser(url: Uri.parse(kInstagramUrl));
            },
            child: Image.asset(
              'assets/icons/instagram.png',
              height: 50,
              width: 50,
            ),
          ),
          InkWell(
            onTap: () async {
              await launchInBrowser(url: Uri.parse(kGitHubUrl));
            },
            child: Image.asset(
              'assets/icons/github.png',
              color: Colors.white,
              height: 50,
              width: 50,
            ),
          ),
        ],
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height * 0.9,
        child: ListView(
          shrinkWrap: true,
          children: [
            HomePage(),
            AboutUs(),
            MyProject(),
            Footer(),
          ],
        ),
      ),
    );
  }
}
