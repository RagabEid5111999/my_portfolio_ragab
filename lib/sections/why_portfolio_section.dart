import 'package:flutter/material.dart';

class WhyPortfolioSection extends StatelessWidget {
  const WhyPortfolioSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 80),
      // color: const Color(0xffFFF8EE), // الخلفية الكريمي
      width: double.infinity,
      child: Column(
        children: [
          // ===== Title =====
          const Text(
            "Why My Portfolio Matters",
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.w600,
              // color: Color(0xff4A1F12),
              fontFamily: 'Serif',
            ),
          ),
          const SizedBox(height: 60),

          // ===== Cards =====
          LayoutBuilder(
            builder: (context, constraints) {
              bool isMobile = constraints.maxWidth < 900;

              return Wrap(
                spacing: 30,
                runSpacing: 30,
                alignment: WrapAlignment.center,
                children: [
                  _buildCard(
                    icon: Icons.code,
                    title: "Demonstrating Technical Skills",
                    text:
                        "My portfolio showcases my ability to build functional Flutter applications, solve real-world problems, and write clean, maintainable code.",
                    isMobile: isMobile,
                  ),
                  _buildCard(
                    icon: Icons.psychology,
                    title: "Problem-Solving Approach",
                    text:
                        "I focus on understanding user needs and implementing efficient solutions. Each project reflects my technical decision-making and development methodology.",
                    isMobile: isMobile,
                  ),
                  _buildCard(
                    icon: Icons.trending_up,
                    title: "Continuous Learning",
                    text:
                        "Every project represents my growth as a developer, from mastering Flutter fundamentals to implementing advanced features and best practices.",
                    isMobile: isMobile,
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  // ===== Card Widget =====
  Widget _buildCard({
    required IconData icon,
    required String title,
    required String text,
    required bool isMobile,
  }) {
    return Container(
      width: isMobile ? double.infinity : 320,
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        // color: const Color(0xffFFFDF8),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xffFFD6B5), width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ===== Icon Circle =====
          Container(
            padding: const EdgeInsets.all(14),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xffFF9F4A),
            ),
            child: Icon(icon, color: Colors.black, size: 26),
          ),
          const SizedBox(height: 25),

          // ===== Title =====
          Text(
            title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              // color: Color(0xff4A1F12),
            ),
          ),
          const SizedBox(height: 15),

          // ===== Description =====
          Text(
            text,
            style: const TextStyle(
              fontSize: 15,
              height: 1.6,
              // color: Color(0xff6B3A2A),
            ),
          ),
        ],
      ),
    );
  }
}
