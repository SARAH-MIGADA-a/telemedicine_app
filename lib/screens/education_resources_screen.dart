import 'package:flutter/material.dart';

class EducationResourcesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(
          'Education Resources',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Implement search functionality
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Header
            Text(
              'Learn About Health & Wellness',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Explore articles, videos, and infographics to stay informed and take charge of your health.',
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
            SizedBox(height: 16),

            // Section for Resources
            Expanded(
              child: ListView(
                children: [
                  _resourceCard(
                    title: 'The Basics of a Healthy Diet',
                    description: 'Learn about essential nutrients and meal planning for optimal health.',
                    icon: Icons.restaurant_menu,
                    onTap: () {
                      // Navigate to article or video
                    },
                  ),
                  _resourceCard(
                    title: 'Understanding Mental Health',
                    description:
                    'Discover tips to maintain mental wellness and reduce stress in daily life.',
                    icon: Icons.psychology,
                    onTap: () {
                      // Navigate to article or video
                    },
                  ),
                  _resourceCard(
                    title: 'Exercise and Fitness Tips',
                    description:
                    'Watch videos and read guides on effective workout routines for all fitness levels.',
                    icon: Icons.fitness_center,
                    onTap: () {
                      // Navigate to article or video
                    },
                  ),
                  _resourceCard(
                    title: 'Preventative Healthcare',
                    description:
                    'Find out how regular checkups and vaccines can keep you healthy.',
                    icon: Icons.medical_services,
                    onTap: () {
                      // Navigate to article or video
                    },
                  ),
                  _resourceCard(
                    title: 'Sleep Hygiene and Benefits',
                    description: 'Understand how quality sleep contributes to overall health.',
                    icon: Icons.bedtime,
                    onTap: () {
                      // Navigate to article or video
                    },
                  ),
                ],
              ),
            ),

            // Action Button - Explore All Resources
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:  Colors.teal,
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  // Navigate to a detailed resource page or section
                  _showAllResources(context);
                },
                child: Text(
                  'Explore All Resources',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _resourceCard({
    required String title,
    required String description,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.teal.withOpacity(0.1),
                child: Icon(icon, color: Colors.teal, size: 30),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    SizedBox(height: 4),
                    Text(
                      description,
                      style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                    ),
                  ],
                ),
              ),
              Icon(Icons.arrow_forward_ios, color: Colors.teal, size: 20),
            ],
          ),
        ),
      ),
    );
  }

  // Method to simulate navigating to a page with all resources
  void _showAllResources(BuildContext context) {
    // Example of navigating to a different page
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Explore More Resources'),
          content: Text(
              'This will navigate you to a page where all the resources are listed with more details.'),
          actions: <Widget>[
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
