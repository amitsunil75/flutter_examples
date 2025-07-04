// Core Flutter package for UI
import 'dart:async';

import 'package:flutter/material.dart';
// For Firebase initialization
import 'package:firebase_core/firebase_core.dart';
// Firebase Auth (user login/logout), hiding EmailAuthProvider to avoid conflict
import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
// Firebase UI auth widgets (SignInScreen, etc.)
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
// Firestore database access
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_tutorials/flutter_examples/fire_base_intergration_example/services/models/guest_book_message.dart';
// Custom model for guest book entries


// Enum to track user RSVP state
enum Attending { yes, no, unknown }

// Main app state class, notifies UI on change
class ApplicationState extends ChangeNotifier {
  ApplicationState() {
    init(); // Runs on app startup to set up listeners
  }

  bool _getLoggedIn = false; // User login status (private)
  bool get isLoggedIn => _getLoggedIn; // Public getter

  bool _emailVerified = false; // Email verification flag
  bool get emailVerified => _emailVerified;

  int _attendees = 0; // Count of people attending
  int get attendees => _attendees;

  Attending _attending = Attending.unknown; // Current user RSVP status
  Attending get attending => _attending;

  // Update RSVP in Firestore based on enum value
  set attending(Attending value) {
    final uid = FirebaseAuth.instance.currentUser!.uid; // Get current user ID
    FirebaseFirestore.instance
        .collection('attendees') // Access 'attendees' collection
        .doc(uid) // Document for this user
        .set({'attending': value == Attending.yes}); // Set RSVP true/false
  }

  List<GuestBookMessage> _guestBookMessage = []; // Message list from Firestore
  List<GuestBookMessage> get guestBookMessage => _guestBookMessage;

  StreamSubscription<QuerySnapshot>? _guestBookSubscription; // Firestore listener
  StreamSubscription<DocumentSnapshot>? _attendingSubscription;

  // Add a message to Firestore guestbook
  Future<DocumentReference> addMessageGuestBook(String message) {
    final user = FirebaseAuth.instance.currentUser; // Get current user
    if (!_getLoggedIn || user == null) {
      throw Exception('Must be logged in'); // Ensure user is logged in
    }

    return FirebaseFirestore.instance
        .collection('guestbook') // Access guestbook collection
        .add({
          'text': message, // Message content
          'timestamp': DateTime.now(), // When it was added
          'name': user.displayName, // User name
          'userId': user.uid, // User ID
        });
  }

  // Initializes auth and Firestore listeners
  Future<void> init() async {
    FirebaseUIAuth.configureProviders([EmailAuthProvider()]); // Enable email login

    // Listen to count of attendees who RSVP'd 'yes'
    FirebaseFirestore.instance
        .collection('attendees')
        .where('attending', isEqualTo: true)
        .snapshots()
        .listen((snapshot) {
          _attendees = snapshot.docs.length; // Update attendee count
          notifyListeners(); // Notify UI
        });

    // Listen to user login/logout state
    FirebaseAuth.instance.userChanges().listen((user) {
      if (user != null) {
        _getLoggedIn = true; // Mark user as logged in

        // Listen to guestbook messages
        _guestBookSubscription = FirebaseFirestore.instance
            .collection('guestbook')
            .orderBy('timestamp', descending: true)
            .snapshots()
            .listen((snapshot) {
              _guestBookMessage = snapshot.docs.map((doc) => GuestBookMessage(
                name: doc['name'] ?? 'Anonymous', // Message sender
                message: doc['text'] ?? '', // Message content
              )).toList();
              notifyListeners(); // Update UI
            });

        // Listen to this user's RSVP status
        _attendingSubscription = FirebaseFirestore.instance
            .collection('attendees')
            .doc(user.uid)
            .snapshots()
            .listen((doc) {
              final data = doc.data();
              _attending = data == null
                  ? Attending.unknown
                  : (data['attending'] ? Attending.yes : Attending.no);
              notifyListeners(); // Update UI
            });
      } else {
        // If user logged out, reset everything
        _getLoggedIn = false;
        _emailVerified = false;
        _guestBookMessage = [];
        _guestBookSubscription?.cancel(); // Stop listeners
        _attendingSubscription?.cancel();
        notifyListeners();
      }
    });
  }
}
