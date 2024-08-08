import 'package:flutter/material.dart';
import 'package:user_admin_machinetask/modules/usermodule/screens/user_login_screen.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            SizedBox(height: size.height / 9),
            const Icon(
              Icons.lock,
              size: 100,
            ),
            SizedBox(height: size.height / 8),
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const UserLoginPage();
                }));
              },
              child: const Text(
                "User Login",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(height: size.height / 20),
            GestureDetector(
              onTap: () {
                // Navigator.of(context)
                //     .push(MaterialPageRoute(builder: (context) {
                //   return const AdminLoginPage();
                // }));
              },
              child: const Text(
                "Admin Login",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
