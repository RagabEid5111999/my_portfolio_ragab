import 'package:flutter/material.dart';

class AchievementsSection extends StatelessWidget {
  const AchievementsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // تحديد عدد الأعمدة بناءً على عرض الشاشة
        double width = constraints.maxWidth;
        int crossAxisCount = width > 900 ? 3 : (width > 600 ? 2 : 1);

        return Container(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          // color: const Color(0xFFFDF9F0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Achievements & Recognition',
                style: TextStyle(
                  fontSize: 32,
                  fontFamily: 'Serif',
                  // color: Color(0xFF5D4037),
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 60),
              // استخدام Wrap لجعل البطاقات تنزل لسطر جديد إذا ضاق المكان
              Wrap(
                spacing: 20, // المسافة الأفقية
                runSpacing: 50, // المسافة الرأسية عند الالتفاف
                children: [
                  _buildFlexibleCard(
                    context,
                    crossAxisCount,
                    icon: Icons.rocket_launch_outlined,
                    title: 'High-Impact Project Delivery',
                    description:
                        'Led the development of a flagship Flutter application that achieved a 25% increase in user engagement and 15% faster transaction processing for a key client.',
                  ),
                  _buildFlexibleCard(
                    context,
                    crossAxisCount,
                    icon: Icons.emoji_events_outlined,
                    title: 'Client & Industry Recognition',
                    description:
                        'Consistently received top client satisfaction scores for robust and scalable solutions, recognized for technical excellence and timely project delivery.',
                  ),
                  _buildFlexibleCard(
                    context,
                    crossAxisCount,
                    icon: Icons.door_sliding_outlined,
                    title: 'Open Source & Technical Contributions',
                    description:
                        'Actively contributed to several open-source Flutter packages and authored technical articles on advanced Flutter techniques, sharing knowledge with the developer community.',
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  // دالة لحساب عرض البطاقة بناءً على عدد الأعمدة المتاحة
  Widget _buildFlexibleCard(BuildContext context, int columns,
      {required IconData icon,
      required String title,
      required String description}) {
    return LayoutBuilder(builder: (context, constraints) {
      // طرح المسافات (Spacing) من العرض الكلي وتقسيمه على عدد الأعمدة
      double cardWidth = (constraints.maxWidth - (columns - 1) * 20) / columns;

      return SizedBox(
        width: cardWidth > 300 ? cardWidth : double.infinity,
        child: AchievementCard(
          icon: icon,
          title: title,
          description: description,
        ),
      );
    });
  }
}

class AchievementCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const AchievementCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        Container(
          constraints: const BoxConstraints(minHeight: 220),
          padding: const EdgeInsets.fromLTRB(20, 45, 20, 25),
          decoration: BoxDecoration(
            // color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: const Color(0xFFFFCCBC),
              width: 1.2,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontFamily: 'Serif',
                  // color: Color(0xFF5D4037),
                  fontWeight: FontWeight.bold,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 14,
                  // color: Color(0xFF795548),
                  height: 1.6,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: -25,
          child: Container(
            height: 50,
            width: 50,
            decoration: const BoxDecoration(
                color: Color(0xFFF28B50),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  )
                ]),
            child: Icon(icon, color: Colors.white, size: 24),
          ),
        ),
      ],
    );
  }
}
