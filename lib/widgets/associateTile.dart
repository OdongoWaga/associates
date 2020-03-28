import 'package:associates/associateData.dart';
import 'package:associates/model/associate.dart';
import 'package:associates/pages/associateView.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AssociateTile extends StatelessWidget {
  final int tileIndex;

  const AssociateTile({Key key, this.tileIndex});

  @override
  Widget build(BuildContext context) {
    return Consumer<AssociateData>(
      builder: (context, associateData, child) {
        Associate currentAssociate = associateData.getAssociate(tileIndex);

        return (Container(
          decoration: BoxDecoration(
            color: tileIndex % 2 == 0 ? Colors.grey : Colors.white,
          ),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.lightGreenAccent,
              child: Text(
                currentAssociate.name.substring(0, 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            title: Text(
              currentAssociate?.name ?? "",
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              currentAssociate?.phone.toString() ?? "",
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Provider.of<AssociateData>(context, listen: false)
                  .setActiveAssociate(currentAssociate.key);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return AssociateView();
                  },
                ),
              );
            },
          ),
        ));
      },
    );
  }
}
