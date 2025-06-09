import 'package:flutter/material.dart';

class SliverAppBarExamples extends StatefulWidget {
  const SliverAppBarExamples({super.key});

  @override
  State<SliverAppBarExamples> createState() => _SliverAppBarExamplesState();
}

class _SliverAppBarExamplesState extends State<SliverAppBarExamples> {
  bool _stretch = true;
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            stretch: _stretch,
            stretchTriggerOffset: 300,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('SliverAppBar'),
              background: FlutterLogo(),
            ),
            onStretchTrigger: () async {
              print('SliverAppBar stretch triggered');
            },
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(childCount: 20, (
              BuildContext context,
              int index,
            ) {
              return Container(
                color: index.isOdd ? Colors.amber : Colors.greenAccent,
                height: 100,
                child: Center(
                  child: Text('$index', textScaler: TextScaler.linear(5.0)),
                ),
              );
            }),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: EdgeInsetsGeometry.all(8.0),
          child: OverflowBar(
            overflowAlignment: OverflowBarAlignment.center,
            alignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Stretch'),
                  Switch(
                    value: _stretch,
                    onChanged: (bool value) {
                      setState(() {
                        _stretch = value;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
