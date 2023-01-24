import 'package:flutter/material.dart';
import 'package:internship_assignemnet_jan2023/main.dart';
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
    final deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          title: Container(
            // color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'Statistics',
                  style: TextStyle(color: Colors.black),
                ),
                IconButton(
                  color: Colors.black,
                  onPressed: null,
                  icon: Icon(
                    Icons.download_sharp,
                    color: Colors.black,
                  ),
                )
              ],
            ),
          )),
      body: Container(
        height: mainContainerHeight,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Container(
            child: Column(
          children: [
            Container(
              height: mainContainerHeight * 0.5,
            ),
            Container(
                //    height: mainContainerHeight * 0.4,
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Column(
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Top Spending'),
                          Icon(Icons.swap_vert),
                        ]),
                    Container(
                      // height: mainContainerHeight * 0.3,
                      child: SingleChildScrollView(
                        child: Column(
                          children: _data.listTileData
                              .map(
                                (listTileMap) => Container(
                                  width: deviceWidth,
                                  child: Card(
                                    child: ListTile(
                                      title: Text(listTileMap['title']),
                                      subtitle: Text(listTileMap['subtitle']),
                                      trailing:
                                          Text(listTileMap['trailingText']),
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ),
                  ],
                ))
          ],
        )),
      ),
    );
  }
}
