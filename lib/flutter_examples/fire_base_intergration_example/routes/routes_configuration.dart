import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tutorials/flutter_examples/fire_base_intergration_example/ui/my_home.dart';

import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const MyHomeWidget(),
      routes: [
        GoRoute(
          path: 'sign-in',
          builder: (context, state) {
            return SignInScreen(
              actions: [
                ForgotPasswordAction((context, email) {
                  final uri = Uri(
                    path: '/sign-in/forgot-password',
                    queryParameters: {'email': email},
                  );
                  context.push(uri.toString());
                }),
                AuthStateChangeAction(((context, state) {
                  final user = switch (state) {
                    SignedIn(:final user) => user,
                    UserCreated(:final credential) => credential.user,
                    _ => null,
                  };
                  if (user == null) {
                    return;
                  }
                  if (state is UserCreated) {
                    user.updateDisplayName(user.email?.split('@').first);
                  }
                  if (!user.emailVerified) {
                    user.sendEmailVerification();
                    const snackBar = SnackBar(
                      content: Text('Please verify your email address.'),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                  context.pushReplacement('/');
                })),
              ],
            );
          },
          routes: [
            GoRoute(
              path: 'forgot-password',
              builder: (context, state) {
                final arguments = state.uri.queryParameters;
                return ForgotPasswordScreen(
                  email: arguments['email'],
                  headerMaxExtent: 200,
                );
              },
            ),
          ],
        ),
        GoRoute(
          path: 'profile',
          builder: (context, state) {
            return ProfileScreen(
              providers: [],
              actions: [
                SignedOutAction((context) {
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
class MyApplication extends StatelessWidget {
  const MyApplication({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return // SwitchApp();
    MaterialApp.router(
      title: 'Firebase UI Auth Example',
      theme: ThemeData(
        buttonTheme: Theme.of(context).buttonTheme.copyWith(
              highlightColor: Colors.deepPurple,
            ),
        primarySwatch: Colors.deepPurple,
        textTheme: GoogleFonts.robotoTextTheme(
          Theme.of(context).textTheme,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      themeAnimationCurve: Curves.bounceOut,
     routerConfig:_router ,
    
    );
  }
}
