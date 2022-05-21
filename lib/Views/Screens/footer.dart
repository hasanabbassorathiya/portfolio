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
        columnVerticalDirection: VerticalDirection.down,
        children: [
          ResponsiveRowColumnItem(
            child: getVertialSpace(height: size.height * 0.1),
          ),
          ResponsiveRowColumnItem(
            rowFlex: 1,
            child: Text(
              'What\'s Next?',
              style: getHeadingStyle3(context: context),
            ),
          ),
          ResponsiveRowColumnItem(
            child: getVertialSpace(height: size.height * 0.1),
          ),
          ResponsiveRowColumnItem(
            rowFlex: 1,
            child: Text(
              kAboutMeContent,
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
              rowCrossAxisAlignment: CrossAxisAlignment.end,
              layout: ResponsiveRowColumnType.ROW,
              children: [
                ResponsiveRowColumnItem(
                  child: FlatButton(
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                      side: const BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    child: Text(
                      kGetInTouch,
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
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
                )
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
