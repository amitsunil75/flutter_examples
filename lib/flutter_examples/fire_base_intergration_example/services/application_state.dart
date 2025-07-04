import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart'
    hide EmailAuthProvider; // Add this import
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart'; // And this import
import 'package:flutter/material.dart';
import 'package:flutter_tutorials/flutter_examples/fire_base_intergration_example/services/models/guest_book_message.dart';

// To here.
enum Attending { yes, no, unknown }

class ApplicationState extends ChangeNotifier {
  ApplicationState() {
    init();
  }
  bool _getLoggedIn = false;
  bool get isLoggedIn => _getLoggedIn;
  int _attendees = 0;
  int get attendees => _attendees;
  Attending _attending = Attending.unknown;
  bool _emailVerified = false;
  bool get emailVerified => _emailVerified;
  StreamSubscription<DocumentSnapshot>? _attendingSubscription;
  Attending get attending => _attending;
  set attending(Attending attending) {
    final userDoc = FirebaseFirestore.instance
        .collection('attendees')
        .doc(FirebaseAuth.instance.currentUser!.uid);
    if (attending == Attending.yes) {
      userDoc.set(<String, dynamic>{'attending': true});
    } else {
      userDoc.set(<String, dynamic>{'attending': false});
    }
  }

  StreamSubscription<QuerySnapshot>? _guestBookSubscription;
  List<GuestBookMessage> _guestBookMessage = [];
  List<GuestBookMessage> get guestBookMessage => _guestBookMessage;
  Future<DocumentReference> addMessageGuestBook(String message) {
    final user = FirebaseAuth.instance.currentUser;
    if (!_getLoggedIn || user == null) {
      throw Exception('Must be logged in');
    }
    //print(FirebaseAuth.instance.currentUser!.displayName ?? 'Anonymous');
    return FirebaseFirestore.instance
        .collection('guestbook')
        .add(<String, dynamic>{
          'text': message,
          'timestamp': DateTime.now(),
          'name': user.displayName,
          'userId': user.uid,
        });
  }

  Future<void> init() async {
    FirebaseUIAuth.configureProviders([EmailAuthProvider()]);
    FirebaseFirestore.instance
        .collection('attendees')
        .where('attending', isEqualTo: true)
        .snapshots()
        .listen((value) {
          _attendees = value.docs.length;
          notifyListeners();
        });
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
        _attendingSubscription = FirebaseFirestore.instance
            .collection('attendees')
            .doc(user.uid)
            .snapshots()
            .listen((value) {
              if (value.data() != null) {
                if (value.data()!['attending'] as bool) {
                  _attending = Attending.yes;
                } else {
                  _attending = Attending.no;
                }
              } else {
                _attending = Attending.unknown;
              }
            });
      } else {
        _getLoggedIn = false;
        _emailVerified = false;
        _guestBookMessage = [];
        _guestBookSubscription?.cancel();
        _attendingSubscription?.cancel();
      }
      notifyListeners();
    });
  }
}
