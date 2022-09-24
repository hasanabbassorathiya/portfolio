import 'package:flutter/material.dart';
import 'package:portfolio/Models/Git/repo_model.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../Contants.dart';
import '../../controller/provider.dart';

class MyProject extends StatefulWidget {
  const MyProject({Key? key}) : super(key: key);

  @override
  State<MyProject> createState() => _MyProjectState();
}

class _MyProjectState extends State<MyProject> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    bool isHover = false;
    return ResponsiveWrapper(
      shrinkWrap: true,
      child: ResponsiveRowColumn(
        rowMainAxisAlignment: MainAxisAlignment.center,
        columnCrossAxisAlignment: CrossAxisAlignment.center,
        rowPadding: const EdgeInsets.all(30),
        columnPadding: const EdgeInsets.all(30),
        layout: ResponsiveRowColumnType.COLUMN,
        children: [
          ResponsiveRowColumnItem(
            rowFlex: 1,
            child: Text(
              'My Projects',
              style: getHeadingStyle3(
                context: context,
                colors: Colors.greenAccent,
              ),
            ),
          ),
          ResponsiveRowColumnItem(
            child: getVertialSpace(height: size.height * 0.050),
          ),
          // ResponsiveRowColumnItem(
          //   rowColumn: true,
          //   child: ResponsiveRowColumn(
          //     columnCrossAxisAlignment: CrossAxisAlignment.start,
          //     rowCrossAxisAlignment: CrossAxisAlignment.start,
          //     rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     columnMainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     layout: ResponsiveRowColumnType.ROW,
          //     children: [
          //       ResponsiveRowColumnItem(
          //         rowFlex: 40,
          //         columnFlex: 40,
          //         rowColumn: true,
          //         child: Container(
          //           width: size.width,
          //           height: size.height,
          //           child: ChangeNotifierProvider(
          //             create: (BuildContext context) => ControllerProvider(),
          //             builder: (context, child) {
          //               final provider = context.read<ControllerProvider>();
          //
          //               return FutureBuilder<List<RepoModel>>(
          //                   future: provider.getRepoDetails(),
          //                   builder: (context, snapshot) {
          //                     if (snapshot.data != null && snapshot.hasData) {
          //                       List<RepoModel> model = snapshot.data!;
          //                       return ListView.builder(
          //                           shrinkWrap: true,
          //                           itemCount: model.length,
          //                           primary: false,
          //                           scrollDirection: Axis.horizontal,
          //                           itemBuilder: (context, int index) {
          //                             return Container(
          //                               clipBehavior:
          //                                   Clip.antiAliasWithSaveLayer,
          //                               decoration: BoxDecoration(
          //                                 shape: BoxShape.rectangle,
          //                                 borderRadius:
          //                                     BorderRadius.circular(10.0),
          //                               ),
          //                               margin: const EdgeInsets.all(10),
          //                               child: Column(
          //                                 mainAxisSize: MainAxisSize.max,
          //                                 // alignment: Alignment.bottomCenter,
          //                                 // fit: StackFit.passthrough,
          //                                 children: [
          //                                   Container(
          //                                     margin:
          //                                         const EdgeInsets.symmetric(
          //                                             horizontal: 5.0),
          //                                     decoration: const BoxDecoration(
          //                                         color: Colors.white),
          //                                     child: Image.network(
          //                                         model[index]
          //                                             .owner!
          //                                             .avatarUrl
          //                                             .toString(),
          //                                         fit: BoxFit.cover),
          //                                   ),
          //                                   Container(
          //                                     alignment: Alignment.centerLeft,
          //                                     color: Colors.greenAccent,
          //                                     child: Padding(
          //                                       padding:
          //                                           const EdgeInsets.all(8.0),
          //                                       child: Text(
          //                                         model[index]
          //                                             .name
          //                                             .toString()
          //                                             .toUpperCase(),
          //                                         overflow:
          //                                             TextOverflow.ellipsis,
          //                                         softWrap: true,
          //                                       ),
          //                                     ),
          //                                   ),
          //                                 ],
          //                               ),
          //                             );
          //                             // return ProjectWidget(
          //                             //   imageUrl: model[index]
          //                             //       .owner!
          //                             //       .avatarUrl
          //                             //       .toString(),
          //                             //   Title: model[index].name.toString(),
          //                             // );
          //                           });
          //                     }
          //                     if (snapshot.connectionState !=
          //                         ConnectionState.done) {
          //                       return const Center(
          //                         child: CircularProgressIndicator(),
          //                       );
          //                     } else {
          //                       return Center(
          //                         child: Text(
          //                           'No Project Found',
          //                           style: getHeadingStyle3(context: context),
          //                         ),
          //                       );
          //                     }
          //                   });
          //             },
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),

          ResponsiveRowColumnItem(
            // rowFlex: 40,
            // columnFlex: 40,
            rowColumn: true,

            child: Container(
              width: size.width,
              height: size.height * 0.2,
              child: ChangeNotifierProvider(
                create: (BuildContext context) => ControllerProvider(),
                builder: (context, child) {
                  final provider = context.read<ControllerProvider>();

                  return FutureBuilder<List<RepoModel>>(
                      future: provider.getRepoDetails(),
                      builder: (context, snapshot) {
                        if (snapshot.data != null && snapshot.hasData) {
                          List<RepoModel> model = snapshot.data!;
                          return ListView.builder(
                              shrinkWrap: true,
                              itemCount: model.length,
                              primary: false,
                              physics: BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, int index) {
                                return InkWell(
                                  onTap: () async {
                                    await launchInBrowser(
                                      url: Uri.parse(
                                        model[index].cloneUrl.toString(),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    width: size.width * 0.2,
                                    alignment: Alignment.center,
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    margin: const EdgeInsets.all(10),
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: double.maxFinite,
                                      color: Colors.greenAccent,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          model[index]
                                              .name
                                              .toString()
                                              .toUpperCase(),
                                          overflow: TextOverflow.ellipsis,
                                          softWrap: true,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              });
                        }
                        if (snapshot.connectionState != ConnectionState.done) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          return Center(
                            child: Text(
                              'No project\'s available',
                              style: getHeadingStyle3(context: context),
                            ),
                          );
                        }
                      });
                },
              ),
            ),
          ),
          ResponsiveRowColumnItem(
            child: getVertialSpace(height: size.height * 0.050),
          ),
          ResponsiveRowColumnItem(
            child: getVertialSpace(height: size.height * 0.3),
          ),
        ],
      ),
    );
  }
}
