import 'package:flutter/material.dart';

class Statistics extends StatelessWidget {
  const Statistics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
    );
  }
}
