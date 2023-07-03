import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_demo/utils/DbHelper.dart';

import '../provider/DataProvider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Home Screen"),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
              ),
            ),
          ],
        ),
        body: ListView.builder(
          itemCount: dataProvidertrue!.dataList.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text("${dataProvidertrue!.dataList[index]['date']}"),
              subtitle: Text("${dataProvidertrue!.dataList[index]['category']}"),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.pushNamed(context, 'add');
          },
        ),
      ),
    );
  }
}
