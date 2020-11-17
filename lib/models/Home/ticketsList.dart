import 'dart:convert';

import 'package:beldoor/models/Home/ticket.dart';
import 'package:beldoor/common/httpManager.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

class TicketsListModel extends ChangeNotifier{
  List<Ticket> ticketsList = [];
  bool isWaitingList = true;
  bool isLoading ;
  TicketsListModel(){getTickets({'statusIds':['1']});}
  getTickets(query) async{
    setLoading(true);
    // Response response = await HttpManager.getRequest('Ticket/VisitorDailyTickets',query);
    // ticketsList= (jsonDecode(response.body)['data'] as List)
    //     .map((e) => Ticket(e['id'], e['currentNumber'], e['branchNameEN'], e['departementNameEN']))
    //     .toList();
    await Future.delayed(Duration(seconds: 2),(){
      ticketsList = [
        new Ticket(1,1,"Branch 1","Departement 1"),
        new Ticket(2,2,"Branch 2","Departement 2"),
        new Ticket(3,3,"Branch 3","Departement 3"),
        new Ticket(4,4,"Branch 4","Departement 4"),
        new Ticket(4,4,"Branch 4","Departement 4"),
      ];
    });
    print(ticketsList);
    setLoading(false);
  }
  setLoading(val) {
    isLoading = val;
    notifyListeners();
  }
  addTicket(ticket){
    ticketsList.add(ticket);
    notifyListeners();
  }
}