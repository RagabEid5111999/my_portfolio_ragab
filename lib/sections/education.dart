import 'package:flutter/material.dart';

class EducationSection extends StatelessWidget {
  const EducationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Education & Certifications",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),
          _buildCard(
            context,
            title: "Beni Suef University",
            subtitle: "Bachelor of Computer Science (B.Sc.)",
            description:
                "Comprehensive curriculum focused on software engineering principles, database management, and mobile application development concepts.",
          ),
          const SizedBox(height: 15),
          _buildCard(
            context,
            title: "Advanced Flutter Development Certification",
            subtitle: "",
            description:
                "Successfully completed a specialized program covering advanced Flutter UI/UX, state management, RESTful API integration, and app performance optimization.",
          ),
          const SizedBox(height: 15),
          _buildCard(
            context,
            title: "Ruwad Misr Al-Raqamiya (Digital Pioneers Egypt)",
            subtitle: "",
            description:
                "Completed comprehensive training program in digital mobile app development, gaining practical experience in building scalable applications and understanding market-driven business challenges.",
          ),
          const SizedBox(height: 15),
          _buildCard(
            context,
            title: "NTI (National Telecommunication Institute)",
            subtitle: "",
            description:
                "Participated in specialized training covering mobile development, software engineering best practices, and industry-standard development methodologies.",
          ),
        ],
      ),
    );
  }

  Widget _buildCard(BuildContext context, {required String title, required String description, String? subtitle}) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            if (subtitle != null && subtitle.isNotEmpty)
              Text(
                subtitle,
                style: const TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
              ),
            const SizedBox(height: 8),
            Text(
              description,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}