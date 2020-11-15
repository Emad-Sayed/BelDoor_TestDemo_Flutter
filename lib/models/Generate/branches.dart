import 'package:flutter/cupertino.dart';

class BranchesListModel extends ChangeNotifier{
  List<String> branches = [];
  String selectedBranch = "Select Branch";
  BranchesListModel(){getBranches();}
  getBranches() async{
    await Future.delayed(Duration(seconds: 2),(){
      branches = ['B1', 'B2', 'B3', 'B4'];
    });
    notifyListeners();
  }
  setSelectedBranch(_selectedBranch){
    selectedBranch = _selectedBranch;
    notifyListeners();
  }
}