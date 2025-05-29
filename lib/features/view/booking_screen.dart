import 'package:flutter/material.dart';

class BookingScreen extends StatefulWidget {
  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  int selectedPeople = 1;
  String selectedRoom = 'Classic';
  String selectedTransport = 'Flight';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Booking Trip',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Date selection
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Icon(Icons.calendar_today, color: Colors.orange),
                    SizedBox(width: 12),
                    Text('From: 1 April'),
                    Spacer(),
                    Text('To: 5 April'),
                  ],
                ),
              ),

              SizedBox(height: 24),

              // People selection
              Text(
                'Select people in your group',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 8),
              Text('1 Person', style: TextStyle(color: Colors.grey[600])),
              SizedBox(height: 16),

              Row(
                children: [1, 2, 3]
                    .map(
                      (num) => GestureDetector(
                        onTap: () => setState(() => selectedPeople = num),
                        child: Container(
                          margin: EdgeInsets.only(right: 12),
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: selectedPeople == num
                                ? Colors.orange
                                : Colors.white,
                            border: Border.all(
                              color: selectedPeople == num
                                  ? Colors.orange
                                  : Colors.grey[300]!,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: Text(
                              '$num',
                              style: TextStyle(
                                color: selectedPeople == num
                                    ? Colors.white
                                    : Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),

              SizedBox(height: 24),

              // Room selection
              Text(
                'Select Room',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 8),
              Text(
                'Choose the appropriate room',
                style: TextStyle(color: Colors.grey[600]),
              ),
              SizedBox(height: 16),

              Row(
                children: [
                  Expanded(
                    child: _buildRoomOption('Classic', '1200 nights', true),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: _buildRoomOption('Deluxe', '2000 nights', false),
                  ),
                ],
              ),

              SizedBox(height: 24),

              // Transportation
              Text(
                'Select Transportation',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 16),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildTransportIcon(Icons.flight, 'Flight'),
                  _buildTransportIcon(Icons.directions_car, 'Car'),
                  _buildTransportIcon(Icons.directions_bus, 'Bus'),
                ],
              ),

              SizedBox(height: 24),

              // Travel Plan
              Text(
                'Travel Plan',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 16),

              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    _buildTravelPlanItem(
                      'Kathmandu to Pokhara',
                      '10 September',
                      '8 Hours',
                      true,
                    ),
                    SizedBox(height: 16),
                    _buildTravelPlanItem('Pokhara to Jomsom', '', '', false),
                  ],
                ),
              ),

              SizedBox(height: 32),

              // Bottom buttons
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          'Back',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          'Confirm',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRoomOption(String title, String price, bool isSelected) {
    return GestureDetector(
      onTap: () => setState(() => selectedRoom = title),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: isSelected ? Colors.orange : Colors.grey[300]!,
            width: isSelected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                SizedBox(width: 8),
                Text(title, style: TextStyle(fontWeight: FontWeight.w600)),
              ],
            ),
            SizedBox(height: 8),
            Text(
              price,
              style: TextStyle(color: Colors.grey[600], fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTransportIcon(IconData icon, String label) {
    bool isSelected = selectedTransport == label;
    return GestureDetector(
      onTap: () => setState(() => selectedTransport = label),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? Colors.orange : Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(
          icon,
          color: isSelected ? Colors.white : Colors.grey[600],
          size: 24,
        ),
      ),
    );
  }

  Widget _buildTravelPlanItem(
    String route,
    String date,
    String duration,
    bool isActive,
  ) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: isActive ? Colors.orange : Colors.grey[300],
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(route, style: TextStyle(fontWeight: FontWeight.w500)),
              if (date.isNotEmpty)
                Text(
                  '$date • $duration',
                  style: TextStyle(color: Colors.grey[600], fontSize: 12),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
