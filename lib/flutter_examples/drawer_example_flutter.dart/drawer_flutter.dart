import 'package:flutter/material.dart';

class DrawerFlutterExample extends StatefulWidget {
  const DrawerFlutterExample({super.key});

  @override
  State<DrawerFlutterExample> createState() => _DrawerFlutterExampleState();
}

class _DrawerFlutterExampleState extends State<DrawerFlutterExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('APP BAR WITH DRAWER'),
      ),
      drawer: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color:Colors.blue
            ),
            child: Align(alignment: Alignment.bottomLeft,
          child: Text('Drawer Header'),
          )),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: (){},
          ),
          ListTile(
            leading: Icon(Icons.search),
            title: Text('Search'),
            onTap: (){},
          ),
          ListTile(
            leading: Icon(Icons.sailing),
            title: Text('Sailing'),
            onTap: (){},
          ),
        ],
      ),
    );
  }
}
