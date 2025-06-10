import 'package:flutter/material.dart';

class BottomNavigationBarExample3 extends StatefulWidget {
  const BottomNavigationBarExample3({super.key});

  @override
  State<BottomNavigationBarExample3> createState() =>
      _BottomNavigationBarExample3State();
}

class _BottomNavigationBarExample3State
    extends State<BottomNavigationBarExample3> {
  int selectedAIndex = 0;
  final ScrollController _scrollController = ScrollController();
  listViewBody() {
    return ListView.separated(
      controller: _scrollController,
      itemBuilder: (context, int index) {
        return Center(child: Text('ITEM$index'));
      },
      separatorBuilder: (context, int index) => Divider(thickness: 1),
      itemCount: 50,
    );
  }

  showModal(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (BuildContext context) => AlertDialog(
            title: Text('Show Model'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Close'),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bottom NavBar EXAMPLE')),
      body: listViewBody(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedAIndex,
        selectedItemColor: Colors.lightGreenAccent,
        onTap: (int index) {
          switch (index) {
            case 0:
              if (selectedAIndex == index) {
                _scrollController.animateTo(
                  0.0,
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              }
            case 1:
              showModal(context);
          }
          setState(() {
            selectedAIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.open_in_browser_rounded),
            label: 'Home',
          ),
        ],
      ),
    );
  }
}
