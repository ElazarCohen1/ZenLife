import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_version/views/widget/customPaint.dart';

class AddPayement extends StatefulWidget {
  const AddPayement({super.key});

  @override
  State<AddPayement> createState() => _AddPayementState();
}

class _AddPayementState extends State<AddPayement> {
  final _formKey = GlobalKey<FormState>();

  final montantController = TextEditingController();

  final descriptionController = TextEditingController();

  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    DateTime? selectedDate;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ajouter un paiement"),
        centerTitle: true,
      ),
      body: CustomPaint(
        painter: BackgroundPainter(),
        size: Size.infinite,
        child: Center(
          child: Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(50),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 5,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Montant",
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Description",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 20),

                      DateTimeFormField(
                        mode: DateTimeFieldPickerMode.date,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Enter Date',
                        ),
                        initialValue: DateTime.now(),

                        firstDate: DateTime.now().add(const Duration(days: 10)),
                        lastDate: DateTime.now().add(const Duration(days: 40)),
                        initialPickerDateTime: DateTime.now().add(
                          const Duration(days: 20),
                        ),
                        onChanged: (DateTime? value) {
                          selectedDate = value;
                        },
                      ),

                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          if (selectedDate != null) {
                            // Logique pour ajouter le paiement
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  "Paiement ajouté pour le ${selectedDate!.toLocal()}",
                                ),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Veuillez sélectionner une date"),
                              ),
                            );
                          }
                        },
                        child: const Text("Ajouter"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
