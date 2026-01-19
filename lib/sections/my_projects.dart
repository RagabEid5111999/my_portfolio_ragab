import 'package:flutter/material.dart';

class MyProjectsSection extends StatelessWidget {
  const MyProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "My Projects",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),
          LayoutBuilder(
            builder: (context, constraints) {
              final isWideScreen = constraints.maxWidth > 600;
              final cardWidth = isWideScreen ? 200.0 : (constraints.maxWidth - 40) / 2;

              return Wrap(
                spacing: 20, // المسافة بين البطاقات
                runSpacing: 20, // المسافة بين الأسطر
                children: [
                  _buildProjectCard(
                    title: "Focus on Quality",
                    description:
                        "I select projects that best demonstrate my Flutter skills, problem-solving abilities, and understanding of mobile development best practices.",
                    width: cardWidth,
                  ),
                  _buildProjectCard(
                    title: "Real-World Solutions",
                    description:
                        "Each project addresses specific challenges and showcases my ability to implement features that matter, with clear technical implementation.",
                    width: cardWidth,
                  ),
                  _buildProjectCard(
                    title: "Diverse Experience",
                    description:
                        "My projects span different domains and constantly expand my versatility and ability to learn and adapt to new challenges.",
                    width: cardWidth,
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildProjectCard({required String title, required String description, required double width}) {
    return Card(
      elevation: 4,
      child: SizedBox(
        width: width, // عرض البطاقة متغير
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                description,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}