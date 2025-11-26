import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true, // Set to false in production
      builder: (context) => MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true, // Required for DevicePreview
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      home: DoctorHomePage(),
    );
  }
}

class DoctorHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // Use MediaQuery for screen size
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(screenWidth * 0.04), // Responsive padding
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // Header Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello,",
                        style: TextStyle(
                          fontSize: screenWidth * 0.04,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey[700],
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.005),
                      Text(
                        "Hi James",
                        style: TextStyle(
                          fontSize: screenWidth * 0.06,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  CircleAvatar(
                    radius: screenWidth * 0.06, // 6% of screen width
                    backgroundColor: Colors.blue,
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                      size: screenWidth * 0.06,
                    ),
                  ),
                ],
              ),

              SizedBox(height: screenHeight * 0.025),

              // Doctor Info Card
              Container(
                padding: EdgeInsets.all(screenWidth * 0.04),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(screenWidth * 0.04),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: screenWidth * 0.08,
                      backgroundImage: AssetImage("assets/images/doc2.png"),
                    ),
                    SizedBox(width: screenWidth * 0.03),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Dr. Saksham Khadka",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: screenWidth * 0.045,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.005),
                          Text(
                            "General Doctor",
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.9),
                              fontSize: screenWidth * 0.035,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.015),
                          Row(
                            children: [
                              Icon(Icons.calendar_today,
                                  size: screenWidth * 0.035, color: Colors.white),
                              SizedBox(width: screenWidth * 0.03),
                              Text(
                                "Sunday, 12 June",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenWidth * 0.035,
                                ),
                              ),
                              SizedBox(width: screenWidth * 0.03),
                              Icon(Icons.access_time,
                                  size: screenWidth * 0.035, color: Colors.white),
                              SizedBox(width: screenWidth * 0.01),
                              Text(
                                "11:00 - 12:00AM",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenWidth * 0.024,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: screenWidth * 0.045,
                    )
                  ],
                ),
              ),

              SizedBox(height: screenHeight * 0.025),

              // Search TextField
              TextField(
                decoration: InputDecoration(
                  
                  hintText: "Search doctor or Health Issue",
                  prefixIcon: Icon(Icons.search),
                  contentPadding: EdgeInsets.symmetric(vertical: screenHeight*0.025,
                  horizontal: screenWidth *0.04,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(screenWidth * 0.03),
                    
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                ),
              ),

              SizedBox(height: screenHeight * 0.025),

              // Category Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CategoryItem(icon: Icons.coronavirus, label: "Covid 19", screenWidth: screenWidth),
                  CategoryItem(icon: Icons.person, label: "Doctor", screenWidth: screenWidth),
                  CategoryItem(icon: Icons.medical_services, label: "Medicines", screenWidth: screenWidth),
                  CategoryItem(icon: Icons.local_hospital, label: "Hospital", screenWidth: screenWidth),
                ],
              ),

              SizedBox(height: screenHeight * 0.03),

              Text(
                "Near Doctor",
                style: TextStyle(
                  fontSize: screenWidth * 0.05,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),

              SizedBox(height: screenHeight * 0.035),

              DoctorCard(
                image: "assets/images/doc1.png",
                name: "Dr. Sandhya Khadka",
                speciality: "Gaino",
                rating: "4.8 (120 Reviews)",
                time: "Open at 17.00",
                distance: "1.2km",
                screenWidth: screenWidth,
              ),

              SizedBox(height: screenHeight * 0.02),

              DoctorCard(
                image: "assets/images/doc2.png",
                name: "Dr. Agrima Khadka",
                speciality: "Eyes",
                rating: "4.6 (115 reviews)",
                time: "Open at 12 PM",
                distance: "3 KM",
                screenWidth: screenWidth,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final double screenWidth;

  const CategoryItem({
    super.key,
    required this.icon,
    required this.label,
    required this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: screenWidth * 0.08, color: Colors.blue),
        SizedBox(height: screenWidth * 0.02),
        Text(
          label,
          style: TextStyle(
            fontSize: screenWidth * 0.035,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class DoctorCard extends StatelessWidget {
  final String image;
  final String name;
  final String speciality;
  final String rating;
  final String time;
  final String distance;
  final double screenWidth;

  const DoctorCard({
    super.key,
    required this.image,
    required this.name,
    required this.speciality,
    required this.rating,
    required this.time,
    required this.distance,
    required this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(screenWidth * 0.015),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(screenWidth * 0.03),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: screenWidth * 0.075,
            backgroundImage: AssetImage(image),
          ),
          SizedBox(width: screenWidth * 0.03),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: screenWidth * 0.045,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: screenWidth * 0.01),
                Text(distance, style: TextStyle(fontSize: screenWidth * 0.035)),
                SizedBox(height: screenWidth * 0.01),
                Text(
                  speciality,
                  style: TextStyle(
                    fontSize: screenWidth * 0.035,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: screenWidth * 0.015),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.orange, size: screenWidth * 0.035),
                    SizedBox(width: screenWidth * 0.01),
                    Text(
                      rating,
                      style: TextStyle(
                        fontSize: screenWidth * 0.035,
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.03),
                    Icon(Icons.access_time, color: Colors.blueAccent, size: screenWidth * 0.035),
                    SizedBox(width: screenWidth * 0.01),
                    Text(
                      time,
                      style: TextStyle(
                        fontSize: screenWidth * 0.035,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Icon(Icons.location_on, size: screenWidth * 0.035),
        ],
      ),
    );
  }
}
