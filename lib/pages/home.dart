import 'package:beldoor/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:beldoor/models/ticket.dart';
import 'package:beldoor/pages/ticketCard.dart';
import 'package:beldoor/pages/userSetting.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isWaitingActive = true;
  List<Ticket> tickets = [];
  getTickets(){
         tickets=[
        new Ticket(1,1,"Branch 1","Departement 1"),
        new Ticket(2,2,"Branch 2","Departement 2"),
        new Ticket(3,3,"Branch 3","Departement 3"),
        new Ticket(4,4,"Branch 4","Departement 4"),
        new Ticket(4,4,"Branch 4","Departement 4"),
      ];
  }
  @override
  void initState() {
    getTickets();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        backgroundColor: Colors.grey,
        centerTitle: true,
      ),
      drawer:UserSetting(),
      body:Column(children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:[
                Expanded(child:RaisedButton(child: Text(AppLocalizations.of(context).translate('waitingButton')),
                    color: isWaitingActive?Colors.blue : Colors.white,
                    onPressed: ()=>setState(()=>isWaitingActive = true))),
                Expanded(child:RaisedButton(child: Text(AppLocalizations.of(context).translate('missedButton')),
                    color: !isWaitingActive?Colors.blue : Colors.white,
                    onPressed: ()=>setState(()=>isWaitingActive = false))),
              ])
        ),
        Expanded(child:ListView(children : tickets.map((ticket) => TicketCard(ticket: ticket)).toList())),
      ]),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: ()=>Navigator.pushNamed(context,'/generate'),
        icon: Icon(Icons.add),
        label: Text("Generate Ticket" , style: TextStyle(),),
      ),
    );
  }
}
