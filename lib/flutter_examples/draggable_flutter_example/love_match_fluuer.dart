import 'package:flutter/material.dart';
import 'dart:math';


class LoveMatcherApp extends StatefulWidget {
  const LoveMatcherApp({super.key});

  @override
  State<LoveMatcherApp> createState() => _LoveMatcherAppState();
}

class _LoveMatcherAppState extends State<LoveMatcherApp>
    with SingleTickerProviderStateMixin {
  String username = "";
  String gender = "Male";
  String? matchResult;
  bool showResult = false;

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));
    _animation = CurvedAnimation(parent: _controller, curve: Curves.elasticOut);
  }

  void findPartner() {
    if (username.isEmpty) return;
    final partnerName = generateRandomName(gender);
    setState(() {
      matchResult = partnerName;
      showResult = true;
    });
    _controller.forward(from: 0);
  }

  void reset() {
    setState(() {
      username = "";
      matchResult = null;
      showResult = false;
    });
  }

  String generateRandomName(String gender) {
    final Random rand = Random();
    final List<String> prefixes = ['Lu', 'Za', 'Ma', 'Yu', 'Ro', 'Ki', 'El', 'Jo', 'Xe', 'Vi'];
    final List<String> middles = ['na', 'ri', 'lo', 'zi', 'ka', 'me', 'do', 'sha', 'ra', 'ne'];
    final List<String> suffixes = ['a', 'us', 'in', 'el', 'on', 'ie', 'ar', 'ix', 'or', 'ya'];

    String name = prefixes[rand.nextInt(prefixes.length)] +
        middles[rand.nextInt(middles.length)] +
        suffixes[rand.nextInt(suffixes.length)];

    if (gender == "Male" && name.endsWith('a')) {
      name = '${name.substring(0, name.length - 1)}o';
    } else if (gender == "Female" && !name.endsWith('a')) {
      name = '${name}a';
    }

    return name;
  }

  Widget buildLetter(String letter) {
    return Draggable<String>(
      data: letter,
      feedback: Material(
        color: Colors.transparent,
        child: CircleAvatar(
          backgroundColor: Colors.pinkAccent,
          radius: 22,
          child: Text(letter, style: const TextStyle(fontSize: 20, color: Colors.white)),
        ),
      ),
      childWhenDragging: Opacity(
        opacity: 0.3,
        child: CircleAvatar(
          backgroundColor: Colors.grey.shade300,
          radius: 20,
          child: Text(letter),
        ),
      ),
      child: CircleAvatar(
        backgroundColor: Colors.blue.shade200,
        radius: 20,
        child: Text(letter),
      ),
    );
  }

  Widget buildUsernameField() {
    return DragTarget<String>(
      onAcceptWithDetails: (data) {
        setState(() {
          //username += data;
        });
      },
      builder: (context, accepted, rejected) {
        return Container(
          width: 280,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.deepPurple, width: 2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            username.isEmpty ? "Drop Letters Here" : username,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        );
      },
    );
  }

  Widget buildGenderSelection() {
    return Wrap(
      spacing: 10,
      children: [
        ChoiceChip(
          label: const Text('Male'),
          selected: gender == "Male",
          onSelected: (_) => setState(() => gender = "Male"),
          selectedColor: Colors.blueAccent,
        ),
        ChoiceChip(
          label: const Text('Female'),
          selected: gender == "Female",
          onSelected: (_) => setState(() => gender = "Female"),
          selectedColor: Colors.pinkAccent,
        ),
      ],
    );
  }

  Widget buildResultArea() {
    if (!showResult || matchResult == null) return const SizedBox.shrink();
    return ScaleTransition(
      scale: _animation,
      child: Column(
        children: [
          const SizedBox(height: 30),
          const Text(
            "Your matching pair is:",
            style: TextStyle(fontSize: 20, color: Colors.black54),
          ),
          const SizedBox(height: 10),
          Text(
            matchResult!,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.pinkAccent,
            ),
          ),
          const SizedBox(height: 20),
          const Text("💖 Thank You! 💖", style: TextStyle(fontSize: 18)),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: reset,
            style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
            child: const Text("Try Again"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<String> letters = List.generate(26, (i) => String.fromCharCode(65 + i));

    return Scaffold(
      appBar: AppBar(
        title: const Text("💘 Love Matcher 💘"),
        backgroundColor: Colors.pinkAccent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            buildUsernameField(),
            const SizedBox(height: 20),
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children: letters.map(buildLetter).toList(),
            ),
            const SizedBox(height: 20),
            buildGenderSelection(),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: findPartner,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pinkAccent,
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              ),
              child: const Text("Find Your Partner 💞"),
            ),
            const SizedBox(height: 20),
            buildResultArea(),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}






class LoveindianMatcherApp extends StatefulWidget {
  const LoveindianMatcherApp({super.key});

  @override
  State<LoveindianMatcherApp> createState() => _LoveindianMatcherAppState();
}

class _LoveindianMatcherAppState extends State<LoveindianMatcherApp>
    with SingleTickerProviderStateMixin {
  String username = "";
  String gender = "Male";
  String? matchResult;
  bool showResult = false;

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));
    _animation = CurvedAnimation(parent: _controller, curve: Curves.elasticOut);
  }

  void findPartner() {
    if (username.isEmpty) return;
    final partnerName = generateRandomIndianName(gender);
    setState(() {
      matchResult = partnerName;
      showResult = true;
    });
    _controller.forward(from: 0);
  }

  void reset() {
    setState(() {
      username = "";
      matchResult = null;
      showResult = false;
    });
  }

  // ✅ Dynamic realistic Indian name generator
  String generateRandomIndianName(String gender) {
    final Random rand = Random();

    final List<String> malePrefixes = [
      'Rah', 'Dev', 'Kar', 'Arv', 'Vik', 'Suh', 'Man', 'Raj', 'Tan', 'Ami',
      'Har', 'Om', 'Nir', 'Par', 'Sam', 'Ank', 'Rav', 'Yash', 'Sanj', 'Ujj'
    ];

    final List<String> femalePrefixes = [
      'Poo', 'Mee', 'Anj', 'Kav', 'Rosh', 'Nee', 'Sona', 'Tanu', 'Isha', 'Sne',
      'Lax', 'Gita', 'Heer', 'Rani', 'Diya', 'Rupa', 'Nitu', 'Bina', 'Jaya', 'Chhavi'
    ];

    final List<String> middles = [
      'an', 'it', 'al', 'esh', 'pre', 'sha', 'ni', 'ta', 'ika', 'ya', 'mi', 'na', 'ra', 'chi', 'shi'
    ];

    final List<String> suffixes = [
      'sh', 'a', 'i', 'ya', 'ita', 'ika', 'al', 'na', 'raj', 'ni', 'veer', 'deep', 'pal', 'vansh'
    ];

    final prefixes = gender == "Male" ? malePrefixes : femalePrefixes;

    String name = prefixes[rand.nextInt(prefixes.length)] +
        middles[rand.nextInt(middles.length)] +
        suffixes[rand.nextInt(suffixes.length)];

    // Capitalize first letter
    return name[0].toUpperCase() + name.substring(1);
  }

  Widget buildLetter(String letter) {
    return Draggable<String>(
      data: letter,
      feedback: Material(
        color: Colors.transparent,
        child: CircleAvatar(
          backgroundColor: Colors.pinkAccent,
          radius: 22,
          child: Text(letter, style: const TextStyle(fontSize: 20, color: Colors.white)),
        ),
      ),
      childWhenDragging: Opacity(
        opacity: 0.3,
        child: CircleAvatar(
          backgroundColor: Colors.grey.shade300,
          radius: 20,
          child: Text(letter),
        ),
      ),
      child: CircleAvatar(
        backgroundColor: Colors.blue.shade200,
        radius: 20,
        child: Text(letter),
      ),
    );
  }

  Widget buildUsernameField() {
    return DragTarget<String>(
      onAcceptWithDetails: (data) {
        setState(() {
          //username += data;
        });
      },
      builder: (context, accepted, rejected) {
        return Container(
          width: 280,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.deepPurple, width: 2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            username.isEmpty ? "Drop Letters Here" : username,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        );
      },
    );
  }

  Widget buildGenderSelection() {
    return Wrap(
      spacing: 10,
      children: [
        ChoiceChip(
          label: const Text('Male'),
          selected: gender == "Male",
          onSelected: (_) => setState(() => gender = "Male"),
          selectedColor: Colors.blueAccent,
        ),
        ChoiceChip(
          label: const Text('Female'),
          selected: gender == "Female",
          onSelected: (_) => setState(() => gender = "Female"),
          selectedColor: Colors.pinkAccent,
        ),
      ],
    );
  }

  Widget buildResultArea() {
    if (!showResult || matchResult == null) return const SizedBox.shrink();
    return ScaleTransition(
      scale: _animation,
      child: Column(
        children: [
          const SizedBox(height: 30),
          const Text(
            "Your matching pair is:",
            style: TextStyle(fontSize: 20, color: Colors.black54),
          ),
          const SizedBox(height: 10),
          Text(
            matchResult!,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.pinkAccent,
            ),
          ),
          const SizedBox(height: 20),
          const Text("💖 Thank You! 💖", style: TextStyle(fontSize: 18)),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: reset,
            style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
            child: const Text("Try Again"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<String> letters = List.generate(26, (i) => String.fromCharCode(65 + i));

    return Scaffold(
      appBar: AppBar(
        title: const Text("💘 Indian Love Matcher 💘"),
        backgroundColor: Colors.pinkAccent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            buildUsernameField(),
            const SizedBox(height: 20),
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children: letters.map(buildLetter).toList(),
            ),
            const SizedBox(height: 20),
            buildGenderSelection(),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: findPartner,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pinkAccent,
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              ),
              child: const Text("Find Your Indian Partner 💞"),
            ),
            const SizedBox(height: 20),
            buildResultArea(),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
