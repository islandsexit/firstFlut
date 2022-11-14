import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{

  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage>{
  Widget build(BuildContext context){

    var counter = 0;
    return Scaffold(
      appBar: AppBar(title: Text("Hello")),
      body: Center(
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 900),
        reverseDuration: Duration(milliseconds: 0),
        child: Text(
          "$counter",
          key: ValueKey<int>(counter),
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline3,
        ),
      )
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.animation),
        onPressed: (){
          setState((){
            counter++;
          });
        },
      ),

    );
  }
}