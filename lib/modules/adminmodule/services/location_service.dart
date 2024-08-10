import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';



//items counting function

Future<void> submit(
    TextEditingController countryController,
    TextEditingController stateController,
    TextEditingController districtController,
    TextEditingController citiesController,
    GlobalKey<FormState> formkey,
    BuildContext context) async {
  if (formkey.currentState!.validate()) {
    final CollectionReference firedata =
        FirebaseFirestore.instance.collection('itemdata');
    final data = {
      'Country': countryController.text,
      'State': stateController.text,
      'District': districtController.text,
      'City': citiesController.text
    };
    await firedata.add(data);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text("Successfully complete"),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.green,
    ));

    

    Navigator.of(context).pop();
  } else {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text(" complete all the details"),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.red,
    ));
  }
}


//Listview builder showing function

Future<List<Map<String, dynamic>>> fetchItems() async {
  final QuerySnapshot querySnapshot = await FirebaseFirestore.instance
      .collection('itemdata')
      .orderBy('createdAt', descending: false) // Change to true for descending order
      .get();
  
  return querySnapshot.docs
      .map((doc) => doc.data() as Map<String, dynamic>)
      .toList();
}


   //List delete function 

  void deleteItem(BuildContext context, String docId) async {
    try {
      await FirebaseFirestore.instance
          .collection('itemdata')
          .doc(docId)
          .delete();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Item deleted successfully'),
          duration: Duration(seconds: 2),
          backgroundColor: Colors.red,
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to delete item: $e')),
      );
    }
  }