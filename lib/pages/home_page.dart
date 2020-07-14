import 'package:flutter/material.dart';
import 'package:roverpyapp/commons/collapsing_navigation_drawer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text('RoverPy', style: Theme.of(context).textTheme.headline,),
      ),
      body: Center(child: Text('HOME PAGE', style: Theme.of(context).textTheme.title),),
      drawer: CollapsingNavDrawer(),
    );
  }
}
