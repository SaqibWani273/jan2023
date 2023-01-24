import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'statistics.dart';
import 'models/data.dart';

void main() {
  runApp(
    MaterialApp(
      home: ChangeNotifierProvider(
        create: (context) => Data(context),
        child: Consumer<Data>(
          builder: (context, data, child) => MyApp(data),
        ),
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  final Data _data;
  const MyApp(this._data, {Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  late final TabController _tabController = TabController(
    length: 4,
    vsync: this,
    initialIndex: 1,
  );
  void changeIndex(int index) {
    setState(() {
      _tabController.index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: TabBarView(
            controller: _tabController,
            children: [
              Container(),
              const Statistics(),
              Container(),
              Container(),
            ],
          ),
          bottomNavigationBar: Container(
            color: Colors.white,
            height: 90.0,
            child: TabBar(
              controller: _tabController,
              labelColor: Colors.black,
              indicatorColor: Colors.transparent,
              tabs: widget._data.bottomIcons
                  .asMap()
                  .map(
                    (int index, Map value) => MapEntry(
                      index,
                      IconButton(
                        onPressed: () {
                          changeIndex(index);
                        },
                        icon: Icon(
                          _tabController.index == index
                              ? value['icon_filled']
                              : value['icon_outlined'],
                          size: 40,
                          color: _tabController.index == index
                              ? Colors.teal[900]
                              : Colors.black,
                        ),
                      ),
                    ),
                  )
                  .values
                  .toList(),
            ),
          )),
    );
  }
}
