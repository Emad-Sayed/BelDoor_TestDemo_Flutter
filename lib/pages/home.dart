import 'package:beldoor/app_localization.dart';
import 'package:beldoor/models/Home/ticketsList.dart';
import 'package:flutter/material.dart';
import 'package:beldoor/pages/ticketCard.dart';
import 'package:beldoor/pages/userSetting.dart';
import 'package:provider/provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Home extends StatelessWidget {
  bool isWaitingActive = true;
  TicketsListModel ticketsModel;
  @override
  Widget build(BuildContext context) {
    ticketsModel = Provider.of<TicketsListModel>(context);
    return Scaffold(
      backgroundColor: Colors.blueGrey[800],
      appBar: AppBar(
        title: Text("Home Page"),
        backgroundColor: Colors.blueGrey[600],
        centerTitle: true,
      ),
      drawer:UserSetting(),
      body:(!ticketsModel.isLoading)?Column(children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:[
                Expanded(child:RaisedButton(child: Text(AppLocalizations.of(context).translate('waitingButton')),
                    color: ticketsModel.isWaitingList?Colors.white : Colors.grey[700] ,
                    onPressed: ()=>this.ticketsModel.changeListType(1)
                )),
                Expanded(child:RaisedButton(child: Text(AppLocalizations.of(context).translate('missedButton')),
                    color: !ticketsModel.isWaitingList?Colors.white : Colors.grey[700] ,
                     onPressed: ()=>this.ticketsModel.changeListType(2)
                )),
              ])
        ),
        Expanded(child:ListView(children : ticketsModel.ticketsList.map((ticket) => TicketCard(ticket: ticket)).toList())),
      ]):Center(
          child:SpinKitDoubleBounce(
          color: Colors.grey,
          size: 50.0,
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: ()=>Navigator.pushNamed(context,'/generate'),
        backgroundColor: Colors.grey[700],
        icon: Icon(Icons.add),
        label: Text(AppLocalizations.of(context).translate('askTicket')),
      ),
    );
  }
}
