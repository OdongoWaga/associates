import 'package:associates/widgets/associateList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../associateData.dart';

class AssociateListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<AssociateData>(context, listen: false).getAssociates();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreenAccent,
        elevation: 16.0,
        title: Text(
          'Associates',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Container(
                child: AssociateList(),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightGreenAccent,
        tooltip: "Add",
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, '/AddAssociatePage');
        },
      ),
    );
  }
}
