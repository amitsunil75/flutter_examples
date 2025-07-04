import 'package:flutter/material.dart'; // Core Flutter UI
import 'package:flutter_tutorials/flutter_examples/fire_base_intergration_example/widgets/my_widgets.dart'; // Custom StyledButton
import 'package:go_router/go_router.dart'; // For navigation (routing)

// Widget to show Login/Logout and Profile buttons based on auth state
class MyAuthLogin extends StatelessWidget {
  // Track if user is logged in
  bool isLoggedIn = false;

  // Function to call when user clicks logout
  void Function() signOut;

  // Constructor with required parameters
  MyAuthLogin({
    super.key,
    required this.signOut,
    required this.isLoggedIn,
  });

  @override
  Widget build(BuildContext context) {
    return Row( // Display login/logout + profile in a row
      children: [

        // Padding around login/logout button
        Padding(
          padding: EdgeInsets.only(bottom: 8, left: 24),
          child: StyledButton(
            // Show "Login" when not logged in, else show "Logout"
            child: !isLoggedIn
                ? Text('Login', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold))
                : Text('Logout'),

            // Navigate to login screen if not logged in, else call signOut
            onPressed: () {
              !isLoggedIn ? context.push('/sign-in') : signOut();
            },
          ),
        ),

        // Show profile button only when logged in
        Visibility(
          visible: isLoggedIn, // Conditionally render profile button
          child: StyledButton(
            child: Text('Profile'),
            onPressed: () {
              context.push('/profile'); // Go to profile screen
            },
          ),
        ),
      ],
    );
  }
}
