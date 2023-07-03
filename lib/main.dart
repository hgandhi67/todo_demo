import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_demo/screens/provider/DataProvider.dart';
import 'package:todo_demo/screens/view/addscreen.dart';
import 'package:todo_demo/screens/view/homescreen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context)=> DataProvider(),
      child: MaterialApp(
        theme: ThemeData(useMaterial3: true),
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => HomeScreen(),
          'add': (context) => AddScreen(),
        },
      ),
    ),
  );
}
