import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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
