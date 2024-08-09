import 'package:flutter/material.dart';
import 'package:user_admin_machinetask/modules/adminmodule/services/location_service.dart';

class AddingScreen extends StatelessWidget {
  AddingScreen({super.key});
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final countryController = TextEditingController();
  final stateController = TextEditingController();
  final districtController = TextEditingController();
  final citiesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Center(
          child: Text(
            "Add the Items",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Form(
                    key: formkey,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 30, left: 15, right: 15),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter Country name';
                              }
                              return null;
                            },
                            controller: countryController,
                            decoration: const InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(),
                              hintText: 'Country',
                            ),
                            textCapitalization: TextCapitalization.words,
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter State name';
                              }
                              return null;
                            },
                            controller: stateController,
                            decoration: const InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(),
                                hintText: 'State'),
                            textCapitalization: TextCapitalization.words,
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter District name';
                              }
                              return null;
                            },
                            controller: districtController,
                            decoration: const InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(),
                                hintText: 'District'),
                            textCapitalization: TextCapitalization.words,
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter City name';
                              }
                              return null;
                            },
                            controller: citiesController,
                            decoration: const InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(),
                              hintText: 'City',
                            ),
                            textCapitalization: TextCapitalization.words,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(300, 45),
                                backgroundColor:
                                    const Color.fromARGB(255, 34, 128, 145),
                              ),
                              onPressed: () {
                                submit(
                                    countryController,
                                    stateController,
                                    districtController,
                                    citiesController,
                                    formkey,
                                    context ,);
                              },
                              icon: const Icon(
                                Icons.check,
                                color: Colors.white,
                              ),
                              label: const Text(
                                'Submit',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )),
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
