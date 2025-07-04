import 'package:flutter/material.dart'; // Flutter UI package
import 'package:flutter_tutorials/flutter_examples/fire_base_intergration_example/services/application_state.dart'; // Access Attending enum
import 'package:flutter_tutorials/flutter_examples/fire_base_intergration_example/widgets/my_widgets.dart'; // Custom StyledButton

// A stateless widget to show Yes/No RSVP options
class YesNoPage extends StatelessWidget {
  YesNoPage({
    super.key,
    required this.state, // Current RSVP state (yes/no/unknown)
    required this.onSelection, // Callback when user taps Yes/No
  });

  final Attending state; // Stores current selection state
  final void Function(Attending selection) onSelection; // Function to handle new selection

  @override
  Widget build(BuildContext context) {
    // Use switch to show buttons based on current state
    switch (state) {
      case Attending.yes:
        return Padding(
          padding: EdgeInsetsGeometry.all(10), // Outer padding
          child: Row( // Display Yes (filled) and No (text) buttons
            children: [
              FilledButton(
                onPressed: () => onSelection(Attending.yes), // Keep selection
                child: Text('Yes'),
              ),
              SizedBox(width: 8), // Spacing between buttons
              TextButton(
                onPressed: () => onSelection(Attending.no), // Change to No
                child: Text('No'),
              ),
            ],
          ),
        );

      case Attending.no:
        return Padding(
          padding: EdgeInsetsGeometry.all(10),
          child: Row( // Display No (filled) and Yes (text) buttons
            children: [
              TextButton(
                onPressed: () => onSelection(Attending.yes), // Change to Yes
                child: Text('Yes'),
              ),
              SizedBox(width: 8),
              FilledButton(
                onPressed: () => onSelection(Attending.no), // Keep No
                child: Text('No'),
              ),
            ],
          ),
        );

      default:
        return Padding(
          padding: EdgeInsetsGeometry.all(10),
          child: Row( // Default buttons using custom StyledButton
            children: [
              StyledButton(
                child: Text('Yes'),
                onPressed: () => onSelection(Attending.yes),
              ),
              SizedBox(width: 8),
              StyledButton(
                child: Text('No'),
                onPressed: () => onSelection(Attending.no),
              ),
            ],
          ),
        );
    }
  }
}
