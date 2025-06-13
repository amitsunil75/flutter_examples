import 'package:flutter/material.dart';

class Sliverappnewflutterexample extends StatefulWidget {
  const Sliverappnewflutterexample({super.key});

  @override
  State<Sliverappnewflutterexample> createState() =>
      _SliverappnewflutterexampleState();
}

class _SliverappnewflutterexampleState
    extends State<Sliverappnewflutterexample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          const SliverAppBar.medium(
            backgroundColor: Colors.black,
            pinned: true,
            floating: false,
            flexibleSpace: FlexibleSpaceBar(
             title: Text('Title'),
            ),
           ),
          SliverToBoxAdapter(
            child: Card(
              child: SizedBox(
                height: 1200,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8, 100, 8, 100),
                  child: Text(
                    'Here be scrolling content...',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
