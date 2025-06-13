import 'package:flutter/material.dart';

class NavigationDrawerExample extends StatefulWidget {
  const NavigationDrawerExample({super.key});

  @override
  State<NavigationDrawerExample> createState() => _NavigationDrawerExampleState();
}

class _NavigationDrawerExampleState extends State<NavigationDrawerExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        title: Text('APP BAR WITH DRAWER'),
      ),
      drawer:NavigationDrawer(
       // padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color:Colors.blue
            ),
            child: Align(alignment: Alignment.bottomLeft,
          child: Text('Drawer Header'),
          )),
          NavigationDrawerDestination(
            icon: Icon(Icons.home),
            label: Text('Home'),
            //onTap: (){},
          ),
          NavigationDrawerDestination(
            icon: Icon(Icons.search),
            label: Text('Search'),
           // onTap: (){},
          ),
          NavigationDrawerDestination(
            icon: Icon(Icons.sailing),
            label: Text('Sailing'),
          //  onTap: (){},
          ),
        ],
      ),
    );
  }
}
