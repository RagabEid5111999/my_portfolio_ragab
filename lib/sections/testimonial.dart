import 'package:flutter/material.dart';

class TestimonialsSection extends StatelessWidget {
  const TestimonialsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double width = constraints.maxWidth;
        // تحديد عدد الأعمدة: 3 للويب، 2 للتابلت، 1 للموبايل
        int crossAxisCount = width > 1000 ? 3 : (width > 700 ? 2 : 1);

        return Container(
          padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 30),
          // color: const Color(0xFFFDF9F0), // نفس الخلفية الكريمية
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'What Others Say',
                style: TextStyle(
                  fontSize: 40,
                  fontFamily: 'Serif',
                  // color: Color(0xFF5D4037),
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 40),
              Wrap(
                spacing: 25,
                runSpacing: 40,
                children: [
                  _buildResponsiveCard(
                    context,
                    crossAxisCount,
                    name: 'Sarah Chen',
                    position: 'Product Manager,',
                    company: 'TechInnovate Solutions',
                    quote:
                        'Ragab is an exceptional Flutter developer. His leadership in developing our flagship app was instrumental, directly contributing to a 25% boost in user engagement and 15% faster transaction processing. His dedication to both technical excellence and project success is outstanding.',
                  ),
                  _buildResponsiveCard(
                    context,
                    crossAxisCount,
                    name: 'David Lee',
                    position: 'CTO,',
                    company: 'MobileCraft Studios',
                    quote:
                        '"During his time at MobileCraft, Ragab quickly became our go-to for complex Flutter challenges. His keen eye for detail and commitment to clean code ensured robust and scalable solutions, significantly improving our application stability and reducing bug resolution times."',
                  ),
                  _buildResponsiveCard(
                    context,
                    crossAxisCount,
                    name: 'Emily White',
                    position: 'Marketing Director,',
                    company: 'EcoSolutions Inc.',
                    quote:
                        '"Ragab transformed our vision for EcoWaste Connect into a beautiful and highly functional app. His ability to translate design concepts into seamless user experiences, combined with his collaborative approach, resulted in highly positive user feedback on UI/UX and a successful pilot launch."',
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildResponsiveCard(BuildContext context, int columns,
      {required String name,
      required String position,
      required String company,
      required String quote}) {
    return LayoutBuilder(builder: (context, constraints) {
      // حساب العرض ديناميكياً مع مراعاة المسافات
      double cardWidth = (constraints.maxWidth - (columns - 1) * 25) / columns;

      return SizedBox(
        width: cardWidth > 320 ? cardWidth : double.infinity,
        child: TestimonialCard(
          name: name,
          position: position,
          company: company,
          quote: quote,
        ),
      );
    });
  }
}

class TestimonialCard extends StatelessWidget {
  final String name;
  final String position;
  final String company;
  final String quote;

  const TestimonialCard({
    super.key,
    required this.name,
    required this.position,
    required this.company,
    required this.quote,
  });

  @override
  Widget build(BuildContext context) {
    const Color accentColor = Color(0xFFF28B50); // اللون البرتقالي

    return Stack(
      children: [
        // الحاوية الأساسية (البطاقة)
        Container(
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 35),
          decoration: BoxDecoration(
            // color: Colors.white,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: const Color(0xFFFFE0B2), width: 1.5),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 24,
                  fontFamily: 'Serif',
                  // color: Color(0xFF5D4037),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                position,
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
              Text(
                company,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  // color: Color(0xFF424242),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                quote,
                style: const TextStyle(
                  fontSize: 15,
                  // color: Color(0xFF616161),
                  height: 1.6,
                ),
              ),
            ],
          ),
        ),
        // علامة الاقتباس العلوية (يسار)
        Positioned(
          top: 0,
          left: 0,
          child: Container(
            // color:
            // const Color(0xFFFDF9F0), // نفس لون الخلفية لإخفاء الإطار تحته
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: const Text('“',
                style:
                    TextStyle(fontSize: 60, color: accentColor, height: 0.8)),
          ),
        ),
        // علامة الاقتباس السفلية (يمين)
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            // color: const Color(0xFFFDF9F0),
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: const Text('”',
                style:
                    TextStyle(fontSize: 60, color: accentColor, height: 0.8)),
          ),
        ),
      ],
    );
  }
}
