import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'models/data.dart';

class Statistics extends StatefulWidget {
  const Statistics({Key? key}) : super(key: key);

  @override
  State<Statistics> createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  @override
  Widget build(BuildContext context) {
    Data _data = Data(context);
    final mainContainerHeight = MediaQuery.of(context).size.height * 0.9;
    return Scaffold(
      appBar: AppBar(
          //to change the top statusbar color
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.grey[50],
          ),
          elevation: 0.0,
          backgroundColor: Colors.grey[50],
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.black,
                ),
              ),
              Text(
                'Statistics',
                style: Theme.of(context).textTheme.headline3,
              ),
              const IconButton(
                color: Colors.black,
                onPressed: null,
                icon: Icon(
                  Icons.download_sharp,
                  color: Colors.black,
                ),
              )
            ],
          )),
      body: Container(
        height: mainContainerHeight,
        width: MediaQuery.of(context).size.width,
        color: Colors.grey[50],
        child: Column(
          children: [
            Expanded(
              flex: 6,
              child: Container(),
            ),
            Expanded(
              flex: 5,
              child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 5.0,
                  ),
                  child: Column(
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Text(
                                'Top Spending',
                                style: Theme.of(context).textTheme.headline3,
                              ),
                            ),
                            const Icon(Icons.swap_vert),
                          ]),
                      Column(
                        children: _data.listTileData
                            .asMap()
                            .map(
                              (key, listTileMap) => MapEntry(
                                key,
                                Card(
                                  elevation:
                                      listTileMap['isSelected'] ? 15.0 : 0.0,
                                  shadowColor: Colors.grey[50],
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: ListTile(
                                    textColor: Colors.black,
                                    selectedColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    selected: listTileMap['isSelected'],
                                    selectedTileColor: Colors.teal,
                                    tileColor: Colors.grey[100],
                                    leading: CircleAvatar(
                                      backgroundImage:
                                          AssetImage(listTileMap['image']),
                                    ),
                                    title: Text(
                                      listTileMap['title'],
                                      style: listTileMap['isSelected']
                                          ? null
                                          : Theme.of(context)
                                              .textTheme
                                              .headline4,
                                    ),
                                    subtitle: Text(listTileMap['subtitle']),
                                    trailing: Text(
                                      listTileMap['trailingText'],
                                      style: listTileMap['isSelected']
                                          ? const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w700,
                                            )
                                          : Theme.of(context)
                                              .textTheme
                                              .headline2,
                                    ),
                                  ),
                                ),
                              ),
                            )
                            .values
                            .toList(),

                        // )
                      ),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
