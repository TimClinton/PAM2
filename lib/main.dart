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
        title: const Text('Find Your Doctor', style: TextStyle(color: Colors.black)),
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
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.green[100],
                ),
                child: Row(
                  children: <Widget>[
                    // Adjusted to prevent overflow
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                    // Adjusted image size to fit the container
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: const DecorationImage(
                          image: NetworkImage('https://images.unsplash.com/photo-1600585154340-be6161a56a0c'),
                          fit: BoxFit.cover,
                        ),
                      ),
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

              // Grid for Categories
              GridView.count(
                shrinkWrap: true, // Important to avoid overflow error
                physics: const NeverScrollableScrollPhysics(), // Prevents internal scroll
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
                height: 250, // Increased height to accommodate image and text
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
                      imageUrl: 'https://www.bestmasterofscienceinnursing.com/wp-content/uploads/2015/03/Kaiser-foundation-hospital-modern-hospitals.jpg',
                    ),
                    MedicalCenterCard(
                      name: 'Golden Cardiology Clinic',
                      address: '555 Bridge Street, USA',
                      rating: 4.9,
                      reviews: 108,
                      distance: '2.2 km',
                      time: '30 min',
                      imageUrl: 'https://www.bestmasterofscienceinnursing.com/wp-content/uploads/2015/03/mediclinic-city-hospital-modern-hospitals.jpg',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Top Doctors section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Top Doctors',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('See All'),
                ],
              ),
              const SizedBox(height: 16),

              // List of Doctors
              Column(
                children: const [
                  DoctorListItem(
                    imageUrl: 'https://images.unsplash.com/photo-1527613426441-4da17471b66d',
                    name: 'Dr. Emily Johnson',
                    specialty: 'Cardiologist',
                    location: 'Sunrise Health Clinic',
                    rating: 4.9,
                    reviews: 120,
                  ),
                  DoctorListItem(
                    imageUrl: 'https://images.unsplash.com/photo-1537368910025-700350fe46c7',
                    name: 'Dr. Michael Smith',
                    specialty: 'Neurologist',
                    location: 'Golden Cardiology Clinic',
                    rating: 4.8,
                    reviews: 95,
                  ),
                ],
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
          padding: const EdgeInsets.all(12), // Adjusted padding
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
  final String imageUrl;

  const MedicalCenterCard({
    super.key,
    required this.name,
    required this.address,
    required this.rating,
    required this.reviews,
    required this.distance,
    required this.time,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250, // Ensured consistent width
      child: Card(
        margin: const EdgeInsets.all(8),
        child: Padding(
          padding: const EdgeInsets.all(12), // Adjusted padding
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Image with rounded corners
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  imageUrl,
                  height: 120,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
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
      ),
    );
  }
}

// Doctor list item
class DoctorListItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String specialty;
  final String location;
  final double rating;
  final int reviews;

  const DoctorListItem({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.specialty,
    required this.location,
    required this.rating,
    required this.reviews,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          // Doctor's image with rounded corners
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              imageUrl,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          // Expanded to prevent overflow
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  overflow: TextOverflow.ellipsis, // Handle overflow
                ),
                Text(
                  specialty,
                  style: const TextStyle(color: Colors.grey),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  location,
                  style: const TextStyle(color: Colors.grey),
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  children: [
                    const Icon(Icons.star, size: 16, color: Colors.orange),
                    const SizedBox(width: 4),
                    Text(
                      '$rating ($reviews reviews)',
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
