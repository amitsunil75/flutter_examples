import 'package:flutter/material.dart';

class PinnedSearchBarFlutter extends StatelessWidget {
  const PinnedSearchBarFlutter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: true,
            clipBehavior: Clip.none,
            shape: StadiumBorder(),
            scrolledUnderElevation: 0.0,
            titleSpacing: 0.0,
            backgroundColor: Colors.transparent,
            title: SearchAnchor.bar(
              suggestionsBuilder: (BuildContext context, SearchController) {
                return List.generate(
                  
                  5, (int index) {
                  return ListTile(
                    titleAlignment: ListTileTitleAlignment.center,
                    title: Text('search'),
                  );
                });
              },
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsetsGeometry.all(20),
              child: SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, int index) {
                    return SizedBox(
                      width: 100.0,
                      child: Card(child: Center(child: Text('Card $index')),),
                    );
                  },
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child:Padding(padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
            child: Container(
              height: 300,
              color: Colors.amberAccent,
            ),
            ),
          )
        ],
      ),
    );
  }
}
