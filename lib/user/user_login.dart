import 'package:flutter/material.dart';

class UserLoginPage extends StatelessWidget {
  const UserLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: size.height / 5),
              const Text(
                'User',
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
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(height: size.height / 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                ),
              ),
              SizedBox(height: size.height / 10),
              ElevatedButton(
                onPressed: () {
                  // Handle login logic
                },
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
