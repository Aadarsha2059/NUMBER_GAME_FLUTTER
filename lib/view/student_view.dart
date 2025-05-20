import 'package:flutter/material.dart';
import 'package:num_game/model/student.dart';

class StudentView extends StatefulWidget {
  const StudentView({super.key});

  @override
  State<StudentView> createState() => _StudentViewState();
}

class _StudentViewState extends State<StudentView> {
  final _formKey = GlobalKey<FormState>();

  final lstCity = ["Kathmandu", "Bhaktapur", "Lalitpur", "Pokhara"];
  final List<Student> lstStudent = [];

  final fnameController = TextEditingController();
  final lnameController = TextEditingController();
  String? selectedCity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Student View"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: fnameController,
                decoration: const InputDecoration(labelText: 'First Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter first name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: lnameController,
                decoration: const InputDecoration(labelText: 'Last Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter last name';
                  }
                  return null;
                },
              ),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: 'Select City'),
                items: lstCity.map((city) {
                  return DropdownMenuItem(value: city, child: Text(city));
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedCity = value;
                  });
                },
                validator: (value) => value == null ? 'Please select a city' : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      lstStudent.add(Student(
                        fname: fnameController.text,
                        lname: lnameController.text,
                        city: selectedCity!,
                      ));
                      fnameController.clear();
                      lnameController.clear();
                      selectedCity = null;
                    });
                  }
                },
                child: const Text('Add Student'),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: lstStudent.length,
                  itemBuilder: (context, index) {
                    final student = lstStudent[index];
                    return ListTile(
                      title: Text('${student.fname} ${student.lname}'),
                      subtitle: Text(student.city),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
