import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:user_admin_machinetask/modules/adminmodule/screens/add_location_screen.dart';

class AdminDashBoard extends StatelessWidget {
  const AdminDashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Center(child: Text("Welcome to Admin",style: TextStyle(fontWeight: FontWeight.w700,color: Colors.blueGrey),)),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const Text(
                "Details",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: const Color.fromARGB(255, 230, 201, 113),
                  ),
                  width: size.width / 1.5,
                  height: size.height / 5,
                  child: Center(
                    child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('itemdata')
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          return const Text('Error loading data');
                        } else if (!snapshot.hasData ||
                            snapshot.data!.size == 0) {
                          return const Text('No items found');
                        } else {
                          int itemCount = snapshot.data!.size;
                          return Text(
                            'Total Details: $itemCount',
                            style: const TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          );
                        }
                      },
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return AddingScreen();
                    }));
                  },
                  child: const Text("Add more..."))
            ],
          ),
        ),
      ),
    );
  }
}
