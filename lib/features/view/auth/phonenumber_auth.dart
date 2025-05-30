import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PhoneWithPasswordScreen extends StatefulWidget {
  @override
  _PhoneWithPasswordScreenState createState() =>
      _PhoneWithPasswordScreenState();
}

class _PhoneWithPasswordScreenState extends State<PhoneWithPasswordScreen> {
  final _phoneController = TextEditingController();
  final _otpController = TextEditingController();
  final _passwordController = TextEditingController();

  String _verificationId = '';
  bool _codeSent = false;

  Future<void> _verifyPhoneNumber() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: _phoneController.text.trim(),
      timeout: const Duration(seconds: 60),
      verificationCompleted: (PhoneAuthCredential credential) async {
        // Auto sign-in for some phones
        await FirebaseAuth.instance.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        print("❌ Verification failed: ${e.message}");
      },
      codeSent: (String verificationId, int? resendToken) {
        setState(() {
          _codeSent = true;
          _verificationId = verificationId;
        });
        print("📲 Code sent");
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        _verificationId = verificationId;
      },
    );
  }

  Future<void> _verifyOtpAndSendPassword() async {
    try {
      final credential = PhoneAuthProvider.credential(
        verificationId: _verificationId,
        smsCode: _otpController.text.trim(),
      );

      final userCredential = await FirebaseAuth.instance.signInWithCredential(
        credential,
      );
      final idToken = await userCredential.user?.getIdToken();

      if (idToken != null) {
        await _sendToBackend(idToken);
      }
    } catch (e) {
      print("❌ Invalid OTP or Auth error: $e");
    }
  }

  Future<void> _sendToBackend(String idToken) async {
    final response = await http.post(
      Uri.parse(
        'http://192.168.1.76:3002/auth/phone-register',
      ), // or /phone-login
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'idToken': idToken,
        'password': _passwordController.text.trim(),
      }),
    );

    print("📡 Backend response: ${response.body}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Phone + Password")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(labelText: "Phone Number (+977...)"),
            ),
            if (_codeSent) ...[
              TextField(
                controller: _otpController,
                decoration: InputDecoration(labelText: "Enter OTP"),
              ),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: "Password"),
                obscureText: true,
              ),
            ],
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: !_codeSent
                  ? _verifyPhoneNumber
                  : _verifyOtpAndSendPassword,
              child: Text(!_codeSent ? "Send OTP" : "Submit Password"),
            ),
          ],
        ),
      ),
    );
  }
}
