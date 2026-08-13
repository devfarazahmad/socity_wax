import 'package:flutter/material.dart';
import 'member_registration_personal_screen.dart';

class MemberRegistrationLocationScreen extends StatefulWidget {
  const MemberRegistrationLocationScreen({super.key});

  @override
  State<MemberRegistrationLocationScreen> createState() =>
      _MemberRegistrationLocationScreenState();
}

class _MemberRegistrationLocationScreenState
    extends State<MemberRegistrationLocationScreen> {
  String? selectedCountry;

  final TextEditingController _stateController =
      TextEditingController();

  final TextEditingController _pincodeController =
      TextEditingController();

  final List<String> countries = [
    'Afghanistan',
    'Albania',
    'Algeria',
    'Andorra',
    'Angola',
    'Argentina',
    'Armenia',
    'Australia',
    'Austria',
    'Azerbaijan',
    'Bangladesh',
    'Belgium',
    'Brazil',
    'Canada',
    'China',
    'Denmark',
    'Egypt',
    'Finland',
    'France',
    'Germany',
    'Greece',
    'India',
    'Indonesia',
    'Iran',
    'Iraq',
    'Ireland',
    'Italy',
    'Japan',
    'Jordan',
    'Kazakhstan',
    'Kenya',
    'Kuwait',
    'Malaysia',
    'Maldives',
    'Mexico',
    'Netherlands',
    'New Zealand',
    'Nigeria',
    'Norway',
    'Oman',
    'Pakistan',
    'Palestine',
    'Qatar',
    'Russia',
    'Saudi Arabia',
    'Singapore',
    'South Africa',
    'South Korea',
    'Spain',
    'Sri Lanka',
    'Sweden',
    'Switzerland',
    'Thailand',
    'Turkey',
    'Ukraine',
    'United Arab Emirates',
    'United Kingdom',
    'United States',
    'Vietnam',
    'Yemen',
    'Zimbabwe',
  ];

  void _nextStep() {
    if (selectedCountry == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select your country'),
        ),
      );
      return;
    }

    if (_stateController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter your state'),
        ),
      );
      return;
    }

    if (_pincodeController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter your pincode'),
        ),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            const MemberRegistrationPersonalScreen(),
      ),
    );
  }

  @override
  void dispose() {
    _stateController.dispose();
    _pincodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Member Registration'),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              // Registration Steps
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _stepCircle(
                    number: '1',
                    title: 'Location',
                  ),

                  const SizedBox(width: 60),

                  _stepCircle(
                    number: '2',
                    title: 'Personal',
                  ),
                ],
              ),

              const SizedBox(height: 45),

              // Country
              const Text(
                'Country',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 8),

              DropdownButtonFormField<String>(
                value: selectedCountry,
                isExpanded: true,

                decoration: InputDecoration(
                  hintText: 'Select Country',

                  prefixIcon: const Icon(
                    Icons.public,
                  ),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),

                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                    ),
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.orange,
                      width: 2,
                    ),
                  ),
                ),

                items: countries.map((country) {
                  return DropdownMenuItem<String>(
                    value: country,
                    child: Text(country),
                  );
                }).toList(),

                onChanged: (value) {
                  setState(() {
                    selectedCountry = value;
                  });
                },
              ),

              const SizedBox(height: 20),

              // State
              const Text(
                'State',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 8),

              TextField(
                controller: _stateController,

                decoration: InputDecoration(
                  hintText: 'Enter your state',

                  prefixIcon: const Icon(
                    Icons.location_on_outlined,
                  ),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),

                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                    ),
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.orange,
                      width: 2,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Pincode
              const Text(
                'Pincode',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 8),

              TextField(
                controller: _pincodeController,

                keyboardType: TextInputType.number,

                decoration: InputDecoration(
                  hintText: 'Enter your pincode',

                  prefixIcon: const Icon(
                    Icons.pin_drop_outlined,
                  ),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),

                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                    ),
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.orange,
                      width: 2,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 35),

              // Next Step Button
              SizedBox(
                width: double.infinity,
                height: 50,

                child: ElevatedButton(
                  onPressed: _nextStep,

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.white,

                    elevation: 5,

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),

                  child: const Text(
                    'Next Step',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _stepCircle({
    required String number,
    required String title,
  }) {
    return Column(
      children: [
        Container(
          width: 50,
          height: 50,

          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.orange,
          ),

          child: Center(
            child: Text(
              number,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),

        const SizedBox(height: 8),

        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}