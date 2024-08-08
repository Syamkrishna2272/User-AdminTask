import 'package:flutter/material.dart';
import 'package:user_admin_machinetask/admin/details_adding.dart';

class AdminLoginPage extends StatefulWidget {
  const AdminLoginPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AdminLoginPageState createState() => _AdminLoginPageState();
}

class _AdminLoginPageState extends State<AdminLoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(height: size.height / 5),
                  const Text(
                    'Admin',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                  ),
                  const Icon(
                    Icons.lock,
                    size: 75,
                  ),
                  SizedBox(height: size.height / 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        labelText: 'Name',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                  ),
                  SizedBox(height: size.height / 40),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: TextFormField(
                      controller: _passwordController,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(),
                      ),
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: size.height / 10),
                  ElevatedButton(
                    onPressed: _login,
                    child: const Text('Login'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _login() {
    if (_formKey.currentState!.validate()) {
      if (_nameController.text == 'Admin' &&
          _passwordController.text == '1234') {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) {
          return const DetailAddingPage();
        }));
      }
    }
  }
}
