
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage>{
  PageController bottomController = PageController(
    initialPage: 0,
    viewportFraction: .2,
  );
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color(),
    );
  }
}
