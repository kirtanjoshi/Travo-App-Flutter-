import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F9FA),
      appBar: AppBar(
        title: Text(
          'Notification',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          _buildNotificationCard(
            'Booking for Trip Special Travel Offers',
            '10:30 AM',
            Color(0xFFFF5722).withOpacity(0.1),
            false,
          ),
          _buildNotificationCard(
            'Payment for Tour Adventure!',
            '02:30 PM',
            Colors.green.withOpacity(0.1),
            false,
          ),
          _buildNotificationCard(
            'Thank you for next Experience!',
            '08:30 AM',
            Colors.blue.withOpacity(0.1),
            false,
          ),
          _buildNotificationCard(
            'Would you like to Tour Destination',
            '12:30 PM',
            Colors.purple.withOpacity(0.1),
            true,
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationCard(
    String title,
    String time,
    Color backgroundColor,
    bool isNew,
  ) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
        border: isNew
            ? Border.all(color: Color(0xFFFF5722).withOpacity(0.3))
            : null,
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.notifications,
              color: Color(0xFFFF5722),
              size: 20,
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  time,
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
          if (isNew)
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: Color(0xFFFF5722),
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
    );
  }
}
