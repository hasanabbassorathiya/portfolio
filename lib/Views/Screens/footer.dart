import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../Contants.dart';

class Footer extends StatefulWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ResponsiveWrapper(
      child: ResponsiveRowColumn(
        rowMainAxisAlignment: MainAxisAlignment.center,
        columnCrossAxisAlignment: CrossAxisAlignment.center,
        rowPadding: const EdgeInsets.all(30),
        columnPadding: const EdgeInsets.all(30),
        layout: ResponsiveRowColumnType.COLUMN,
        children: [
          ResponsiveRowColumnItem(
            child: getVertialSpace(height: size.height * 0.1),
          ),
          ResponsiveRowColumnItem(
            rowFlex: 1,
            child: Text(
              'Thanks for stopping by :)',
              style: getHeadingStyle3(context: context),
            ),
          ),
          ResponsiveRowColumnItem(
            child: getVertialSpace(height: size.height * 0.1),
          ),
          ResponsiveRowColumnItem(
            rowFlex: 1,
            child: Text(
              kFooterDescription,
              style: Theme.of(context).textTheme.headline3?.copyWith(
                  color: Colors.greenAccent,
                  fontSize: ResponsiveValue(
                    context,
                    defaultValue: 25.0,
                    valueWhen: [
                      const Condition.smallerThan(
                        name: MOBILE,
                        value: 30.0,
                      ),
                      const Condition.largerThan(
                        name: TABLET,
                        value: 40.0,
                      )
                    ],
                  ).value),
            ),
          ),
          ResponsiveRowColumnItem(
            rowFlex: 2,
            child: ResponsiveRowColumn(
              rowPadding: EdgeInsets.only(
                  top: ResponsiveValue(
                context,
                defaultValue: MediaQuery.of(context).size.height * 0.2,
                valueWhen: [
                  Condition.smallerThan(
                    name: MOBILE,
                    value: MediaQuery.of(context).size.height * 0.1,
                  ),
                  Condition.largerThan(
                    name: TABLET,
                    value: MediaQuery.of(context).size.height * 0.15,
                  )
                ],
              ).value!.toDouble()),
              rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
              rowCrossAxisAlignment: CrossAxisAlignment.center,
              layout: ResponsiveRowColumnType.ROW,
              children: [
                ResponsiveRowColumnItem(
                  child: FlatButton(
                    onPressed: () async {
                      await launchInBrowser(url: emailLaunchUri);
                    },
                    height: size.height * 0.1,
                    minWidth: size.width * 0.15,
                    hoverColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                      side: const BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    child: Text(
                      kGetInTouch,
                      style: Theme.of(context).textTheme.headline1?.copyWith(
                          color: Colors.white,
                          fontSize: ResponsiveValue(
                            context,
                            defaultValue: 18.0,
                            valueWhen: [
                              const Condition.smallerThan(
                                name: MOBILE,
                                value: 18.0,
                              ),
                              const Condition.largerThan(
                                name: TABLET,
                                value: 22.0,
                              )
                            ],
                          ).value),
                    ),
                  ),
                ),
                ResponsiveRowColumnItem(
                  child: InkWell(
                    onTap: () async {
                      await launchInBrowser(url: Uri.parse(kLinkedInUrl));
                    },
                    child: Text(
                      kYourName,
                      style: Theme.of(context).textTheme.headline2?.copyWith(
                          color: Colors.grey,
                          fontSize: ResponsiveValue(
                            context,
                            defaultValue: 15.0,
                            valueWhen: [
                              const Condition.smallerThan(
                                name: MOBILE,
                                value: 15.0,
                              ),
                              const Condition.largerThan(
                                name: TABLET,
                                value: 20.0,
                              )
                            ],
                          ).value),
                    ),
                  ),
                ),
              ],
            ),
          ),
          ResponsiveRowColumnItem(
            child: getVertialSpace(height: size.height * 0.1),
          ),
          ResponsiveRowColumnItem(
            rowFlex: 1,
            child: Text(
              'Follow me!',
              style: getHeadingStyle3(
                  context: context,
                  DefaultFontSize: 18,
                  MobileFontSize: 18,
                  TabletFontSize: 22),
            ),
          ),
          ResponsiveRowColumnItem(
            child: ResponsiveRowColumn(
              columnMainAxisAlignment: MainAxisAlignment.center,
              rowMainAxisAlignment: MainAxisAlignment.center,
              layout: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
                  ? ResponsiveRowColumnType.COLUMN
                  : ResponsiveRowColumnType.ROW,
              children: [
                ResponsiveRowColumnItem(
                  child: InkWell(
                    onTap: () async {
                      await launchInBrowser(url: Uri.parse(kLinkedInUrl));
                    },
                    child: Image.asset(
                      'assets/icons/linkedin.png',
                      height: 50,
                      width: 50,
                    ),
                  ),
                ),
                ResponsiveRowColumnItem(
                  child: getVertialSpace(
                      height:
                          ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
                              ? size.height * 0.020
                              : size.height * 0.015),
                ),
                ResponsiveRowColumnItem(
                  child: InkWell(
                    onTap: () async {
                      await launchInBrowser(url: Uri.parse(kInstagramUrl));
                    },
                    child: Image.asset(
                      'assets/icons/instagram.png',
                      height: 50,
                      width: 50,
                    ),
                  ),
                ),
                ResponsiveRowColumnItem(
                  child: getVertialSpace(
                      height:
                          ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
                              ? size.height * 0.020
                              : size.height * 0.015),
                ),
                ResponsiveRowColumnItem(
                  child: InkWell(
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
                ),
                ResponsiveRowColumnItem(
                  child: getVertialSpace(
                      height:
                          ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
                              ? size.height * 0.020
                              : size.height * 0.015),
                ),
              ],
            ),
          ),
          ResponsiveRowColumnItem(
            child: getVertialSpace(height: size.height * 0.1),
          ),
        ],
      ),
    );
  }
}
