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
          ResponsiveRowColumnItem(
            rowColumn: true,
            rowFlex: 1,
            child: ResponsiveRowColumn(
              columnCrossAxisAlignment: CrossAxisAlignment.start,
              rowCrossAxisAlignment: CrossAxisAlignment.start,
              rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
              columnMainAxisAlignment: MainAxisAlignment.spaceBetween,
              layout: ResponsiveRowColumnType.COLUMN,
              children: [
                ResponsiveRowColumnItem(
                  rowColumn: true,
                  child: ChangeNotifierProvider(
                    create: (BuildContext context) => ControllerProvider(),
                    builder: (context, child) {
                      final provider = context.read<ControllerProvider>();

                      return FutureBuilder<List<RepoModel>>(
                          future: provider.getRepoDetails(),
                          builder: (context, snapshot) {
                            if (snapshot.data != null && snapshot.hasData) {
                              List<RepoModel>? model = snapshot.data;
                              return ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: model?.length,
                                  primary: false,
                                  scrollDirection: Axis.vertical,
                                  itemBuilder: (context, int index) {
                                    return Card(
                                      semanticContainer: true,
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      elevation: 5,
                                      margin: EdgeInsets.all(10),
                                      child: Stack(
                                        alignment: Alignment.bottomLeft,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 5.0),
                                            decoration: const BoxDecoration(
                                                color: Colors.white),
                                            child: Container(
                                              child: Image.network(
                                                  model![index]
                                                      .owner!
                                                      .avatarUrl
                                                      .toString(),
                                                  fit: BoxFit.cover),
                                            ),
                                          ),
                                          Container(
                                            alignment: Alignment.centerLeft,
                                            width: double.maxFinite,
                                            color: Colors.greenAccent,
                                            child: Padding(
                                              padding: EdgeInsets.all(8.0),
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
                                        ],
                                      ),
                                    );
                                  });
                            }
                            if (snapshot.connectionState !=
                                ConnectionState.done) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              return Center(
                                child: Text(
                                  'No Project Found',
                                  style: getHeadingStyle3(context: context),
                                ),
                              );
                            }
                          });
                    },
                  ),
                ),
              ],
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
