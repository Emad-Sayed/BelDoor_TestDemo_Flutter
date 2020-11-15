import 'package:flutter/cupertino.dart';

class DepartmentsListModel extends ChangeNotifier{
  List<String> departments = [];
  String selectedDepartment = "Select Department";

  getDepartments(branch){
    departments = ['D1', 'D2', 'D3', 'D4'];
    notifyListeners();
  }
  setSelectedDepartement(_selectedDept){
    selectedDepartment = _selectedDept;
    notifyListeners();
  }
}