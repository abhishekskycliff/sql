import 'package:flutter/material.dart';
import 'package:sql_database_app/db_helper/note_helper.dart';

import 'note_details.dart';

class note_list extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return note_list_state();
  }

}

class note_list_state extends State<note_list> {

  final dbHelper = DatabaseHelper.instance;
  final name = TextEditingController();
  final age =TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Sql Database App"),
      ),
      body: ListView(
          children: [
            Container(
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Enter the Name",
                  border: OutlineInputBorder(),
                ),
                controller: name,
              ),
              margin: const EdgeInsets.all(20),
            ),
            Container(
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Enter the Age",
                  border: OutlineInputBorder(),
                ),
                controller: age,
              ),
              margin: const EdgeInsets.all(20),
            ),
            Container(
              child: Center(
                child: Column(
                  children: [
                    RaisedButton(
                      child: Text("insert"),
                      onPressed: () {
                        _insert();
                      }
                    ),
                    RaisedButton(
                      child: Text("query"),
                      onPressed: () {_query();}
                    ),
                    RaisedButton(
                      child: Text("Update"),
                      onPressed:() {_update();}
                    ),
                    RaisedButton(
                      child: Text("delete"),
                      onPressed: () {_delete();}
                    ),
                  ],
                ),
              ),
              margin: const EdgeInsets.all(100),
            ),
          ],
      ),
    );
  }

  void _insert() async {

    Map<String, dynamic> row = {
      DatabaseHelper.columnName: name.text,
      DatabaseHelper.columnAge: age.text,
    };
    final id = await dbHelper.insert(row);
    print('inserted row id:$id');

  }

  void _query() async {
    final allRows = await dbHelper.queryAllRows();
    print("query all rows:");
    allRows.forEach((row) => print(row));
  }

  Future<void> _update() async {
    Map<String, dynamic> row = {
      DatabaseHelper.columnId: 3,
      DatabaseHelper.columnName: 'raj',
      DatabaseHelper.columnAge: 32
    };
    final rowsAffected = await dbHelper.update(row);
    print("updated $rowsAffected row(s)");
  }

  void _delete() async{
    final id = await dbHelper.queryRowCount();
    final rowsDeleted = await dbHelper.delete(id);
    print('deleted $rowsDeleted row(s):row $id');
  }


}