import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travo/features/view/auth/controller/auth_controller.dart';
import 'package:travo/features/view/auth/widgets/character.dart';

class OTPScreen extends StatefulWidget {
  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> with TickerProviderStateMixin {
  final AuthController _controller = Get.find();
  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());
  late AnimationController _animationController;
  int _seconds = 120;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: _seconds),
    )..forward();
    _startTimer();
  }

  void _startTimer() {
    Future.delayed(Duration(seconds: 1), () {
      if (mounted && _seconds > 0) {
        setState(() {
          _seconds--;
        });
        _startTimer();
      }
    });
  }

  String get _enteredOtp =>
      _controller.otpController.map((c) => c.text.trim()).join();

  @override
  void dispose() {
    _animationController.dispose();
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final timerText =
        '${_seconds ~/ 60}:${(_seconds % 60).toString().padLeft(2, '0')}';

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('OTP Verification', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Illustration
              Container(
                height: 150,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 100,
                      height: 140,
                      decoration: BoxDecoration(
                        color: Color(0xFFFF6B35),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.lock, color: Colors.white, size: 30),
                          SizedBox(height: 8),
                          Text('OTP', style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                    Positioned(
                      left: 10,
                      bottom: 0,
                      child: SizedBox(
                        width: 50,
                        height: 70,
                        child: CustomPaint(painter: CharacterPainter()),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 32),
              Text(
                'Enter the 6-digit code',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text('Sent to your phone number', textAlign: TextAlign.center),
              SizedBox(height: 24),

              // OTP fields
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(6, (index) {
                  return Container(
                    width: 45,
                    height: 60,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFFE2E8F0)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextField(
                      controller: _controller.otpController[index],
                      focusNode: _focusNodes[index],
                      textAlign: TextAlign.center,
                      maxLength: 1,
                      keyboardType: TextInputType.number,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: InputDecoration(
                        counterText: '',
                        border: InputBorder.none,
                      ),
                      onChanged: (value) {
                        if (value.isNotEmpty && index < 5) {
                          _focusNodes[index + 1].requestFocus();
                        } else if (value.isEmpty && index > 0) {
                          _focusNodes[index - 1].requestFocus();
                        }
                      },
                    ),
                  );
                }),
              ),

              SizedBox(height: 20),
              Text(
                'Code expires in: $timerText',
                style: TextStyle(color: Color(0xFFFF6B35)),
              ),
              SizedBox(height: 16),

              Obx(
                () => _controller.isLoading.value
                    ? CircularProgressIndicator()
                    : SizedBox(
                        width: double.infinity,
                        height: 52,
                        child: ElevatedButton(
                          onPressed: () {
                            _controller.verifyOtpAndSendPassword();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFFF6B35),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text('Verify'),
                        ),
                      ),
              ),

              SizedBox(height: 16),
              TextButton(
                onPressed: _seconds == 0
                    ? () => _controller.verifyPhoneNumber()
                    : null,
                child: Text(
                  'Resend Code',
                  style: TextStyle(
                    color: _seconds == 0 ? Color(0xFFFF6B35) : Colors.grey,
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
