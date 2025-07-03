import 'package:flutter/material.dart';

class IconAndDetail extends StatelessWidget {
  IconData icon;
  String title;
  IconAndDetail({super.key,required this.icon,required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: [
          Icon(icon),
          const SizedBox(width: 10),
          Text(title.toString())
        ],)
      ],
    );
  }
}


class Paragraph extends StatelessWidget {
  const Paragraph(this.content, {super.key});
  final String content;
  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    child: Text(content, style: const TextStyle(fontSize: 18)),
  );
}
class StyledButton extends StatelessWidget {
  const StyledButton({required this.child, required this.onPressed, super.key});
  final Widget child;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) => OutlinedButton(
    style: OutlinedButton.styleFrom(
      side: const BorderSide(color: Color.fromARGB(255, 237, 236, 238)),
    ),
    onPressed: onPressed,
    child: child,
  );
}



class Header extends StatelessWidget {
  const Header(this.heading, {super.key});
  final String heading;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text(heading, style:  TextStyle(fontSize: 24,fontWeight:FontWeight.bold)),
  );
}
