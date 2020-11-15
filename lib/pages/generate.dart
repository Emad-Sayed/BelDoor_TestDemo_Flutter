import 'package:beldoor/models/Generate/branches.dart';
import 'package:beldoor/models/Generate/departements.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Generate extends StatelessWidget {
  BranchesListModel branches;
  DepartmentsListModel departments;

getDepartments(branch){
    branches.setSelectedBranch(branch);
    departments.getDepartments(branch);
  }
  @override
  Widget build(BuildContext context) {
    branches = Provider.of<BranchesListModel>(context);
    departments = Provider.of<DepartmentsListModel>(context);
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
              children: <Widget>[
              Expanded(child: SizedBox(),flex: 1,),
              Expanded(
                child: DropdownButton(
                  icon: Icon(Icons.arrow_circle_down,color: Colors.white54,),
                  style: TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  hint: Text(
                    branches.selectedBranch,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onChanged: (String val) => getDepartments(val),
                  items: branches.branches.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value
                      ),
                    );
                  }).toList(),
                ),flex: 2,
              ),
              Expanded(child: SizedBox(),flex: 1,),
              ]),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(child: SizedBox(),flex:1),
                Expanded(child: DropdownButton(
                  icon: Icon(Icons.arrow_circle_down,color: Colors.white54,),
                  style: TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  hint: Text(
                    departments.selectedDepartment,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onChanged: (String val) => departments.setSelectedDepartement(val),
                  items:
                  departments.departments.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),flex: 2,),
                Expanded(child: SizedBox(),flex:1),
              ],
            ),
            SizedBox(height: 20),
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
