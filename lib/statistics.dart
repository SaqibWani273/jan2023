import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:bubble/bubble.dart';
import 'package:flutter/services.dart';
import 'custom_painter.dart';
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
            statusBarColor: Colors.white,
            //  statusBarIconBrightness: Brightness.dark,
          ),
          elevation: 0.0,
          backgroundColor: Colors.white,
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
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              flex: 6,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: _data.spendingTime
                        .map(
                          (spendTime) => TextButton(
                            onPressed: null,
                            style: _data.currentSpendingTime == spendTime
                                ? TextButton.styleFrom(
                                    backgroundColor:
                                        Theme.of(context).primaryColorDark,
                                    fixedSize: const Size(100, 40),
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0))))
                                : null,
                            child: Text(
                              spendTime,
                              style: _data.currentSpendingTime == spendTime
                                  ? const TextStyle(
                                      color: Colors.white,
                                    )
                                  : null,
                            ),
                          ),
                        )
                        .toList(),
                  ),
                  //dropdown container
                  Container(
                    height: 40.0,
                    width: 150.0,
                    margin: const EdgeInsets.only(
                      left: 250.0,
                      top: 30.0,
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(
                          color: Colors.black,
                          width: 1.0,
                        )),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        //to increase the height
                        isExpanded: true,
                        icon: const Icon(
                          Icons.expand_more,
                          color: Colors.black,
                        ),
                        value: 'Expense',
                        items: [
                          'Expense',
                          'Expense1',
                          'Expense2',
                          'Expense3',
                        ]
                            .map((String value) => DropdownMenuItem(
                                value: value,
                                child: Text(
                                  value,
                                  style: const TextStyle(
                                    color: Colors.black54,
                                  ),
                                )))
                            .toList(),
                        onChanged: (value) {},
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Stack(
                        children: [
                          CustomPaint(
                            painter: MyCustomPainter(),
                            child: Container(
                              height: 200,
                              width: MediaQuery.of(context).size.width,
                              // color: Colors.blueAccent,
                            ),
                          ),
                          CustomPaint(
                            painter: MyCustomPainter1(),
                            child: Container(
                              height: 200,
                              width: MediaQuery.of(context).size.width,
                            ),
                          ),
                          Positioned(
                              // coordinates of point on curve
                              height: 200 * 0.4808500 - 40,
                              width: MediaQuery.of(context).size.width *
                                      0.3662200 +
                                  180,
                              child: Stack(
                                alignment: Alignment.bottomCenter,
                                children: [
                                  Container(
                                    width: 100,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.green.withOpacity(0.07),
                                      borderRadius: BorderRadius.circular(10.0),
                                      border: Border.all(
                                        color: Colors.teal,
                                        width: 0.5,
                                      ),
                                    ),
                                    child: const Center(
                                        child: Text(
                                      '\$1,230',
                                      style: TextStyle(
                                          color: Colors.teal, fontSize: 20),
                                    )),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 47),
                                    child: const Icon(
                                      Icons.keyboard_arrow_down_outlined,
                                      size: 30,
                                      color: Colors.teal,
                                    ),
                                  ),
                                ],
                              ))
                        ],
                      ),

                      //months container
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: _data.months
                                  .map((month) => Row(
                                        children: [
                                          Text(
                                            month,
                                            style: TextStyle(fontSize: 20.0),
                                          ),
                                          SizedBox(
                                            width: 41,
                                          )
                                        ],
                                      ))
                                  .toList()),
                        ),
                      )
                    ],
                  ),
                ],
              ),
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
                                    selectedTileColor:
                                        Theme.of(context).primaryColorDark,
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
