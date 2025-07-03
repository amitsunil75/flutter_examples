import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart'
    hide EmailAuthProvider; // Add this import
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart'; // And this import
import 'package:flutter/material.dart';
import 'package:flutter_tutorials/flutter_examples/fire_base_intergration_example/services/models/guest_book_message.dart';

// To here.
class ApplicationState extends ChangeNotifier {
  ApplicationState() {
    init();
  }
  bool _getLoggedIn = false;
  bool get isLoggedIn => _getLoggedIn;
  StreamSubscription<QuerySnapshot>? _guestBookSubscription;
  List<GuestBookMessage> _guestBookMessage = [];
  List<GuestBookMessage> get guestBookMessage => _guestBookMessage;

  Future<void> init() async {
    FirebaseUIAuth.configureProviders([EmailAuthProvider()]);
    FirebaseAuth.instance.userChanges().listen((user) {
      if (user != null) {
        _getLoggedIn = true;
        _guestBookSubscription = FirebaseFirestore.instance
            .collection('guestbook')
            .orderBy('timestamp', descending: true)
            .snapshots()
            .listen((snapshots) {
              _guestBookMessage = [];
              for (final document in snapshots.docs) {
                _guestBookMessage.add(
                  GuestBookMessage(
                    message: document.data()['text'],
                    name: document.data()['name'],
                  ),
                );
              }
              notifyListeners();
            });
      } else {
        _getLoggedIn = false;
        _guestBookMessage = [];
        _guestBookSubscription?.cancel();
      }
      notifyListeners();
    });
  }
}
