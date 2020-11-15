import 'file:///E:/Emad/Flutter/beldoor/lib/models/Home/ticket.dart';
import 'package:flutter/cupertino.dart';

class TicketsListModel extends ChangeNotifier{
  List<Ticket> ticketsList = [];
  bool isWaitingList = true;
  TicketsListModel(){getTickets();}
  getTickets() async{
    await Future.delayed(Duration(seconds: 2),(){
      ticketsList = [
        new Ticket(1,1,"Branch 1","Departement 1"),
        new Ticket(2,2,"Branch 2","Departement 2"),
        new Ticket(3,3,"Branch 3","Departement 3"),
        new Ticket(4,4,"Branch 4","Departement 4"),
        new Ticket(4,4,"Branch 4","Departement 4"),
      ];
    });
    notifyListeners();
  }
  changeListType(){
    isWaitingList=!isWaitingList;
    notifyListeners();
  }
  addTicket(ticket){
    ticketsList.add(ticket);
    notifyListeners();
  }
}