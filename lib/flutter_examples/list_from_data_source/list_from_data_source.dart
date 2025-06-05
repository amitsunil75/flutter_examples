import 'package:flutter/material.dart';

import 'components_source/heading_item.dart';

class ListFromDataSource extends StatefulWidget {
  const ListFromDataSource({super.key});

  @override
  State<ListFromDataSource> createState() => _ListFromDataSourceState();
}

class _ListFromDataSourceState extends State<ListFromDataSource> {
  final List<ListItem> items = List<ListItem>.generate(
    1000,
    (i) =>
        i % 6 == 0
            ? HeadingItem('Heading $i')
            : MessageItem('Sender $i', 'Message body $i'),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          final item = items[index];
          return ListTile(title: item.buildTitle(context),
            subtitle: item.buildSubTitle(context),
          );
        },
      ),
    );
  }
}
