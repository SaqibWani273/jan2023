import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class Data extends ChangeNotifier {
  BuildContext context;
  Data(this.context);

  List<Map<String, dynamic>> bottomIcons = [
    {
      'icon_outlined': Icons.home_outlined,
      'icon_filled': Icons.home_filled,
    },
    {
      'icon_outlined': Icons.bar_chart_outlined,
      'icon_filled': Icons.bar_chart_sharp,
    },
    {
      'icon_outlined': Icons.save_as_outlined,
      'icon_filled': Icons.save_as_sharp,
    },
    {
      'icon_outlined': Icons.account_box_outlined,
      'icon_filled': Icons.account_box_rounded,
    }
  ];
}
