import 'package:flutter/material.dart';
import 'package:tdvpnext/utility/style.dart';



class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: StyleProjects().backgroundState,

      body: SingleChildScrollView(

        child: Container(
          // ignore: prefer_const_constructors
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage("assets/images/bg400.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),

      //
    );
  }
}
