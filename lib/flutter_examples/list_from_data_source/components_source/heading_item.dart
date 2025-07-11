import 'package:flutter/material.dart';

abstract class ListItem {
  Widget buildTitle(BuildContext context);
  Widget buildSubTitle(BuildContext context);
}

class HeadingItem implements ListItem {
  final String heading;
  HeadingItem(this.heading);
  @override
  Widget buildTitle(BuildContext context) {
    return Text(heading, style: Theme.of(context).textTheme.headlineSmall);
  }

  @override
  Widget buildSubTitle(BuildContext context) {
    return SizedBox.shrink();
  }
}

class MessageItem implements ListItem {
  final String sender;
  final String body;
  MessageItem(this.body, this.sender);
  @override
  Widget buildTitle(BuildContext context) => Text(sender);
  @override
  Widget buildSubTitle(BuildContext context) => Text(body);
}
