import 'package:flutter/material.dart';
import 'package:beldoor/pages/popup.dart';

class TicketsFilter extends StatefulWidget {
  @override
  _TicketsFilterState createState() => _TicketsFilterState();
}

class _TicketsFilterState extends State<TicketsFilter> {
  Map<String, bool> data = {
    'foo': false,
    'bar': false,
  };
  setData(selectedData){
    setState(() {
      data=selectedData;
    });
  }
  drawData(){
    List<String> selectedData= data.keys.where((key) => data[key]).toList();
    return (selectedData.length>0)?selectedData.reduce((value, element) => (value + "," + element)):"Select...";
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey[800],
        appBar: AppBar(
          backgroundColor: Colors.blueGrey[600],
          title: Text("Filtration Page"),
          centerTitle: true,
        ),
        body:Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Row(
            children: [
              Expanded(child: Text("Select Branch",style: TextStyle(color: Colors.white70),),flex: 1,),
            Expanded(
              child: RaisedButton(
                child: Text(drawData(),style: TextStyle(backgroundColor:Colors.white70),),
                onPressed: ()=>showDialog(context: context,builder: (BuildContext build){
                  return Center(child: CustomPopUp(values:data,onDataReady:(data)=>setData(data)));}),
              ),flex: 2,
            )
          ],),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: Text("Select Branch",style: TextStyle(color: Colors.white70),),flex: 1,),
                Expanded(
                  child: RaisedButton(
                    child: Text(drawData(),style: TextStyle(backgroundColor:Colors.white70),),
                    onPressed: ()=>showDialog(context: context,builder: (BuildContext build){
                      return Center(child: CustomPopUp(values:data,onDataReady:(data)=>setData(data)));}),
                  ),flex: 2,
                )
              ],),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: Text("Select Branch",style: TextStyle(color: Colors.white70),),flex: 1,),
                Expanded(
                  child: RaisedButton(
                    child: Text(drawData(),style: TextStyle(backgroundColor:Colors.white70),),
                    onPressed: ()=>showDialog(context: context,builder: (BuildContext build){
                      return Center(child: CustomPopUp(values:data,onDataReady:(data)=>setData(data)));}),
                  ),flex: 2,
                )
              ],),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(onPressed: ()=>{},child: Text("Filter"),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.blueGrey)
                ),
              )
            ],
          )
          ],
    ),
        ));
  }
}
