// Import Firebase and Flutter libraries
import 'package:firebase_core/firebase_core.dart'; // Firebase setup
import 'package:flutter/material.dart'; // Flutter UI framework
import 'package:flutter_tutorials/flutter_examples/fire_base_intergration_example/services/application_state.dart'; // App logic/state
import 'package:flutter_tutorials/flutter_examples/fire_base_intergration_example/ui/guest_book.dart'; // Guest book widget
import 'package:flutter_tutorials/flutter_examples/fire_base_intergration_example/ui/yes_no.dart'; // Yes/No RSVP buttons
import 'package:flutter_tutorials/flutter_examples/fire_base_intergration_example/widgets/my_auth.dart'; // Login/logout widget
import 'package:provider/provider.dart'; // State management package
import 'package:firebase_auth/firebase_auth.dart'
    hide EmailAuthProvider, PhoneAuthProvider; // Firebase Auth, hiding unused providers
import '../widgets/my_widgets.dart'; // Custom widgets (Header, Paragraph, IconAndDetail)

// Main widget for the home screen
class MyHomeWidget extends StatefulWidget {
  const MyHomeWidget({super.key}); // Constructor with optional key

  @override
  State<MyHomeWidget> createState() => _MyHomeWidgetState(); // Link to its state class
}

// The stateful logic of MyHomeWidget
class _MyHomeWidgetState extends State<MyHomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( // Provides basic visual structure
      backgroundColor: const Color.fromARGB(255, 144, 236, 24), // Light green background
      appBar: AppBar( // Top app bar
        backgroundColor: Colors.black,
        title: Text(
          'FireBase MeetUp',
          style: TextStyle(color: Colors.white), // App title in white
        ),
      ),
      body: ListView( // Scrollable content
        children: [

          // -------- IMAGE BANNER --------
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect( // Rounded image corners
              borderRadius: BorderRadiusGeometry.circular(20),
              child: Image.asset(
                'assets/images/codelab.jpg', // Local image asset
                height: 420,
                width: 400,
                fit: BoxFit.cover, // Scales image to box
              ),
            ),
          ),

          const SizedBox(height: 8), // Spacing below image

          // -------- EVENT DETAILS --------
          IconAndDetail(icon: Icons.calendar_today, title: '2025-06-20'), // Date
          IconAndDetail(icon: Icons.location_city, title: 'San Francisco'), // Location

          // -------- LOGIN / LOGOUT --------
          Consumer<ApplicationState>( // Listens to state changes
            builder: (context, appState, _) {
              return MyAuthLogin( // Custom login/logout widget
                isLoggedIn: appState.isLoggedIn,
                signOut: () => FirebaseAuth.instance.signOut(), // Sign out when clicked
              );
            },
          ),

          // -------- DIVIDER --------
          Divider(
            height: 8,
            thickness: 1,
            indent: 8,
            endIndent: 8,
            color: const Color.fromARGB(255, 35, 35, 35), // Grey divider line
          ),

          // -------- EVENT DESCRIPTION --------
          const Header("What we'll be doing"), // Section header
          const Paragraph(
            'Join us for a day full of Firebase Workshops and Pizza!', // Description text
          ),

          // -------- RSVP + DISCUSSION --------
          Consumer<ApplicationState>( // Reacts to state like attendees/messages
            builder: (context, value, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Left align content
                children: [

                  // ----- Show number of attendees -----
                  switch (value.attendees) {
                    1 => const Paragraph('1 person going'),
                    >= 2 => Paragraph('${value.attendees} people going'),
                    _ => const Paragraph('No one going')
                  },

                  // ----- If user is logged in, show RSVP and GuestBook -----
                  if (value.isLoggedIn) ...[
                    YesNoPage( // Custom widget for Yes/No RSVP
                      state: value.attending, // Current selection
                      onSelection: (attending) =>
                          value.attending = attending, // Update on change
                    ),
                    const SizedBox(height: 8), // Spacing

                    const Header('Discussion'), // Section title

                    GuestBook( // Guest book widget for sending messages
                      addMessage: (message) =>
                          value.addMessageGuestBook(message), // Adds message to Firestore
                      messages: value.guestBookMessage, // List of messages to show
                    ),
                  ],
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
