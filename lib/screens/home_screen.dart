import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Welcome Back!', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Notifications logic
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.grey[200],
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Greeting Card
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.blue[50],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('assets/images/user_avatar.png'), // Replace with your image
                      ),
                      SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hi, Sarah!',
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 4),
                          Text('How can we assist you today?'),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),

                // Quick Actions
                Text(
                  'Quick Actions',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _quickActionButton(
                      icon: Icons.video_call,
                      label: 'Video Consult',
                      color: Colors.blue,
                      onPressed: () {
                        Navigator.pushNamed(context, '/video');
                      },
                    ),
                    _quickActionButton(
                      icon: Icons.book,
                      label: 'Resources',
                      color: Colors.green,
                      onPressed: () {
                        Navigator.pushNamed(context, '/education');
                      },
                    ),
                    _quickActionButton(
                      icon: Icons.person,
                      label: 'Profile',
                      color: Colors.orange,
                      onPressed: () {
                        Navigator.pushNamed(context, '/profile');
                      },
                    ),
                  ],
                ),
                SizedBox(height: 20),

                // Featured Section
                Text(
                  'Featured Services',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 12),
                Container(
                  height: 150,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _featuredServiceCard(
                        title: 'Mental Health',
                        image: 'assets/images/mental_health.png',
                        onPressed: () {
                          // Add navigation or functionality
                        },
                      ),
                      _featuredServiceCard(
                        title: 'Nutrition Advice',
                        image: 'assets/images/nutrition.png',
                        onPressed: () {
                          // Add navigation or functionality
                        },
                      ),
                      _featuredServiceCard(
                        title: 'Fitness Programs',
                        image: 'assets/images/fitness.png',
                        onPressed: () {
                          // Add navigation or functionality
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),

                // Health Tips
                Text(
                  'Daily Health Tip',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 12),
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.lightBlueAccent[100],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.health_and_safety, size: 40, color: Colors.blue[900]),
                      SizedBox(width: 16),
                      Expanded(
                        child: Text(
                          'Drink at least 8 glasses of water daily to stay hydrated and maintain optimal health!',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.greenAccent[100],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.local_florist, size: 40, color: Colors.green[900]),
                      SizedBox(width: 16),
                      Expanded(
                        child: Text(
                          'Get at least 30 minutes of physical activity every day to keep your body and mind healthy!',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.orangeAccent[100],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.sunny, size: 40, color: Colors.orange[900]),
                      SizedBox(width: 16),
                      Expanded(
                        child: Text(
                          'Spend some time outdoors to get enough vitamin D and improve your overall mood!',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue[900],
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.video_call), label: 'Consult'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Resources'),
        ],
        onTap: (index) {
          if (index == 1) {
            Navigator.pushNamed(context, '/video');
          } else if (index == 2) {
            Navigator.pushNamed(context, '/education');
          }
        },
      ),
    );
  }

  Widget _quickActionButton({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return Column(
      children: [
        GestureDetector(
          onTap: onPressed,
          child: CircleAvatar(
            radius: 30,
            backgroundColor: color.withOpacity(0.2),
            child: Icon(icon, size: 30, color: color),
          ),
        ),
        SizedBox(height: 8),
        Text(label, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
      ],
    );
  }

  Widget _featuredServiceCard({
    required String title,
    required String image,
    required VoidCallback onPressed,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 140,
        margin: EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            Expanded(
              child: Image.asset(image, fit: BoxFit.cover),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
