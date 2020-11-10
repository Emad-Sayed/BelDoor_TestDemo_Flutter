import 'package:beldoor/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:beldoor/models/ticket.dart';

class TicketCard extends StatelessWidget {
  final Ticket ticket;
  TicketCard({this.ticket});
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
             Stack(children:<Widget>[
               Container(
                 width: 100,
                 height: 100,
                 child:Image(image: AssetImage('assets/images/ticketImage.jpeg'),height: 100, width: 90,)
               ),
               Positioned(
                 top: 40,
                 left: AppLocalizations.isEnglish ? 45 : 5,
                 width: 50,
                 height: 50,
                 child: Container(
                    child: Text("1",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                 ),
               ),

               // Center(,
          ],
        ),
    ]));
  }
}
