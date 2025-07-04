// Import Firebase UI for prebuilt authentication screens and actions.
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
// Import core Flutter UI library.
import 'package:flutter/material.dart';
// Import your custom home widget.
import 'package:flutter_tutorials/flutter_examples/fire_base_intergration_example/ui/my_home.dart';
// Import GoRouter for navigation/routing.
import 'package:go_router/go_router.dart';
// Import Google Fonts package for custom fonts.
import 'package:google_fonts/google_fonts.dart';

// Define the main app router using GoRouter for declarative routing.
final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/', // Root route
      builder: (context, state) => const MyHomeWidget(), // Displays the custom home widget
      routes: [ // Nested routes
        GoRoute(
          path: 'sign-in', // Route for the sign-in screen
          builder: (context, state) {
            return SignInScreen( // Prebuilt FirebaseUI sign-in screen
              actions: [ // Define what happens on different auth actions
                ForgotPasswordAction((context, email) {
                  // Navigate to forgot-password screen with email prefilled
                  final uri = Uri(
                    path: '/sign-in/forgot-password',
                    queryParameters: {'email': email},
                  );
                  context.push(uri.toString());
                }),
                AuthStateChangeAction(((context, state) {
                  // Handles auth state changes (e.g., signed in, user created)
                  final user = switch (state) {
                    SignedIn(:final user) => user, // Signed in user
                    UserCreated(:final credential) => credential.user, // Newly created user
                    _ => null,
                  };
                  if (user == null) {
                    return;
                  }
                  if (state is UserCreated) {
                    // Set display name to email prefix if new user
                    user.updateDisplayName(user.email?.split('@').first);
                  }
                  if (!user.emailVerified) {
                    // Prompt email verification if not verified
                    user.sendEmailVerification();
                    const snackBar = SnackBar(
                      content: Text('Please verify your email address.'),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                  // Navigate to home after successful auth
                  context.pushReplacement('/');
                })),
              ],
            );
          },
          routes: [
            GoRoute(
              path: 'forgot-password', // Route for forgot password screen
              builder: (context, state) {
                final arguments = state.uri.queryParameters;
                return ForgotPasswordScreen(
                  email: arguments['email'], // Prefill email if provided
                  headerMaxExtent: 200, // Customize header size
                );
              },
            ),
          ],
        ),
        GoRoute(
          path: 'profile', // Profile route
          builder: (context, state) {
            return ProfileScreen(
              providers: [], // Empty = show default provider info
              actions: [
                SignedOutAction((context) {
                  // Redirect to sign-in after logout
                  context.pushReplacement('/sign-in');
                }),
              ],
            );
          },
        ),
      ],
    ),
  ],
);

// Main application widget
class MyApplication extends StatelessWidget {
  const MyApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router( // MaterialApp with router support
      title: 'Firebase UI Auth Example', // App title
      theme: ThemeData( // Define app theme
        buttonTheme: Theme.of(context).buttonTheme.copyWith(
              highlightColor: Colors.deepPurple, // Customize button highlight
            ),
        primarySwatch: Colors.deepPurple, // Primary theme color
        textTheme: GoogleFonts.robotoTextTheme( // Use Roboto font via GoogleFonts
          Theme.of(context).textTheme,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity, // Platform adaptive spacing
        useMaterial3: true, // Enable Material 3 UI design
      ),
      debugShowCheckedModeBanner: false, // Disable debug banner
      themeAnimationCurve: Curves.bounceOut, // Animation curve for transitions
      routerConfig: _router, // Use defined router for navigation
    );
  }
}
