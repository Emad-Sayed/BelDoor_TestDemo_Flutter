import 'package:flutter/material.dart';

class Generate extends StatefulWidget {
  @override
  _GenerateState createState() => _GenerateState();
}

class _GenerateState extends State<Generate> {
  String selectedBranch = "Select Branch";
  String selectedDepartement = "Select Departement";
  List<String> branches = ['B1', 'B2', 'B3', 'B4'];
  List<String> departements = [];

  getDepartements(String branchName) {
    setState(() {
      selectedBranch = branchName;
      departements = ['D1', 'D2', 'D3', 'D4'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[800],
      appBar: AppBar(
        title: Text("Generate Ticket"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey[600],
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(width: 30),
              DropdownButton(
                icon: Icon(Icons.arrow_circle_down,color: Colors.white54,),
                style: TextStyle(color: Colors.deepPurple),
                underline: Container(
                  height: 2,
                  color: Colors.deepPurpleAccent,
                ),
                hint: Text(
                  selectedBranch,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onChanged: (String val) => getDepartements(val),
                items: branches.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value
                    ),
                  );
                }).toList(),
              ),
              SizedBox(width: 15),
              DropdownButton(
                icon: Icon(Icons.arrow_circle_down,color: Colors.white54,),
                style: TextStyle(color: Colors.deepPurple),
                underline: Container(
                  height: 2,
                  color: Colors.deepPurpleAccent,
                ),
                hint: Text(
                  selectedDepartement,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onChanged: (String val) {
                  setState(() {
                    selectedDepartement = val;
                  });
                },
                items:
                    departements.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
                  SizedBox(width: 30),
                ]),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton.icon(
                    onPressed: () {},
                    color:Colors.blueGrey[300],
                    icon: Icon(Icons.add),
                    label: Text("Generate"))
              ],
            ),
          ]),
    );
  }
}
