import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travo/features/view/auth/controller/auth_controller.dart'
    show AuthController;
import 'package:travo/features/view/auth/login_with_phone.dart'
    show PhoneLoginScreen;
import 'package:travo/features/view/auth/widgets/character.dart'
    show CharacterPainter;

class LoginScreen extends StatelessWidget {
  final _controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              SizedBox(height: 60),
              // Illustration
              Container(
                height: 200,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Isometric phone illustration
                    Container(
                      width: 120,
                      height: 160,
                      decoration: BoxDecoration(
                        color: Color(0xFF2D3748),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 20,
                            offset: Offset(0, 10),
                          ),
                        ],
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            top: 20,
                            left: 15,
                            right: 15,
                            child: Container(
                              height: 80,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 20,
                            left: 15,
                            right: 15,
                            child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                color: Color(0xFFFF6B35),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Character illustration
                    Positioned(
                      right: 20,
                      bottom: 20,
                      child: Container(
                        width: 60,
                        height: 80,
                        child: CustomPaint(painter: CharacterPainter()),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 40),

              // Welcome text
              Text(
                'Welcome to TravelPlace',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2D3748),
                ),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 8),

              Text(
                'Log in with our awesome features to trip easily',
                style: TextStyle(fontSize: 14, color: Color(0xFF718096)),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 40),

              // Social login buttons
              Obx(
                () => _buildSocialButton(
                  context,
                  _controller.isLoading.value
                      ? 'Loading...'
                      : 'Continue with Google',
                  'assets/google_icon.png', // You'll need to add this asset
                  Colors.white,
                  Color(0xFF2D3748),
                  () {
                    _controller.signInWithGoogle();
                  },
                ),
              ),

              SizedBox(height: 16),

              _buildSocialButton(
                context,
                'Continue with Facebook',
                'assets/facebook_icon.png', // You'll need to add this asset
                Color(0xFF1877F2),
                Colors.white,
                () {},
              ),

              SizedBox(height: 32),

              // Phone number option
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => PhoneLoginScreen()),
                ),
                child: Text(
                  'Continue as phone number',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF718096),
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),

              Spacer(),

              // Bottom buttons
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => PhoneLoginScreen()),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFFF6B35),
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Color(0xFF2D3748),
                        padding: EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        side: BorderSide(color: Color(0xFFE2E8F0)),
                      ),
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSocialButton(
    BuildContext context,
    String text,
    String iconPath,
    Color backgroundColor,
    Color textColor,
    VoidCallback onPressed,
  ) {
    return Container(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: backgroundColor == Colors.white
                ? BorderSide(color: Color(0xFFE2E8F0))
                : BorderSide.none,
          ),
          elevation: 0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon placeholder (you can replace with actual icons)
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: text.contains('Google') ? Colors.red : Color(0xFF1877F2),
                shape: BoxShape.circle,
              ),
              child: Icon(
                text.contains('Google') ? Icons.g_mobiledata : Icons.facebook,
                color: Colors.white,
                size: 16,
              ),
            ),
            SizedBox(width: 12),
            Text(
              text,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
