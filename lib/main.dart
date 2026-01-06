import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nomad Journal',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF121212), // Soft Charcoal
        primaryColor: const Color(0xFFFF6B35), // Sunset Orange
        brightness: Brightness.dark,
        textTheme: TextTheme(
          displayLarge: GoogleFonts.playfairDisplay(
              fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
          displayMedium: GoogleFonts.playfairDisplay(
              fontSize: 24, fontWeight: FontWeight.w600, color: Colors.white),
          bodyLarge: GoogleFonts.lato(fontSize: 16, color: Colors.white70),
          bodyMedium: GoogleFonts.lato(fontSize: 14, color: Colors.grey[400]),
        ),
      ),
      home: const NomadHome(),
    );
  }
}

// =======================================================
// SCREEN 1: HOME (Trip Gallery)
// =======================================================
class NomadHome extends StatelessWidget {
  const NomadHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("My Journeys",
                      style: Theme.of(context).textTheme.displayLarge),
                  const CircleAvatar(
                    radius: 22,
                    backgroundImage: NetworkImage(
                        'https://i.pravatar.cc/150?img=47'), // Profile
                  ),
                ],
              ),
              const SizedBox(height: 30),
              
              // Interactive Map Preview
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFF1E1E1E),
                  borderRadius: BorderRadius.circular(24),
                  image: const DecorationImage(
                    image: NetworkImage(
                        "https://img.freepik.com/free-vector/dark-grey-world-map_1053-153.jpg"), 
                    fit: BoxFit.cover,
                    opacity: 0.4,
                  ),
                ),
                child: Stack(
                  children: [
                    const Positioned(
                      top: 80, left: 150,
                      child: MapPin(label: "Bali"),
                    ),
                    const Positioned(
                      top: 60, left: 280,
                      child: MapPin(label: "Tokyo"),
                    ),
                     Positioned(
                      bottom: 15, right: 15,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFF6B35),
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: const Text("View World Map", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),
              Text("Recent Trips",
                  style: Theme.of(context).textTheme.displayMedium),
              const SizedBox(height: 15),

              // Trip List
              Expanded(
                child: ListView(
                  children: [
                    TripCard(
                      title: "Kyoto & Tokyo",
                      date: "Oct 2025 • 12 Days",
                      image: "https://images.unsplash.com/photo-1493976040374-85c8e12f0c0e?auto=format&fit=crop&w=800&q=80",
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const TripDetailScreen())),
                    ),
                    const TripCard(
                      title: "Iceland Roadtrip",
                      date: "Aug 2025 • 7 Days",
                      image: "https://images.unsplash.com/photo-1476610182048-b716b8518aae?auto=format&fit=crop&w=800&q=80",
                    ),
                    const TripCard(
                      title: "Swiss Alps",
                      date: "Dec 2024 • 5 Days",
                      image: "https://images.unsplash.com/photo-1502791451862-7bd8c1df43a7?auto=format&fit=crop&w=800&q=80",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFFFF6B35),
        child: const Icon(Iconsax.add, color: Colors.white),
      ),
    );
  }
}

