import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                _buildHeader(context),
                SizedBox(height: 20),

                // Logo
                _buildLogo(),
                SizedBox(height: 20),

                // Search Bar
                _buildSearchBar(),
                SizedBox(height: 24),

                // Category Icons
                _buildCategoryIcons(),
                SizedBox(height: 32),

                // Top Packages
                _buildTopPackages(context),
                SizedBox(height: 32),

                // Top Activities
                _buildTopActivities(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Namaste 🙏',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            Text(
              'kirtan joshi',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ],
        ),
        Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed("/notificationScreen");
              },
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Icon(
                  Icons.notifications_outlined,
                  color: Colors.red,
                  size: 20,
                ),
              ),
            ),
            SizedBox(width: 12),
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed("/profileScreen");
              },
              child: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.grey[300],
                child: Text('🐼', style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildLogo() {
    return Center(
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Image.asset("assets/images/logo.png", width: 40, height: 40),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'TourPlace',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                  Text(
                    'EXPLORE THE WORLD',
                    style: TextStyle(
                      fontSize: 10,
                      letterSpacing: 2,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(Icons.search, color: Colors.grey[500], size: 20),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              'Search any places...',
              style: TextStyle(color: Colors.grey[500], fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryIcons() {
    final categories = [
      {'icon': "🚶‍♂️", 'label': 'Activity', 'color': Colors.orange},
      {'icon': "✈️", 'label': 'Flights', 'color': Colors.blue},
      {'icon': "🚍", 'label': 'Bus', 'color': Colors.green},
      {'icon': "🚄", 'label': 'Trains', 'color': Colors.purple},
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: categories.map((category) {
        return Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              decoration: BoxDecoration(
                color: (category['color'] as Color).withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                category['icon'] as String,
                style: TextStyle(
                  color: category['color'] as Color,
                  fontSize: 30,
                ),
              ),
            ),
            SizedBox(height: 8),
            Text(
              category['label'] as String,
              style: TextStyle(fontSize: 12, color: Colors.grey[600]),
            ),
          ],
        );
      }).toList(),
    );
  }

  Widget _buildTopPackages(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Top Packages',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 16),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _buildPackageCard(
                'Mustang',
                'Nepal',
                '৳5/4d',
                4.9,
                'assets/mustang.jpg',
                context,
              ),
              SizedBox(width: 16),
              _buildPackageCard(
                'PachPokhari',
                'Nepal',
                '৳6/5d',
                4.8,
                'assets/pachpokhari.jpg',
                context,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPackageCard(
    String title,
    String location,
    String price,
    double rating,
    String imagePath,
    BuildContext context,
  ) {
    return InkWell(
      onTap: () => {Navigator.of(context).pushNamed("/detailsScreen")},
      child: Container(
        width: 250,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 140,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: title == 'Mustang'
                      ? [Colors.brown[200]!, Colors.brown[400]!]
                      : [Colors.green[200]!, Colors.green[400]!],
                ),
              ),
              child: Center(
                child: Icon(
                  title == 'Mustang' ? Icons.landscape : Icons.nature,
                  size: 48,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          Text(
                            location,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.red[50],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          price,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.red,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 16),
                      SizedBox(width: 4),
                      Text(
                        rating.toString(),
                        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopActivities() {
    final activities = [
      {'name': 'Paragliding', 'icon': '🪂', 'color': Colors.blue},
      {'name': 'Skydiving', 'icon': '🪂', 'color': Colors.orange},
      {'name': 'Boating', 'icon': '🚤', 'color': Colors.cyan},
      {'name': 'Hot Air Balloon', 'icon': '🎈', 'color': Colors.red},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Top Activities',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: activities.map((activity) {
            return Column(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: (activity['color'] as Color).withOpacity(0.2),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: (activity['color'] as Color).withOpacity(0.3),
                      width: 2,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      activity['icon'] as String,
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  activity['name'] as String,
                  style: TextStyle(fontSize: 10, color: Colors.grey[600]),
                  textAlign: TextAlign.center,
                ),
              ],
            );
          }).toList(),
        ),
      ],
    );
  }
}
