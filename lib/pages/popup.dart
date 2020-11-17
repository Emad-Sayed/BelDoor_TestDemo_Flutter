import 'package:flutter/material.dart';

class CustomPopUp extends StatefulWidget {
  final Map<String, bool> values;
  final Function(Map<String, bool> data) onDataReady;
  CustomPopUp({this.values,this.onDataReady});
  @override
  _CustomPopUp createState() => _CustomPopUp();
}

class _CustomPopUp extends State<CustomPopUp> {

  getSelectedData(){
    widget.onDataReady(widget.values);
    Navigator.of(context).pop();
  }
  @override
  Widget build(BuildContext context) {
          return Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(color: Colors.grey)
            ),
            // elevation: 0,
            // color: Colors.transparent,
            child: Container(
              width: 300,
              height: 400,
              child: Column(
                children: [
              Expanded(
                child: ListView(children : widget.values.keys.map((val) => CheckboxListTile(
                  title: Text(val,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                  value: widget.values[val],
                  controlAffinity: ListTileControlAffinity.platform,
                  onChanged: (asd)=>setState((){widget.values[val]=!widget.values[val];})//set the state,
                ),).toList()),flex: 2,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(11.0),
                  child: Row(
                    children: [
                      //ListView With Text and Check Box
                    Expanded(child: RaisedButton(child: Text("Save"),color: Colors.white60,onPressed: ()=>getSelectedData()),flex: 3,),
                    Expanded(child: SizedBox(),flex: 1,),
                    Expanded(child: RaisedButton(child: Text("Cancel"),color: Colors.white60,onPressed: ()=>Navigator.of(context).pop()),flex: 3,)
                  ],),
                ), flex: 2,
              ),
              ],
              ),
            ),
          );
  }
}
