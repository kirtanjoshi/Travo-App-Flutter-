// import 'package:flutter/material.dart';
//
// class AuthNavigator extends StatefulWidget {
//   @override
//   _AuthNavigatorState createState() => _AuthNavigatorState();
// }
//
// class _AuthNavigatorState extends State<AuthNavigator> {
//   int _currentIndex = 0;
//   final PageController _pageController = PageController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: PageView(
//         controller: _pageController,
//         onPageChanged: (index) {
//           setState(() {
//             _currentIndex = index;
//           });
//         },
//         children: [LoginPage(), MobileLoginPage(), SignUpPage()],
//       ),
//       bottomNavigationBar: Container(
//         padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextButton(
//               onPressed: () {
//                 _pageController.animateToPage(
//                   0,
//                   duration: Duration(milliseconds: 300),
//                   curve: Curves.easeInOut,
//                 );
//               },
//               child: Text(
//                 'Login',
//                 style: TextStyle(
//                   color: _currentIndex == 0 ? Colors.orange : Colors.grey,
//                 ),
//               ),
//             ),
//             SizedBox(width: 20),
//             TextButton(
//               onPressed: () {
//                 _pageController.animateToPage(
//                   1,
//                   duration: Duration(milliseconds: 300),
//                   curve: Curves.easeInOut,
//                 );
//               },
//               child: Text(
//                 'Mobile',
//                 style: TextStyle(
//                   color: _currentIndex == 1 ? Colors.orange : Colors.grey,
//                 ),
//               ),
//             ),
//             SizedBox(width: 20),
//             TextButton(
//               onPressed: () {
//                 _pageController.animateToPage(
//                   2,
//                   duration: Duration(milliseconds: 300),
//                   curve: Curves.easeInOut,
//                 );
//               },
//               child: Text(
//                 'Sign Up',
//                 style: TextStyle(
//                   color: _currentIndex == 2 ? Colors.orange : Colors.grey,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//   bool _rememberMe = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 24),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(height: 60),
//
//               // Illustration
//               Center(
//                 child: Container(
//                   width: 200,
//                   height: 150,
//                   decoration: BoxDecoration(
//                     color: Colors.orange.shade50,
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   child: Stack(
//                     alignment: Alignment.center,
//                     children: [
//                       Icon(Icons.phone_android, size: 60, color: Colors.orange),
//                       Positioned(
//                         right: 40,
//                         top: 30,
//                         child: Container(
//                           width: 40,
//                           height: 40,
//                           decoration: BoxDecoration(
//                             color: Colors.orange.shade100,
//                             shape: BoxShape.circle,
//                           ),
//                           child: Icon(Icons.person, color: Colors.orange),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//
//               SizedBox(height: 40),
//
//               // Welcome text
//               Text(
//                 'Welcome to TerraPhone',
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black87,
//                 ),
//               ),
//
//               SizedBox(height: 40),
//
//               // Login options
//               _buildLoginOption(
//                 icon: Icons.language,
//                 text: 'Continue with Google',
//                 onTap: () {},
//               ),
//
//               SizedBox(height: 16),
//
//               _buildLoginOption(
//                 icon: Icons.facebook,
//                 text: 'Continue with Facebook',
//                 onTap: () {},
//               ),
//
//               SizedBox(height: 16),
//
//               _buildLoginOption(
//                 icon: Icons.email_outlined,
//                 text: 'Continue with email/phone',
//                 onTap: () {},
//               ),
//
//               SizedBox(height: 30),
//
//               // Sign up button
//               SizedBox(
//                 width: double.infinity,
//                 height: 50,
//                 child: ElevatedButton(
//                   onPressed: () {},
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.orange,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(25),
//                     ),
//                     elevation: 0,
//                   ),
//                   child: Text(
//                     'SIGN UP',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 16,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                 ),
//               ),
//
//               SizedBox(height: 20),
//
//               // Sign in button
//               SizedBox(
//                 width: double.infinity,
//                 height: 50,
//                 child: OutlinedButton(
//                   onPressed: () {},
//                   style: OutlinedButton.styleFrom(
//                     side: BorderSide.none,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(25),
//                     ),
//                   ),
//                   child: Text(
//                     'SIGN IN',
//                     style: TextStyle(
//                       color: Colors.orange,
//                       fontSize: 16,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildLoginOption({
//     required IconData icon,
//     required String text,
//     required VoidCallback onTap,
//   }) {
//     return InkWell(
//       onTap: onTap,
//       child: Container(
//         padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//         decoration: BoxDecoration(
//           border: Border.all(color: Colors.grey.shade300),
//           borderRadius: BorderRadius.circular(8),
//         ),
//         child: Row(
//           children: [
//             Icon(icon, color: Colors.grey.shade600),
//             SizedBox(width: 16),
//             Text(text, style: TextStyle(fontSize: 16, color: Colors.black87)),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class MobileLoginPage extends StatefulWidget {
//   @override
//   _MobileLoginPageState createState() => _MobileLoginPageState();
// }
//
// class _MobileLoginPageState extends State<MobileLoginPage> {
//   final TextEditingController _phoneController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 24),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(height: 60),
//
//               // Illustration
//               Center(
//                 child: Container(
//                   width: 120,
//                   height: 120,
//                   decoration: BoxDecoration(
//                     color: Colors.orange,
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   child: Icon(
//                     Icons.phone_android,
//                     size: 60,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//
//               SizedBox(height: 40),
//
//               // Welcome text
//               Center(
//                 child: Column(
//                   children: [
//                     Text(
//                       'Welcome Back !',
//                       style: TextStyle(
//                         fontSize: 24,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black87,
//                       ),
//                     ),
//                     SizedBox(height: 8),
//                     Text(
//                       'Sign in to your account',
//                       style: TextStyle(
//                         fontSize: 16,
//                         color: Colors.grey.shade600,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//
//               SizedBox(height: 40),
//
//               // Phone number input
//               Text(
//                 'Phone Number',
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.w500,
//                   color: Colors.black87,
//                 ),
//               ),
//               SizedBox(height: 8),
//               Container(
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.grey.shade300),
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: Row(
//                   children: [
//                     Container(
//                       padding: EdgeInsets.symmetric(
//                         horizontal: 12,
//                         vertical: 16,
//                       ),
//                       child: Text(
//                         '+977',
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                     ),
//                     Container(
//                       width: 1,
//                       height: 30,
//                       color: Colors.grey.shade300,
//                     ),
//                     Expanded(
//                       child: TextField(
//                         controller: _phoneController,
//                         keyboardType: TextInputType.phone,
//                         decoration: InputDecoration(
//                           hintText: 'Enter your phone number',
//                           border: InputBorder.none,
//                           contentPadding: EdgeInsets.symmetric(
//                             horizontal: 12,
//                             vertical: 16,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//
//               SizedBox(height: 24),
//
//               // Password input
//               Text(
//                 'Password',
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.w500,
//                   color: Colors.black87,
//                 ),
//               ),
//               SizedBox(height: 8),
//               TextField(
//                 obscureText: true,
//                 decoration: InputDecoration(
//                   hintText: '••••••••',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(8),
//                     borderSide: BorderSide(color: Colors.grey.shade300),
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(8),
//                     borderSide: BorderSide(color: Colors.grey.shade300),
//                   ),
//                   contentPadding: EdgeInsets.symmetric(
//                     horizontal: 12,
//                     vertical: 16,
//                   ),
//                 ),
//               ),
//
//               SizedBox(height: 30),
//
//               // Login button
//               SizedBox(
//                 width: double.infinity,
//                 height: 50,
//                 child: ElevatedButton(
//                   onPressed: () {},
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.orange,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(25),
//                     ),
//                     elevation: 0,
//                   ),
//                   child: Text(
//                     'LOGIN',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 16,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                 ),
//               ),
//
//               SizedBox(height: 20),
//
//               // Don't have account
//               Center(
//                 child: TextButton(
//                   onPressed: () {},
//                   child: Text(
//                     "Don't have an account? Sign up",
//                     style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class SignUpPage extends StatefulWidget {
//   @override
//   _SignUpPageState createState() => _SignUpPageState();
// }
//
// class _SignUpPageState extends State<SignUpPage> {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _phoneController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _confirmPasswordController =
//       TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: EdgeInsets.symmetric(horizontal: 24),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(height: 40),
//
//               // Back button and illustration
//               Row(
//                 children: [
//                   IconButton(
//                     onPressed: () {},
//                     icon: Icon(Icons.arrow_back_ios, color: Colors.black54),
//                   ),
//                   Expanded(
//                     child: Center(
//                       child: Container(
//                         width: 80,
//                         height: 80,
//                         decoration: BoxDecoration(
//                           color: Colors.orange.shade50,
//                           borderRadius: BorderRadius.circular(16),
//                         ),
//                         child: Stack(
//                           alignment: Alignment.center,
//                           children: [
//                             Icon(
//                               Icons.person_add,
//                               size: 40,
//                               color: Colors.orange,
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(width: 48), // Balance the back button
//                 ],
//               ),
//
//               SizedBox(height: 30),
//
//               // Title
//               Center(
//                 child: Column(
//                   children: [
//                     Text(
//                       "Let's Get Started",
//                       style: TextStyle(
//                         fontSize: 24,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black87,
//                       ),
//                     ),
//                     SizedBox(height: 8),
//                     Text(
//                       'Create an account to continue',
//                       style: TextStyle(
//                         fontSize: 16,
//                         color: Colors.grey.shade600,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//
//               SizedBox(height: 40),
//
//               // Email input
//               _buildInputField(
//                 label: 'Email',
//                 controller: _emailController,
//                 hintText: 'Enter your email',
//                 keyboardType: TextInputType.emailAddress,
//               ),
//
//               SizedBox(height: 20),
//
//               // Phone input
//               Text(
//                 'Phone Number',
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.w500,
//                   color: Colors.black87,
//                 ),
//               ),
//               SizedBox(height: 8),
//               Container(
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.grey.shade300),
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: Row(
//                   children: [
//                     Container(
//                       padding: EdgeInsets.symmetric(
//                         horizontal: 12,
//                         vertical: 16,
//                       ),
//                       decoration: BoxDecoration(
//                         border: Border(
//                           right: BorderSide(color: Colors.grey.shade300),
//                         ),
//                       ),
//                       child: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           Text('🇳🇵', style: TextStyle(fontSize: 20)),
//                           SizedBox(width: 4),
//                           Text(
//                             '+977',
//                             style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                           Icon(Icons.keyboard_arrow_down, color: Colors.grey),
//                         ],
//                       ),
//                     ),
//                     Expanded(
//                       child: TextField(
//                         controller: _phoneController,
//                         keyboardType: TextInputType.phone,
//                         decoration: InputDecoration(
//                           hintText: 'Phone Number',
//                           border: InputBorder.none,
//                           contentPadding: EdgeInsets.symmetric(
//                             horizontal: 12,
//                             vertical: 16,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//
//               SizedBox(height: 20),
//
//               // Password input
//               _buildInputField(
//                 label: 'Password',
//                 controller: _passwordController,
//                 hintText: '••••••••',
//                 obscureText: true,
//               ),
//
//               SizedBox(height: 20),
//
//               // Confirm Password input
//               _buildInputField(
//                 label: 'Confirm Password',
//                 controller: _confirmPasswordController,
//                 hintText: '••••••••',
//                 obscureText: true,
//               ),
//
//               SizedBox(height: 40),
//
//               // Sign up button
//               SizedBox(
//                 width: double.infinity,
//                 height: 50,
//                 child: ElevatedButton(
//                   onPressed: () {},
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.orange,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(25),
//                     ),
//                     elevation: 0,
//                   ),
//                   child: Text(
//                     'CREATE ACCOUNT',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 16,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                 ),
//               ),
//
//               SizedBox(height: 20),
//
//               // Already have account
//               Center(
//                 child: TextButton(
//                   onPressed: () {},
//                   child: Text(
//                     'Already have an account? Sign in',
//                     style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
//                   ),
//                 ),
//               ),
//
//               SizedBox(height: 20),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildInputField({
//     required String label,
//     required TextEditingController controller,
//     required String hintText,
//     bool obscureText = false,
//     TextInputType keyboardType = TextInputType.text,
//   }) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label,
//           style: TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.w500,
//             color: Colors.black87,
//           ),
//         ),
//         SizedBox(height: 8),
//         TextField(
//           controller: controller,
//           obscureText: obscureText,
//           keyboardType: keyboardType,
//           decoration: InputDecoration(
//             hintText: hintText,
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(8),
//               borderSide: BorderSide(color: Colors.grey.shade300),
//             ),
//             enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(8),
//               borderSide: BorderSide(color: Colors.grey.shade300),
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(8),
//               borderSide: BorderSide(color: Colors.orange, width: 2),
//             ),
//             contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
//           ),
//         ),
//       ],
//     );
//   }
// }
