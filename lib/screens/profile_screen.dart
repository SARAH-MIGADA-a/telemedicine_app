import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Replace with actual user data
  String userName = 'Sarah Migada';
  String userEmail = 'sarahmigada@gmail.com';
  String userPhone = '+254717465606';
  String userLocation = 'Nairobi, Kenya';
  String memberSince = 'January 2023';

  // Edit Profile function (Navigate to Edit Profile Screen)
  void _editProfile() {
    Navigator.pushNamed(context, '/editProfile');
  }

  // Logout function (Clear authentication and navigate to login)
  void _logout() {
    // Implement your logout logic here, e.g. clearing user data or tokens
    Navigator.pushNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(
          'Profile',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Navigate to settings screen
              Navigator.pushNamed(context, '/settings');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // Profile Picture
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/profile_picture.png'), // Replace with actual image asset or network image
            ),
            SizedBox(height: 16),

            // Name and Email
            Text(
              userName, // Dynamic user name
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              userEmail, // Dynamic user email
              style: TextStyle(fontSize: 18, color: Colors.grey[700]),
            ),
            SizedBox(height: 16),

            // Section Divider
            Divider(height: 2, thickness: 1, color: Colors.grey[300]),

            // Personal Information Section
            _profileInfoRow(Icons.phone, 'Phone Number', userPhone), // Dynamic data
            _profileInfoRow(Icons.location_on, 'Location', userLocation), // Dynamic data
            _profileInfoRow(Icons.calendar_today, 'Member Since', memberSince), // Dynamic data
            SizedBox(height: 16),

            // Section Divider
            Divider(height: 2, thickness: 1, color: Colors.grey[300]),
            SizedBox(height: 16),

            // Edit and Logout Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: _editProfile, // Edit Profile action
                  icon: Icon(Icons.edit, size: 20),
                  label: Text(
                    'Edit Profile',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                SizedBox(width: 16),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: _logout, // Logout action
                  icon: Icon(Icons.logout, size: 20),
                  label: Text(
                    'Logout',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),

            // Activity Section
            Text(
              'Your Activity',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            _activityCard(
              icon: Icons.check_circle,
              title: 'Completed Consultations',
              value: '12',
            ),
            _activityCard(
              icon: Icons.article,
              title: 'Articles Read',
              value: '24',
            ),
            _activityCard(
              icon: Icons.video_library,
              title: 'Videos Watched',
              value: '18',
            ),
          ],
        ),
      ),
    );
  }

  Widget _profileInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.teal, size: 24),
          SizedBox(width: 16),
          Text(
            '$label:',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Spacer(),
          Text(
            value,
            style: TextStyle(fontSize: 16, color: Colors.grey[700]),
          ),
        ],
      ),
    );
  }

  Widget _activityCard({required IconData icon, required String title, required String value}) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.teal.withOpacity(0.1),
          child: Icon(icon, color: Colors.teal, size: 30),
        ),
        title: Text(
          title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        trailing: Text(
          value,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
