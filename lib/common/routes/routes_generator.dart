import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show Scaffold;
import 'package:get/get.dart';
import 'package:travo/features/view/auth/otp_screen.dart';
import 'package:travo/features/view/booking_confirm_screen.dart';
import 'package:travo/features/view/calender_screen.dart';
import 'package:travo/features/view/dashboard/dashboard.dart';
import 'package:travo/features/view/details_screen.dart' show DetailsScreen;
import 'package:travo/features/view/notification_screen.dart';
import 'package:travo/features/view/profile_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/detailsScreen':
        return GetPageRoute(
          page: () => DetailsScreen(),
          transition: Transition.cupertino,
          transitionDuration: Duration(milliseconds: 400),
        );
      case '/profileScreen':
        return GetPageRoute(
          page: () => ProfileScreen(),
          transition: Transition.cupertino,
          transitionDuration: Duration(milliseconds: 400),
        );
      case '/notificationScreen':
        return GetPageRoute(
          page: () => NotificationScreen(),
          transition: Transition.cupertino,
          transitionDuration: Duration(milliseconds: 400),
        );
      case '/calenderScreen':
        return GetPageRoute(
          page: () => CalendarScreen(),
          transition: Transition.cupertino,
          transitionDuration: Duration(milliseconds: 400),
        );
      case '/confirmBookingScreen':
        return GetPageRoute(
          page: () => BookingConfirmationScreen(),
          transition: Transition.cupertino,
          transitionDuration: Duration(milliseconds: 400),
        );
      case '/dashboard':
        return GetPageRoute(
          page: () => Dashboard(),
          transition: Transition.cupertino,
          transitionDuration: Duration(milliseconds: 400),
        );
      case '/otpScreen':
        return GetPageRoute(
          page: () => OTPScreen(),
          transition: Transition.cupertino,
          transitionDuration: Duration(milliseconds: 400),
        );

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return GetPageRoute(
      page: () => const Scaffold(body: Center(child: Text("Error"))),
      transition: Transition.cupertino,
    );
  }
}
