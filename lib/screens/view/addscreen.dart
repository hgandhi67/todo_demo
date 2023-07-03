import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_demo/screens/provider/DataProvider.dart';
import 'package:todo_demo/utils/DbHelper.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  AddScreenState createState() => AddScreenState();
}

class AddScreenState extends State<AddScreen> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    dataProvidertrue!.dataList = await DbHelper.dbHelper.readData();
  }

  DataProvider? dataProvidertrue;
  DataProvider? dataProviderfalse;

  @override
  Widget build(BuildContext context) {
    dataProvidertrue = Provider.of(context, listen: true);
    dataProviderfalse = Provider.of(context, listen: false);
    TextEditingController txtdate = TextEditingController();
    TextEditingController txtcategory = TextEditingController();
    // GlobalKey<FormState> key = GlobalKey<FormState>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Add Screen",
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                validator: (value) {
                  if (txtdate != value) {
                    return "Please Select Date";
                  }
                },
                controller: txtdate,
                decoration: InputDecoration(
                  label: Text("Date and Time"),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                validator: (value) {
                  if (txtdate != value) {
                    return "Please Add Category";
                  }
                },
                controller: txtcategory,
                decoration: InputDecoration(
                  label: Text("Category"),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  DbHelper.dbHelper.insertData(date: txtdate.text, cat: txtdate.text);
                  getData();
                  Navigator.pop(context);
                },
                child: Text("Add"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
