import 'package:flutter/material.dart';


class KeyboardResponsiveApp extends StatelessWidget {
  const KeyboardResponsiveApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Keyboard Responsive UI',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.teal),
      home: const UserFormPage(),
    );
  }
}

class UserFormPage extends StatefulWidget {
  const UserFormPage({super.key});

  @override
  State<UserFormPage> createState() => _UserFormPageState();
}

class _UserFormPageState extends State<UserFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _mobileController = TextEditingController();

  final _focusName = FocusNode();
  final _focusEmail = FocusNode();
  final _focusMobile = FocusNode();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _mobileController.dispose();
    _focusName.dispose();
    _focusEmail.dispose();
    _focusMobile.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isLargeScreen = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      appBar: AppBar(title: const Text("User Details")),
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: isLargeScreen ? 600 : double.infinity,
          ),
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: SingleChildScrollView(
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                top: 32,
                bottom: MediaQuery.of(context).viewInsets.bottom + 32,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _nameController,
                      focusNode: _focusName,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        labelText: "Name",
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) =>
                          value!.isEmpty ? "Enter your name" : null,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(_focusEmail);
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _emailController,
                      focusNode: _focusEmail,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        labelText: "Email",
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) => value!.contains("@")
                          ? null
                          : "Enter a valid email",
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(_focusMobile);
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _mobileController,
                      focusNode: _focusMobile,
                      keyboardType: TextInputType.phone,
                      textInputAction: TextInputAction.done,
                      decoration: const InputDecoration(
                        labelText: "Mobile Number",
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) =>
                          value!.length >= 10 ? null : "Enter valid number",
                      onFieldSubmitted: (_) => FocusScope.of(context).unfocus(),
                    ),
                    const SizedBox(height: 32),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ComplexNextPage(
                                name: _nameController.text,
                                email: _emailController.text,
                                mobile: _mobileController.text,
                              ),
                            ),
                          );
                        }
                      },
                      child: const Text("Submit"),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
class ComplexNextPage extends StatelessWidget {
  final String name, email, mobile;

  const ComplexNextPage({
    super.key,
    required this.name,
    required this.email,
    required this.mobile,
  });

  @override
  Widget build(BuildContext context) {
    final isLargeScreen = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      appBar: AppBar(title: const Text("Profile Overview")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: isLargeScreen
            ? Row(
                children: [
                  Expanded(child: _buildProfileCard(context)),
                  const SizedBox(width: 16),
                  Expanded(child: _buildDetailsCard(context)),
                ],
              )
            : ListView(
                children: [
                  _buildProfileCard(context),
                  const SizedBox(height: 16),
                  _buildDetailsCard(context),
                ],
              ),
      ),
    );
  }

  Widget _buildProfileCard(BuildContext context) {
    return Card(
      elevation: 4,
      child: Column(
        children: [
          const SizedBox(height: 16),
          const CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(
              'https://i.pravatar.cc/300',
            ),
          ),
          const SizedBox(height: 8),
          Text(
            name,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 4),
          Text(email),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildDetailsCard(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Contact Info",
                style: Theme.of(context).textTheme.titleLarge),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.email),
              title: Text(email),
            ),
            ListTile(
              leading: const Icon(Icons.phone),
              title: Text(mobile),
            ),
            const SizedBox(height: 8),
            ElevatedButton.icon(
              icon: const Icon(Icons.edit),
              label: const Text("Edit Info"),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}
