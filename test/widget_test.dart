import 'package:flutter/material.dart';

void main() {
  runApp(const DoctorApp());
}

class DoctorApp extends StatelessWidget {
  const DoctorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DoctorHomePage(),
    );
  }
}

class DoctorHomePage extends StatelessWidget {
  const DoctorHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Find Your Doctor'),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: const [
          Icon(Icons.notifications, color: Colors.black),
          SizedBox(width: 16),
        ],
        leading: const Icon(Icons.location_on, color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Location
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const <Widget>[
                  Text(
                    'Seattle, USA',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(Icons.arrow_drop_down),
                ],
              ),
              const SizedBox(height: 16),

              // Search bar
              const TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search doctor...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Specialist doctor section
              Container(
                height: 150,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.green[100],
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Looking for Specialist Doctors?',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text('Schedule an appointment with our top doctors.'),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    Image.network(
                      'https://example.com/doctor-image.png', // Placeholder image link
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Categories
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Categories',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('See All'),
                ],
              ),
              const SizedBox(height: 16),
              GridView.count(
                shrinkWrap: true, // Important pentru a evita eroarea de overflow
                crossAxisCount: 4,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: const [
                  CategoryIcon(label: 'Dentistry', icon: Icons.medical_services),
                  CategoryIcon(label: 'Cardiology', icon: Icons.favorite),
                  CategoryIcon(label: 'Pulmonology', icon: Icons.air),
                  CategoryIcon(label: 'General', icon: Icons.person),
                  CategoryIcon(label: 'Neurology', icon: Icons.psychology),
                  CategoryIcon(label: 'Gastro', icon: Icons.local_hospital),
                  CategoryIcon(label: 'Laboratory', icon: Icons.biotech),
                  CategoryIcon(label: 'Vaccination', icon: Icons.vaccines),
                ],
              ),
              const SizedBox(height: 16),

              // Nearby medical centers
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Nearby Medical Centers',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('See All'),
                ],
              ),
              const SizedBox(height: 16),

              // Horizontal ListView for medical centers
              SizedBox(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const <Widget>[
                    MedicalCenterCard(
                      name: 'Sunrise Health Clinic',
                      address: '123 Oak Street, CA 98765',
                      rating: 5.0,
                      reviews: 58,
                      distance: '2.5 km',
                      time: '40 min',
                    ),
                    MedicalCenterCard(
                      name: 'Golden Cardiology Clinic',
                      address: '555 Bridge Street, USA',
                      rating: 4.9,
                      reviews: 108,
                      distance: '2.2 km',
                      time: '30 min',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Icon for category
class CategoryIcon extends StatelessWidget {
  final String label;
  final IconData icon;

  const CategoryIcon({super.key, required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.blueGrey[50],
          ),
          child: Icon(icon, size: 30),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}

// Medical center card
class MedicalCenterCard extends StatelessWidget {
  final String name;
  final String address;
  final double rating;
  final int reviews;
  final String distance;
  final String time;

  const MedicalCenterCard({
    super.key,
    required this.name,
    required this.address,
    required this.rating,
    required this.reviews,
    required this.distance,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: Container(
        width: 250,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.network(
              'https://example.com/clinic-image.png', // Placeholder image link
              height: 100,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 8),
            Text(
              name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              address,
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  '$rating ★ ($reviews Reviews)',
                  style: const TextStyle(fontSize: 12),
                ),
                Text(
                  '$distance / $time',
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
