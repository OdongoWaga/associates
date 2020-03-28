import 'package:associates/associateData.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'associateTile.dart';

class AssociateList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return AssociateTile(
          tileIndex: index,
        );
      },
      itemCount: Provider.of<AssociateData>(context).associateCount,
      padding: EdgeInsets.fromLTRB(8.0, 6.0, 8.0, 4.0),
    );
  }
}