// =======================================================
// SCREEN 2: TRIP DETAIL
// =======================================================
class TripDetailScreen extends StatelessWidget {
  const TripDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // 1. Parallax App Bar
          SliverAppBar(
            expandedHeight: 400,
            pinned: true,
            backgroundColor: const Color(0xFF121212),
            leading: IconButton(
              icon: const ContainerIcon(icon: Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            ),
            actions: [
               IconButton(
                icon: const ContainerIcon(icon: Iconsax.more),
                onPressed: () {},
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                "https://images.unsplash.com/photo-1528360983277-13d9b152c611?auto=format&fit=crop&w=800&q=80",
                fit: BoxFit.cover,
              ),
              title: const Text(""), 
            ),
          ),

          // 2. Content Body
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Kyoto & Tokyo", style: GoogleFonts.playfairDisplay(fontSize: 36, color: Colors.white, fontWeight: FontWeight.bold)),
                          Text("Japan • Oct 12 - Oct 24", style: GoogleFonts.lato(color: Colors.orangeAccent, fontSize: 16)),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(color: Colors.white10, borderRadius: BorderRadius.circular(12)),
                        child: const Text("🇯🇵", style: TextStyle(fontSize: 24)),
                      )
                    ],
                  ),
                  
                  const SizedBox(height: 30),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      TripStat(label: "Distance", value: "240km"),
                      TripStat(label: "Spent", value: "\$1,240"),
                      TripStat(label: "Photos", value: "842"),
                    ],
                  ),

                  const SizedBox(height: 40),
                  
                  Text("Day 1 - Arrival in Kyoto", style: GoogleFonts.playfairDisplay(fontSize: 22, color: Colors.white)),
                  const SizedBox(height: 15),
                  Text(
                    "Landed in Kansai Airport and took the Haruka Express directly to Kyoto. The mixture of old temples and modern vending machines is surreal.",
                    style: GoogleFonts.lato(fontSize: 16, color: Colors.grey[400], height: 1.5),
                  ),
                  
                  const SizedBox(height: 20),

                  // "Video" Integration
                  Container(
                    height: 250,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(
                        image: NetworkImage("https://images.unsplash.com/photo-1492571350019-22de08371fd3?auto=format&fit=crop&w=800&q=80"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.black26)),
                        Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            // FIXED: Using withValues(alpha: ...)
                            color: Colors.white.withValues(alpha: 0.2), 
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2)
                          ),
                          child: const Icon(Icons.play_arrow, color: Colors.white, size: 30),
                        ),
                        const Positioned(
                          bottom: 15, left: 15,
                          child: Icon(Iconsax.video, color: Colors.white70, size: 20),
                        )
                      ],
                    ),
                  ),

                  const SizedBox(height: 40),

                  Text("Day 2 - Fushimi Inari", style: GoogleFonts.playfairDisplay(fontSize: 22, color: Colors.white)),
                  const SizedBox(height: 15),
                  Text(
                    "Woke up at 5 AM to beat the crowds. The orange torii gates seem to go on forever up the mountain.",
                    style: GoogleFonts.lato(fontSize: 16, color: Colors.grey[400], height: 1.5),
                  ),
                  
                  const SizedBox(height: 80), 
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// =======================================================
// REUSABLE WIDGETS
// =======================================================

class TripCard extends StatelessWidget {
  final String title, date, image;
  final VoidCallback? onTap;

  const TripCard({super.key, required this.title, required this.date, required this.image, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 25),
        height: 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          image: DecorationImage(image: NetworkImage(image), fit: BoxFit.cover),
          // FIXED: Using withValues(alpha: ...)
          boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.3), blurRadius: 15, offset: const Offset(0, 10))], 
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            gradient: LinearGradient(
              begin: Alignment.topCenter, end: Alignment.bottomCenter,
              // FIXED: Using withValues(alpha: ...)
              colors: [Colors.transparent, Colors.black.withValues(alpha: 0.8)], 
            ),
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: GoogleFonts.playfairDisplay(fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold)),
              const SizedBox(height: 5),
              Row(
                children: [
                  const Icon(Iconsax.calendar_1, color: Colors.orangeAccent, size: 16),
                  const SizedBox(width: 6),
                  Text(date, style: const TextStyle(color: Colors.white70)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MapPin extends StatelessWidget {
  final String label;
  const MapPin({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
          child: Text(label, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 10)),
        ),
        const SizedBox(height: 4),
        const Icon(Icons.location_on, color: Color(0xFFFF6B35), size: 30),
      ],
    );
  }
}

class TripStat extends StatelessWidget {
  final String label, value;
  const TripStat({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(value, style: GoogleFonts.lato(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
        Text(label, style: GoogleFonts.lato(fontSize: 12, color: Colors.grey[500])),
      ],
    );
  }
}

class ContainerIcon extends StatelessWidget {
  final IconData icon;
  const ContainerIcon({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        color: Colors.black45,
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: Colors.white, size: 20),
    );
  }
}