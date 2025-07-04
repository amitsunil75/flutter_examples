import 'package:flutter/material.dart';
import 'package:flutter_tutorials/flutter_examples/fire_base_intergration_example/services/application_state.dart';
import 'package:flutter_tutorials/flutter_examples/fire_base_intergration_example/widgets/my_widgets.dart';

class YesNoPage extends StatelessWidget {
  YesNoPage({super.key, required this.state, required this.onSelection});
  final Attending state;
  final void Function(Attending selection) onSelection;
  @override
  Widget build(BuildContext context) {
    switch (state) {
      case Attending.yes:
        return Padding(
          padding: EdgeInsetsGeometry.all(10),
          child: Row(
            children: [
              FilledButton(
                onPressed: () {
                  onSelection(Attending.yes);
                },
                child: Text('Yes'),
              ),
              SizedBox(width: 8),
              TextButton(
                onPressed: () {
                  onSelection(Attending.no);
                },
                child: Text('No'),
              ),
            ],
          ),
        );
      case Attending.no:
        return Padding(
          padding: EdgeInsetsGeometry.all(10),
          child: Row(
            children: [
              TextButton(
                onPressed: () => onSelection(Attending.yes),
                child: Text('Yes'),
              ),
              SizedBox(width: 8),
              FilledButton(
                onPressed: () => onSelection(Attending.no),
                child: Text('No'),
              ),
            ],
          ),
        );
      default:
        return Padding(padding: EdgeInsetsGeometry.all(10),
         child:Row(
          children: [
            StyledButton(child: Text('Yes'), onPressed: ()=>onSelection(Attending.yes)),
            SizedBox(width: 8,),
            StyledButton(child: Text('No'), onPressed: ()=>onSelection(Attending.no))
          ],
         )

        );
    }
  }
}
