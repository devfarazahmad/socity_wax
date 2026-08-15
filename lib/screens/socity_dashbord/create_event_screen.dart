import 'package:flutter/material.dart';

class CreateEventScreen extends StatefulWidget {
  const CreateEventScreen({super.key});

  @override
  State<CreateEventScreen> createState() =>
      _CreateEventScreenState();
}

class _CreateEventScreenState
    extends State<CreateEventScreen> {
  final TextEditingController _titleController =
      TextEditingController();

  final TextEditingController _locationController =
      TextEditingController();

  final TextEditingController _guestController =
      TextEditingController();

  final TextEditingController _maxPeopleController =
      TextEditingController();

  DateTime? startDate;
  DateTime? endDate;

  Future<void> _selectDate(bool isStart) async {
    final picked = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2035),
      initialDate: DateTime.now(),
    );

    if (picked == null) return;

    setState(() {
      if (isStart) {
        startDate = picked;
      } else {
        endDate = picked;
      }
    });
  }

  void _scheduleEvent() {
    if (_titleController.text.trim().isEmpty ||
        _locationController.text.trim().isEmpty ||
        _guestController.text.trim().isEmpty ||
        _maxPeopleController.text.trim().isEmpty ||
        startDate == null ||
        endDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Please fill all event details',
          ),
        ),
      );

      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Event scheduled successfully',
        ),
      ),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _locationController.dispose();
    _guestController.dispose();
    _maxPeopleController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(
        title: const Text('Create an Event'),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            _label('Event Title'),

            _field(
              controller: _titleController,
              hint: 'Enter event title',
            ),

            _label('Event Location'),

            _field(
              controller: _locationController,
              hint: 'Enter event location',
            ),

            _label('Chief Guest'),

            _field(
              controller: _guestController,
              hint: 'Enter chief guest name',
            ),

            _label('Max Number of People'),

            _field(
              controller: _maxPeopleController,
              hint: 'Enter maximum number',
              keyboardType:
                  TextInputType.number,
            ),

            _label('Event Start Date'),

            _dateField(
              date: startDate,
              onTap: () => _selectDate(true),
            ),

            _label('Event End Date'),

            _dateField(
              date: endDate,
              onTap: () => _selectDate(false),
            ),

            const SizedBox(height: 25),

            SizedBox(
              width: double.infinity,
              height: 50,

              child: ElevatedButton(
                onPressed: _scheduleEvent,

                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                  elevation: 5,

                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(10),
                  ),
                ),

                child: const Text(
                  'Schedule Event',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _label(String text) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 15,
        bottom: 8,
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _field({
    required TextEditingController controller,
    required String hint,
    TextInputType? keyboardType,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,

      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.white,

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  Widget _dateField({
    required DateTime? date,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,

      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 17,
        ),

        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.grey.shade400,
          ),
          borderRadius:
              BorderRadius.circular(10),
        ),

        child: Row(
          children: [
            const Icon(
              Icons.calendar_month,
              color: Colors.orange,
            ),

            const SizedBox(width: 10),

            Text(
              date == null
                  ? 'Select date'
                  : '${date.day}/${date.month}/${date.year}',
              style: TextStyle(
                color: date == null
                    ? Colors.grey
                    : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}