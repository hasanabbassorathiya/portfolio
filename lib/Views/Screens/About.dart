import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../Contants.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ResponsiveWrapper(
      shrinkWrap: true,
      child: ResponsiveRowColumn(
        rowMainAxisAlignment: MainAxisAlignment.center,
        columnCrossAxisAlignment: CrossAxisAlignment.start,
        rowPadding: const EdgeInsets.all(30),
        columnPadding: const EdgeInsets.all(30),
        layout: ResponsiveRowColumnType.COLUMN,
        columnVerticalDirection: VerticalDirection.down,
        children: [
          ResponsiveRowColumnItem(
            rowFlex: 1,
            child: Text(
              'About Me',
              style: getHeadingStyle3(context: context),
            ),
          ),
          ResponsiveRowColumnItem(
            child: getVertialSpace(height: size.height * 0.050),
          ),
          ResponsiveRowColumnItem(
            rowColumn: true,
            rowFlex: 1,
            child: ResponsiveRowColumn(
              columnCrossAxisAlignment: CrossAxisAlignment.start,
              rowCrossAxisAlignment: CrossAxisAlignment.start,
              rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
              columnMainAxisAlignment: MainAxisAlignment.spaceBetween,
              layout: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
                  ? ResponsiveRowColumnType.COLUMN
                  : ResponsiveRowColumnType.ROW,
              children: [
                ResponsiveRowColumnItem(
                  child: Container(
                    width: size.width * 0.5,
                    child: Text(
                      kAboutMeContent,
                      style: Theme.of(context).textTheme.headline2?.copyWith(
                          color: Colors.blueGrey,
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
                                value: 25.0,
                              )
                            ],
                          ).value),
                    ),
                  ),
                ),
                ResponsiveRowColumnItem(
                  child: Image.asset(
                    'assets/icons/flutter.png',
                    width: size.width * 0.3,
                    height: size.height * 0.5,
                  ),
                ),
              ],
            ),
          ),
          ResponsiveRowColumnItem(
            child: getVertialSpace(height: size.height * 0.050),
          ),
          //Skills
          ResponsiveRowColumnItem(
            rowFlex: 1,
            child: Text(
              'Skills',
              style: getHeadingStyle3(context: context),
            ),
          ),
          ResponsiveRowColumnItem(
            child: getVertialSpace(height: size.height * 0.050),
          ),
          ResponsiveRowColumnItem(
            rowFlex: 1,
            child: ResponsiveRowColumn(
              layout: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
                  ? ResponsiveRowColumnType.COLUMN
                  : ResponsiveRowColumnType.ROW,
              columnCrossAxisAlignment: CrossAxisAlignment.start,
              rowCrossAxisAlignment: CrossAxisAlignment.start,
              rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
              columnMainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ResponsiveRowColumnItem(
                  child: getCircleSkills(
                    radius: size.height * 0.1,
                    child: Image.asset(
                      'assets/icons/flutter.png',
                    ),
                  ),
                ),
                ResponsiveRowColumnItem(
                  child: !ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
                      ? getHorizontalSpace(
                          width: size.width * 0.02,
                        )
                      : getVertialSpace(
                          height: size.height * 0.02,
                        ),
                ),
                ResponsiveRowColumnItem(
                  child: getCircleSkills(
                    radius: size.height * 0.1,
                    child: Image.asset(
                      'assets/icons/github.png',
                    ),
                  ),
                ),
                ResponsiveRowColumnItem(
                  child: !ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
                      ? getHorizontalSpace(
                          width: size.width * 0.02,
                        )
                      : getVertialSpace(
                          height: size.height * 0.02,
                        ),
                ),
                ResponsiveRowColumnItem(
                  child: getCircleSkills(
                    radius: size.height * 0.1,
                    child: Image.asset(
                      'assets/icons/instagram.png',
                    ),
                  ),
                ),
                ResponsiveRowColumnItem(
                  child: !ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
                      ? getHorizontalSpace(
                          width: size.width * 0.02,
                        )
                      : getVertialSpace(
                          height: size.height * 0.02,
                        ),
                ),
              ],
            ),
          ),
          ResponsiveRowColumnItem(
            child: getVertialSpace(height: size.height * 0.3),
          ),
        ],
      ),
    );
  }
}
