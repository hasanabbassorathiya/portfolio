import 'dart:async';

import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_launcher/url_launcher.dart';

const Color kBackgroundColor = Color(0xFF0A192F);
const String kYourName = 'Hasan Abbas Sorathiya';
const String kGetInTouch = 'Contact';
const String kMyResume = 'Resume';

const String kTagLine = 'Senior Flutter developer & Team Lead';
const String kAboutMeContent =
    'I am a Senior Flutter developer and a Full Stack Developer.'
    '\n\nI started programming on my father\'s PC using C/C++ around 2015 and moved to Visual Basic and picked up Java a few years later.'
    ' After studying at Vidyalanakar School of Information Technology, Mumbai, I then got interested in Mobile Application Development using Flutter,'
    ' and Full Stack Developer.'
    '\nAside from programming,'
    ' I have lived in many countries and have learnt something from every culture.'
    ' I am social and love working with colleagues, and I don\’t shy away from expressing what I believe in.';
const kFooterDescription =
    'Ask an Expert: How can mobile teams leverage feature flags and reduce codebase bloat?';
const String kGitUrl = 'https://api.github.com/users/hasanabbassorathiya/repos';

const String kInstagramUrl = 'https://instagram.com/hasanabbassorathiya';
const String kLinkedInUrl = 'https://www.linkedin.com/in/hasanabbassorathiya/';
const String kGitHubUrl = 'https://github.com/hasanabbassorathiya';
const String kResume = 'https://bit.ly/3lE6ghe';
const String kEmail = 'hasanabbassorathiya@gmail.com';

List<String> YourWork = [
  'Flutter',
  'Android',
  'iOS',
  'WordPress',
  'Python',
];

getHeadingStyle3({
  required BuildContext context,
  Color colors = Colors.white,
  double MobileFontSize = 25.0,
  double TabletFontSize = 40.0,
  double DefaultFontSize = 20,
}) {
  return Theme.of(context).textTheme.headline3?.copyWith(
      color: colors,
      overflow: TextOverflow.ellipsis,
      fontSize: ResponsiveValue(
        context,
        defaultValue: DefaultFontSize,
        valueWhen: [
          Condition.smallerThan(
            name: MOBILE,
            value: MobileFontSize,
          ),
          Condition.largerThan(
            name: TABLET,
            value: TabletFontSize,
          )
        ],
      ).value);
}

Widget getVertialSpace({required double height}) {
  return SizedBox(
    height: height,
  );
}

Widget getHorizontalSpace({required double width}) {
  return SizedBox(
    width: width,
  );
}

Widget getCircleSkills({
  required radius,
  required child,
}) {
  return CircleAvatar(
    radius: radius,
    backgroundColor: Colors.white,
    child: Padding(
      padding: EdgeInsets.all(10),
      child: child,
    ),
  );
}

String? encodeQueryParameters(Map<String, String> params) {
  return params.entries
      .map((e) =>
          '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
      .join('&');
}

final Uri emailLaunchUri = Uri(
  scheme: 'mailto',
  path: kEmail,
  query: encodeQueryParameters(
      <String, String>{'subject': 'Example Subject & Symbols are allowed!'}),
);

Future<void> launchInBrowser({required Uri url}) async {
  if (!await launchUrl(
    url,
    mode: LaunchMode.externalApplication,
  )) {
    throw 'Could not launch $url';
  }
}
