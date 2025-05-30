import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart'
    show
        AuthCredential,
        GoogleAuthProvider,
        UserCredential,
        FirebaseAuth,
        User,
        PhoneAuthCredential,
        FirebaseAuthException,
        PhoneAuthProvider;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart'
    show GoogleSignIn, GoogleSignInAccount, GoogleSignInAuthentication;
import 'package:http/http.dart' as http show post;

class AuthController extends GetxController {
  final phoneController = TextEditingController();

  final passwordController = TextEditingController();

  static const String webClientId =
      '370316593446-3drhrar3o828tfgp7el6m73tqte7npcb.apps.googleusercontent.com';
  var user = Rxn<User>();
  String _verificationId = '';
  bool _codeSent = false;
  final List<TextEditingController> otpController = List.generate(
    6,
    (index) => TextEditingController(),
  );

  var isLoading = false.obs;

  Future<void> signInWithGoogle() async {
    try {
      isLoading.value = true;
      final GoogleSignIn _googleSignIn = GoogleSignIn(
        scopes: ['email'],
        serverClientId: webClientId,
      );

      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        print("❌ User cancelled the sign-in flow");
        return;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential = await FirebaseAuth.instance
          .signInWithCredential(credential);

      final firebaseUser = userCredential.user;

      user.value = firebaseUser;

      final idToken = await firebaseUser?.getIdToken();

      print("✅ Firebase ID Token: $idToken");

      print(otpController);

      Navigator.pushNamed(Get.context!, '/dashboard');

      final response = await http.post(
        Uri.parse('http://192.168.1.76:3002/auth/google/token'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'idToken': idToken}),
      );

      print('🔁 Backend response: ${response.body}');
    } catch (e) {
      print("🔥 Error during Google Sign-In: $e");
    } finally {
      isLoading.value = false; // ✅ Stop loading (always runs)
    }
  }

  Future<void> signOut() async {
    await GoogleSignIn().signOut();
    await FirebaseAuth.instance.signOut();

    user.value = null;
  }

  Future<void> verifyPhoneNumber() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneController.text.trim(),
      timeout: const Duration(seconds: 60),
      verificationCompleted: (PhoneAuthCredential credential) async {
        // Auto sign-in for some phones
        await FirebaseAuth.instance.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        print("❌ Verification failed: ${e.message}");
      },
      codeSent: (String verificationId, int? resendToken) {
        _codeSent = true;
        _verificationId = verificationId;

        print("📲 Code sent");
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        _verificationId = verificationId;
      },
    );
    Navigator.pushNamed(Get.context!, "/otpScreen");
  }

  Future<void> verifyOtpAndSendPassword() async {
    try {
      isLoading.value = true;
      final credential = PhoneAuthProvider.credential(
        verificationId: _verificationId,
        smsCode: otpController.map((c) => c.text.trim()).join(),
      );

      final userCredential = await FirebaseAuth.instance.signInWithCredential(
        credential,
      );
      final idToken = await userCredential.user?.getIdToken();

      if (idToken != null) {
        await _sendToBackend(idToken);
      }
      print(otpController);

      Navigator.pushNamed(Get.context!, "/dashboard");
    } catch (e) {
      print(otpController.map((c) => c.text.trim()).join());

      print("❌ Invalid OTP or Auth error: $e");
    } finally {
      isLoading.value = false;
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
        'password': passwordController.text.trim(),
      }),
    );

    print("📡 Backend response: ${response.body}");
  }
}
