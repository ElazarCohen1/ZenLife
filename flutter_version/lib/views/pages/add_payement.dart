import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_version/data/classes/money.dart';
import 'package:flutter_version/views/widget/customPaint.dart';
import 'package:provider/provider.dart';

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

  bool _isIncome = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Append a Transaction"),
        centerTitle: true,
      ),
      body: CustomPaint(
        painter: BackgroundPainter(),
        size: Size.infinite,
        child: Center(
          child: Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(50),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Padding(
                //   padding: const EdgeInsets.all(20.0),
                //   child: SizedBox(
                //     width: double.infinity,
                //     child: const Text(
                //       "Append a transaction",
                //       style: TextStyle(
                //         fontSize: 21,
                //         fontWeight: FontWeight.bold,
                //       ),
                //     ),
                //   ),
                // ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(
                              color: _isIncome ? Colors.green : Colors.red,
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              _isIncome = !_isIncome;
                            });
                          },
                          child: Text(
                            _isIncome
                                ? " Append an Income"
                                : " Append a Spending",
                            style: TextStyle(
                              color: _isIncome ? Colors.green : Colors.red,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Montant",
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez entrer un montant';
                          } else if (double.tryParse(value) == null) {
                            return 'Veuillez entrer un montant valide';
                          } else {
                            return null;
                          }
                        },
                        controller: montantController,
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Description",
                          border: OutlineInputBorder(),
                        ),
                        controller: descriptionController,
                      ),
                      const SizedBox(height: 20),

                      DateTimeFormField(
                        mode: DateTimeFieldPickerMode.date,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Enter Date',
                        ),

                        firstDate: DateTime(2000, 1, 1),
                        lastDate: DateTime.now(),
                        initialPickerDateTime: DateTime.now(),
                        onChanged: (DateTime? value) {
                          selectedDate = value;
                        },
                      ),

                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          final budget = Provider.of<Budget>(
                            context,
                            listen: false,
                          );

                          if (_formKey.currentState!.validate()) {
                            _isIncome
                                ? budget.addIncome(
                                  Transaction(
                                    amount: double.parse(
                                      montantController.text,
                                    ),
                                    date: selectedDate ?? DateTime.now(),
                                    description: descriptionController.text,
                                    isIncome: _isIncome,
                                  ),
                                )
                                : budget.addSpending(
                                  Transaction(
                                    amount: double.parse(
                                      montantController.text,
                                    ),
                                    date: selectedDate ?? DateTime.now(),
                                    description: descriptionController.text,
                                    isIncome: _isIncome,
                                  ),
                                );
                            Navigator.pop(context);
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
