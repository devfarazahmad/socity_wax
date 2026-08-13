import 'package:flutter/material.dart';
import 'verify_otp_screen.dart';

class MemberRegistrationPersonalScreen extends StatefulWidget {
  const MemberRegistrationPersonalScreen({super.key});

  @override
  State<MemberRegistrationPersonalScreen> createState() =>
      _MemberRegistrationPersonalScreenState();
}

class _MemberRegistrationPersonalScreenState
    extends State<MemberRegistrationPersonalScreen> {
  bool _isPasswordHidden = true;

  final TextEditingController _nameController =
      TextEditingController();

  final TextEditingController _phoneController =
      TextEditingController();

  final TextEditingController _emailController =
      TextEditingController();

  final TextEditingController _passwordController =
      TextEditingController();

  void _sendOtp() {
    // Name validation
    if (_nameController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter your name'),
        ),
      );
      return;
    }

    // Phone validation
    if (_phoneController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter your phone number'),
        ),
      );
      return;
    }

    // Email validation
    if (_emailController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter your email'),
        ),
      );
      return;
    }

    // Password validation
    if (_passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter your password'),
        ),
      );
      return;
    }

    // Navigate to OTP screen
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const VerifyOtpScreen(),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();

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
                    completed: true,
                  ),

                  const SizedBox(width: 60),

                  _stepCircle(
                    number: '2',
                    title: 'Personal',
                    completed: false,
                  ),
                ],
              ),

              const SizedBox(height: 45),

              // Name
              const Text(
                'Name',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 8),

              TextField(
                controller: _nameController,

                textInputAction: TextInputAction.next,

                decoration: InputDecoration(
                  hintText: 'Enter your name',

                  prefixIcon: const Icon(
                    Icons.person_outline,
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

              // Phone
              const Text(
                'Phone',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 8),

              TextField(
                controller: _phoneController,

                keyboardType: TextInputType.phone,

                textInputAction: TextInputAction.next,

                decoration: InputDecoration(
                  hintText: 'Enter your phone number',

                  prefixIcon: const Icon(
                    Icons.phone_outlined,
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

              // Email
              const Text(
                'Email',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 8),

              TextField(
                controller: _emailController,

                keyboardType: TextInputType.emailAddress,

                textInputAction: TextInputAction.next,

                decoration: InputDecoration(
                  hintText: 'Enter your email',

                  prefixIcon: const Icon(
                    Icons.email_outlined,
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

              // Password
              const Text(
                'Password',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 8),

              TextField(
                controller: _passwordController,

                obscureText: _isPasswordHidden,

                textInputAction: TextInputAction.done,

                decoration: InputDecoration(
                  hintText: 'Enter your password',

                  prefixIcon: const Icon(
                    Icons.lock_outline,
                  ),

                  // Hide / Show Password
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _isPasswordHidden =
                            !_isPasswordHidden;
                      });
                    },

                    icon: Icon(
                      _isPasswordHidden
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
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

              // Send OTP Button
              SizedBox(
                width: double.infinity,
                height: 50,

                child: ElevatedButton(
                  onPressed: _sendOtp,

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.white,

                    elevation: 5,

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),

                  child: const Text(
                    'Send OTP',
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
    required bool completed,
  }) {
    return Column(
      children: [
        Container(
          width: 50,
          height: 50,

          decoration: BoxDecoration(
            shape: BoxShape.circle,

            color: completed
                ? Colors.green
                : Colors.orange,
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