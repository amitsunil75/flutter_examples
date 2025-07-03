import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tutorials/flutter_examples/fire_base_intergration_example/services/application_state.dart';
import 'package:flutter_tutorials/flutter_examples/fire_base_intergration_example/widgets/my_auth.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart'
    hide EmailAuthProvider, PhoneAuthProvider;
import '../widgets/my_widgets.dart';

class MyHomeWidget extends StatefulWidget {
  const MyHomeWidget({super.key});

  @override
  State<MyHomeWidget> createState() => _MyHomeWidgetState();
}

class _MyHomeWidgetState extends State<MyHomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 144, 236, 24),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('FireBase MeetUp',style: TextStyle(color: Colors.white),)),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(20),
              child: Image.asset('assets/images/codelab.jpg',height: 420,width: 400,fit: BoxFit.cover,)),
          ),
          const SizedBox(height: 8),
          IconAndDetail(icon: Icons.calendar_today, title: '2025-06-20'),
          IconAndDetail(icon: Icons.location_city, title: 'San Francisco'),
          Consumer<ApplicationState>(
            builder: (context, appState, _) {
              return MyAuthLogin(
                isLoggedIn: appState.isLoggedIn,
                signOut: () {
                  FirebaseAuth.instance.signOut();
                },
              );
            },
          ),
          Divider(
            height: 8,
            thickness: 1,
            indent: 8,
            endIndent: 8,
            color: const Color.fromARGB(255, 35, 35, 35),
          ),
          const Header("What we'll be doing"),
          const Paragraph(
            'Join us for a day full of Firebase Workshops and Pizza!',
          ),
        ],
      ),
    );
  }
}
