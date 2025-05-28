import 'package:flutter/material.dart';
import "package:intl/intl.dart"; 

class TimeView extends StatefulWidget {
  const TimeView({super.key});

  @override
  State<TimeView> createState() => _TimeViewState();
}

class _TimeViewState extends State<TimeView> {
  TimeOfDay _selectedTime = TimeOfDay.now();
  DateTime _selectedDate = DateTime.now();

  void _pickTime() async {
    final newTime = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (newTime != null) {
      setState(() => _selectedTime = newTime);
    }
  }

  void _pickDate() async {
    final newDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (newDate != null) {
      setState(() => _selectedDate = newDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Time and Date Picker')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Text('Time: ${_selectedTime.format(context)}'),
                const Spacer(),
                ElevatedButton(
                  onPressed: _pickTime,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: const Text('Change Time'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Text('Date: ${DateFormat.yMMMd().format(_selectedDate)}'),
                const Spacer(),
                ElevatedButton(
                  onPressed: _pickDate,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: const Text('Change Date'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
