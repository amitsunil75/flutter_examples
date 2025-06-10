import 'package:flutter/material.dart';

class BottomNavigationBarExample2 extends StatefulWidget {
  const BottomNavigationBarExample2({super.key});

  @override
  State<BottomNavigationBarExample2> createState() =>
      _BottomNavigationBarExample2State();
}

class _BottomNavigationBarExample2State
    extends State<BottomNavigationBarExample2> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [
        // ----------- Home Page -----------
        Card(
          shadowColor: Colors.transparent,
          margin: const EdgeInsets.all(8.0),
          child: const SizedBox.expand(
            child: Center(
              child: Text(
                'Home Page',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
        ),

        // ----------- Notifications Page -----------
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: const [
              Card(
                child: ListTile(
                  leading: Icon(Icons.notifications_sharp),
                  title: Text('Notification 1'),
                  subtitle: Text('This is a notification'),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.notifications_sharp),
                  title: Text('Notification 2'),
                  subtitle: Text('This is another notification'),
                ),
              ),
            ],
          ),
        ),

        // ----------- Messages Page -----------
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: 2,
                  reverse: true,
                  itemBuilder: (context, int index) {
                    if (index == 0) {
                      return Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          margin: const EdgeInsets.all(8.0),
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: Colors.purpleAccent,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: const Text('Hello'),
                        ),
                      );
                    }
                    return Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        margin: const EdgeInsets.all(8.0),
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Colors.greenAccent,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: const Text('Hi !!'),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ][currentPageIndex],

      // ----------- Bottom Navigation Bar -----------
      bottomNavigationBar: NavigationBar(
        indicatorColor: Colors.blueAccent,
        selectedIndex: currentPageIndex,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.notifications_sharp),
            label: 'Notifications',
          ),
          NavigationDestination(
            icon: Badge(
              label: Text('2'),
              child: Icon(Icons.message_sharp),
            ),
            label: 'Messages',
          ),
        ],
      ),
    );
  }
}
