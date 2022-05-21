import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../Contants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      child: ResponsiveWrapper(
        shrinkWrap: true,
        child: ResponsiveRowColumn(
          rowMainAxisAlignment: MainAxisAlignment.start,
          columnCrossAxisAlignment: CrossAxisAlignment.start,
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
                'Hi! I am ,',
                style: getHeadingStyle3(context: context),
              ),
            ),
            ResponsiveRowColumnItem(
              rowFlex: 1,
              child: Text(
                kYourName,
                style: Theme.of(context).textTheme.headline2?.copyWith(
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
              rowFlex: 1,
              rowColumn: true,
              rowFit: FlexFit.loose,
              child: Row(
                children: [
                  Text(
                    'I Build Application\'s using ',
                    style: getHeadingStyle3(
                      DefaultFontSize: 20,
                      MobileFontSize: 20,
                      context: context,
                    ),
                  ),
                  AnimatedTextKit(
                    isRepeatingAnimation: true,
                    repeatForever: true,
                    animatedTexts: YourWork.map(
                      (e) => RotateAnimatedText(e,
                          alignment: Alignment.center,
                          textStyle: getHeadingStyle3(
                            context: context,
                            MobileFontSize: 18,
                            DefaultFontSize: 18,
                            colors: Colors.blue,
                          )),
                    ).toList(),
                  ),
                ],
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
                      onPressed: () {},
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
                    rowColumn: true,
                    child: Container(
                      width: size.width * 0.5,
                      child: Text(
                        kTagLine,
                        softWrap: true,
                        textAlign: TextAlign.end,
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
                  )
                ],
              ),
            ),
            // ResponsiveRowColumnItem(
            //   child: getVertialSpace(height: size.height * 0.1),
            // ),
          ],
        ),
      ),
    );
  }
}
