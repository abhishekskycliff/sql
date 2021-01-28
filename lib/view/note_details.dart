import 'package:flutter/material.dart';

class note_details extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return note_details_state();
  }

}

class note_details_state extends State<note_details>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Sql Database App"),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              child: Center(
                child: Row(
                  children: [
                    RaisedButton(
                      onPressed: () {

                      },
                      child: Text("Submit"),
                    ),
                    RaisedButton(
                      onPressed: (){

                      },
                      child: Text("cancle"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}