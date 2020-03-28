import 'package:associates/associateData.dart';
import 'package:associates/model/associate.dart';
import 'package:associates/widgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AssociateEditPage extends StatefulWidget {
  final Associate currentAssociate;

  const AssociateEditPage({@required this.currentAssociate});

  @override
  _AssociateEditPageState createState() => _AssociateEditPageState();
}

class _AssociateEditPageState extends State<AssociateEditPage> {
  String newName;
  int newPhone;
  bool newSenior;
  int newAge;
  DateTime newJoinDate;

  void _editAssociate(context) {
    if (newName == null) {
      toastWidget("Give entry a name");
      return;
    }
    if (newName.length < 2) {
      toastWidget("Get a longer name");
      return;
    }
    Provider.of<AssociateData>(context, listen: false).editAssociate(
        associate: Associate(
          name: newName,
          age: newAge ?? 0,
          phone: newPhone ?? 0,
          isSenior: newSenior ?? false,
          joinDate: newJoinDate ?? DateTime.now(),
        ),
        associateKey: widget.currentAssociate.key);

    Navigator.pop(context);
  }

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  @override
  void initState() {
    _nameController.text = widget.currentAssociate.name;
    newName = widget.currentAssociate.name;

    _phoneController.text = widget.currentAssociate.phone.toString();
    newPhone = widget.currentAssociate.phone;

    _ageController.text = widget.currentAssociate.age.toString();
    newAge = widget.currentAssociate.age;

    newSenior = widget.currentAssociate.isSenior;

    newJoinDate = widget.currentAssociate.joinDate;

    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreenAccent,
        elevation: 16.0,
        title: Text(
          "Edit ${widget.currentAssociate.name}",
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            iconSize: 24.0,
            color: Colors.blue,
            tooltip: "Save",
            onPressed: () {
              _editAssociate(context);
            },
          )
        ],
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              TextField(
                autofocus: true,
                controller: _nameController,
                decoration: InputDecoration(
                  hintText: "Name",
                ),
                onChanged: (v) {
                  setState(
                    () {
                      newName = v;
                    },
                  );
                },
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                autofocus: true,
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: "Phone",
                ),
                onChanged: (v) {
                  setState(
                    () {
                      newPhone = int.parse(v);
                    },
                  );
                },
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                autofocus: true,
                controller: _ageController,
                keyboardType: TextInputType.numberWithOptions(decimal: false),
                decoration: InputDecoration(
                  hintText: "Age",
                ),
                onChanged: (v) {
                  setState(
                    () {
                      newAge = int.parse(v);
                    },
                  );
                },
              ),
              Row(
                children: <Widget>[
                  Text(
                    "Is Senior",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                  ),
                  Switch(
                    activeTrackColor: Colors.black,
                    activeColor: Colors.blue,
                    onChanged: (v) {
                      setState(() {
                        newSenior = v;
                      });
                    },
                    value: newSenior ?? false,
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Text(
                    "Join Date",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                  ),
                  IconButton(
                    icon: Icon(Icons.calendar_today),
                    tooltip: "Tap to open the date picker",
                    onPressed: () async {
                      final DateTime d = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2016),
                        lastDate: DateTime(2100),
                      );
                      if (d != null)
                        setState(
                          () {
                            newJoinDate = d;
                          },
                        );
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
