import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For date/time formatting and picking

class VideoConsultScreen extends StatefulWidget {
  @override
  _VideoConsultScreenState createState() => _VideoConsultScreenState();
}

class _VideoConsultScreenState extends State<VideoConsultScreen> {
  // Variables for selected date and time
  DateTime? _selectedDateTime;

  // Function to open the date picker
  void _selectDateTime(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDateTime)
      setState(() {
        _selectedDateTime = picked;
      });
  }

  // Function to show the doctor details and video call options
  void _showDoctorDetails(BuildContext context, String name, String specialty) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(name),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Specialty: $specialty'),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Add your video call logic here
                  Navigator.pop(context);
                  // Video call logic (e.g., navigate to video call screen)
                },
                child: Text('Start Video Call'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Close the popup
                },
                child: Text('Close'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text(
          'Video Consultation',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.help_outline),
            onPressed: () {
              // Show help or FAQ about video consultations
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Header
              Text(
                'Connect with a Specialist',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Schedule a video consultation with licensed healthcare professionals from the comfort of your home.',
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),
              SizedBox(height: 20),

              // Doctor List Section
              Text(
                'Available Doctors',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 12),
              _doctorCard(
                name: 'Dr. James Kinyua',
                specialty: 'Cardiologist',
                image: 'assets/images/doctor1.png',
                onPressed: () {
                  _showDoctorDetails(context, 'Dr. James Kinyua', 'The best Cardiologist around with skills and experience of 15 years');
                },
              ),
              SizedBox(height: 16),
              _doctorCard(
                name: 'Dr. Stella Mwangi',
                specialty: 'Dermatologist',
                image: 'assets/images/doctor2.png',
                onPressed: () {
                  _showDoctorDetails(context, 'Dr. Stella Mwangi', 'The greatest Dermatologist around with 10 years of experience ');
                },
              ),
              SizedBox(height: 16),
              _doctorCard(
                name: 'Dr. Ahmed Ali',
                specialty: 'Psychiatrist',
                image: 'assets/images/doctor3.png',
                onPressed: () {
                  _showDoctorDetails(context, 'Dr. Ahmed Ali', 'The famous and most skilled Psychiatrist with 20 years of experience');
                },
              ),

              SizedBox(height: 20),

              // Schedule Appointment Section
              Text(
                'Schedule an Appointment',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 12),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  _selectDateTime(context); // Open the date picker
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.schedule, color: Colors.white),
                    SizedBox(width: 8),
                    Text(
                      'Schedule Now',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),

              if (_selectedDateTime != null) ...[
                SizedBox(height: 20),
                Text(
                  'Selected Date and Time: ${DateFormat('yyyy-MM-dd – hh:mm a').format(_selectedDateTime!)}',
                  style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                ),
              ],

              SizedBox(height: 20),

              // FAQs Section
              Text(
                'FAQs About Video Consultations',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 12),
              _faqItem(
                question: 'What do I need for a video consultation?',
                answer:
                'You need a stable internet connection, a device with a camera and microphone, and a quiet space for the consultation.',
              ),
              _faqItem(
                question: 'How long does a consultation take?',
                answer:
                'Consultations typically last between 15 and 30 minutes, depending on the complexity of your health concerns.',
              ),
              _faqItem(
                question: 'Are my consultations private?',
                answer:
                'Yes, all consultations are encrypted and adhere to strict confidentiality standards.',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _doctorCard({
    required String name,
    required String specialty,
    required String image,
    required VoidCallback onPressed,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(16),
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
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(image), // Replace with actual image
            ),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                ),
                SizedBox(height: 4),
                Text(
                  specialty,
                  style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                ),
              ],
            ),
            Spacer(),
            Icon(Icons.arrow_forward_ios, color: Colors.blue[900], size: 20),
          ],
        ),
      ),
    );
  }

  Widget _faqItem({required String question, required String answer}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          question,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        SizedBox(height: 4),
        Text(
          answer,
          style: TextStyle(fontSize: 14, color: Colors.grey[700]),
        ),
        SizedBox(height: 16),
      ],
    );
  }
}
