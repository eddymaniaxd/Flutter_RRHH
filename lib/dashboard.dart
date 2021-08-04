import 'package:flutter/material.dart';

import 'Drawer/widget_drawer.dart';

class Dashboard extends StatefulWidget {
  static const String route = 'home';

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('NICE TO SEE YOU AGAIN'),
        ),
        //backgroundColor: Colors.tealAccent,
        drawer:MenuLateral() ,  
        body: Container(
          child: Stack(
           children: <Widget>[
             Column(
               children: <Widget>[
                 Center(
                    child: Image.asset('assets/images/dashboard.png',
                    width: MediaQuery.of(context).size.width/2,
                    height: 500,
                    ),
                 ),
                // ignore: deprecated_member_use
                RaisedButton(
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(13.0),
                  color: Colors.redAccent,
                  child: Icon(Icons.chevron_right,
                  color: Colors.white10,
                  ),
                  onPressed: (){

                  },
                ),
               ],
             )
           ],
          ),
        ),
      ),
    );
  }
}

