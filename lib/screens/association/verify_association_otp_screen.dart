import 'package:flutter/material.dart';
import '../socity_dashbord/community_selection_screen.dart';

class VerifyAssociationOtpScreen extends StatefulWidget {
  const VerifyAssociationOtpScreen({super.key});

  @override
  State<VerifyAssociationOtpScreen> createState() =>
      _VerifyAssociationOtpScreenState();
}

class _VerifyAssociationOtpScreenState
    extends State<VerifyAssociationOtpScreen> {
  final List<TextEditingController> _otpControllers =
      List.generate(
    6,
    (index) => TextEditingController(),
  );

  final List<FocusNode> _focusNodes = List.generate(
    6,
    (index) => FocusNode(),
  );

  void _verifyOtp() {
    bool allFilled = _otpControllers.every(
      (controller) => controller.text.isNotEmpty,
    );

    if (!allFilled) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter the complete OTP'),
        ),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            const CommunitySelectionScreen(),
      ),
    );
  }

  void _onOtpChanged(String value, int index) {
    if (value.isNotEmpty && index < 5) {
      _focusNodes[index + 1].requestFocus();
    }

    if (value.isEmpty && index > 0) {
      _focusNodes[index - 1].requestFocus();
    }
  }

  @override
  void dispose() {
    for (final controller in _otpControllers) {
      controller.dispose();
    }

    for (final focusNode in _focusNodes) {
      focusNode.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify OTP'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const SizedBox(height: 50),

              const Text(
                'Verify OTP',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),

              const Text(
                'We have sent OTP on your email',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 40),

              // OTP Boxes
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                children: List.generate(
                  6,
                  (index) {
                    return SizedBox(
                      width: 45,
                      height: 55,
                      child: TextField(
                        controller:
                            _otpControllers[index],
                        focusNode: _focusNodes[index],
                        keyboardType:
                            TextInputType.number,
                        textAlign: TextAlign.center,
                        maxLength: 1,
                        onChanged: (value) {
                          _onOtpChanged(
                            value,
                            index,
                          );
                        },
                        decoration: InputDecoration(
                          counterText: '',
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(8),
                            borderSide:
                                const BorderSide(
                              color: Colors.orange,
                              width: 2,
                            ),
                          ),
                          enabledBorder:
                              OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(8),
                            borderSide:
                                const BorderSide(
                              color: Colors.orange,
                              width: 2,
                            ),
                          ),
                          focusedBorder:
                              OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(8),
                            borderSide:
                                const BorderSide(
                              color: Colors.orange,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 20),

              // Resend
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(
                      const SnackBar(
                        content: Text('OTP resent'),
                      ),
                    );
                  },
                  child: const Text(
                    'Resend',
                    style: TextStyle(
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // Verify Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _verifyOtp,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text(
                    'Verify and Continue',
                    style: TextStyle(
                      fontSize: 16,
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
}