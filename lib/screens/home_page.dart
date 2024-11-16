import 'package:flutter/material.dart';
import 'dart:async'; // Import for Timer

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> images = [
    'assets/images/hospital1.jpg',
    'assets/images/hospital2.jpg',
    'assets/images/hospital3.jpg',
  ];

  final PageController _pageController = PageController();
  int _currentPage = 0;
  late Timer _timer; // Timer to control auto-scrolling

  @override
  void initState() {
    super.initState();
    // Start the timer to automatically change pages every 3 seconds
    _timer = Timer.periodic(Duration(seconds: 3), _autoScroll);
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer when the widget is disposed
    _pageController.dispose();
    super.dispose();
  }

  // Function to automatically scroll to the next page
  void _autoScroll(Timer timer) {
    if (_currentPage < images.length - 1) {
      _currentPage++;
    } else {
      _currentPage = 0; // Reset to the first page after the last one
    }
    _pageController.animateToPage(
      _currentPage,
      duration: Duration(seconds: 1), // Duration of the animation
      curve: Curves.easeInOut, // Animation curve
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image Carousel with Auto-Scroll
          PageView.builder(
            controller: _pageController,
            itemCount: images.length,
            itemBuilder: (context, index) {
              return AnimatedBuilder(
                animation: _pageController,
                builder: (context, child) {
                  double value = 1.0;

                  // Calculate scale and opacity for the animation effect
                  if (_pageController.position.haveDimensions) {
                    value = _pageController.page! - index;
                    value = (1 - (value.abs() * 0.3)).clamp(0.0, 1.0);
                  }

                  return Transform.scale(
                    scale: value, // Scaling effect
                    child: Opacity(
                      opacity: value, // Fade effect
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(images[index]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
            scrollDirection: Axis.horizontal, // Horizontal scroll direction
          ),
          // Content Overlay
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Colors.black.withOpacity(0.5), // Semi-transparent overlay
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Welcome to Telemedicine App',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Your health journey starts here. Consult, learn, and stay connected.',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login'); // Navigate to login
                    },
                    child: Text('Get Started'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      padding:
                      EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
