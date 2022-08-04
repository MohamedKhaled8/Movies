import 'package:flutter/material.dart';
import 'package:move/pages/details.dart';
import 'package:move/pages/home.dart';
import 'package:move/provider/home_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeProvider(),
        ),
      ],
      child:  MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        home: Home(),
        //
        //Detailes(id: 'ddd', overView: ';;;;', poster: 'ffff', title: 'fff', ),
      ),
    );
  }
}
