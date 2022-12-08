import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:provider_example/bread_crub.dart';

class BreadCrumbWidget extends StatelessWidget {
  final UnmodifiableListView<BreadCrumb> breadCrumb;
  const BreadCrumbWidget({Key? key, required this.breadCrumb})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: breadCrumb.map((
        breadcrumb,
      ) {
        return InkWell(
          onTap: () {},
          child: Text(
            breadcrumb.title,
            style: TextStyle(
                color: breadcrumb.isActive ? Colors.blue : Colors.black),
          ),
        );
      }).toList(),
    );
  }
}
