import 'package:flutter/material.dart';
import 'package:travo/features/view/notification_screen.dart'
    show NotificationScreen;

class CurrencyExchangeScreen extends StatefulWidget {
  @override
  _CurrencyExchangeScreenState createState() => _CurrencyExchangeScreenState();
}

class _CurrencyExchangeScreenState extends State<CurrencyExchangeScreen> {
  double fromAmount = 2500;
  String fromCurrency = 'NPR';
  String toCurrency = 'INR';
  double toAmount = 34050;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F9FA),
      appBar: AppBar(
        title: Text(
          'Currency Exchange',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        fromCurrency,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: TextFormField(
                          initialValue: fromAmount.toString(),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                          decoration: InputDecoration(border: InputBorder.none),
                        ),
                      ),
                      SizedBox(width: 16),
                      DropdownButton<String>(
                        value: fromCurrency,
                        underline: SizedBox(),
                        items: ['NPR', 'USD', 'INR'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            fromCurrency = newValue!;
                          });
                        },
                      ),
                    ],
                  ),
                  Divider(height: 40),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color(0xFFFF5722),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.swap_vert, color: Colors.white),
                  ),
                  Divider(height: 40),
                  Row(
                    children: [
                      Text(
                        toCurrency,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Text(
                          toAmount.toStringAsFixed(0),
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFFF5722),
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      DropdownButton<String>(
                        value: toCurrency,
                        underline: SizedBox(),
                        items: ['INR', 'USD', 'NPR'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            toCurrency = newValue!;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Container(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Currency exchanged successfully!')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFFF5722),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: Text(
                  'Exchange',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            Row(
              children: [
                Expanded(
                  child: _buildCurrencySettingCard(
                    'Select Language',
                    'Nepal',
                    true,
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: _buildCurrencySettingCard(
                    'Select Currency',
                    'Nepal',
                    false,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            _buildNotificationButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildCurrencySettingCard(
    String title,
    String selected,
    bool isLanguage,
  ) {
    return Container(
      height: 120,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 12),
          _buildCurrencyOption('Nepal', selected == 'Nepal', Colors.orange),
          _buildCurrencyOption(
            isLanguage ? 'USA (USD)' : 'USA (USD)',
            false,
            Colors.blue,
          ),
          _buildCurrencyOption('India (INR)', false, Colors.green),
        ],
      ),
    );
  }

  Widget _buildCurrencyOption(String name, bool isSelected, Color color) {
    return Container(
      margin: EdgeInsets.only(bottom: 4),
      child: Row(
        children: [
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              name,
              style: TextStyle(
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                color: isSelected ? Colors.black : Colors.grey[600],
              ),
            ),
          ),
          if (isSelected)
            Icon(Icons.check_circle, size: 16, color: Color(0xFFFF5722)),
        ],
      ),
    );
  }

  Widget _buildNotificationButton() {
    return Container(
      width: double.infinity,
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NotificationScreen()),
            );
          },
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                Icon(Icons.notifications, color: Color(0xFFFF5722)),
                SizedBox(width: 16),
                Text(
                  'View Notifications',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                Spacer(),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: Colors.grey[400],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
