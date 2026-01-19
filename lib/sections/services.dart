import 'package:flutter/material.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    // قائمة الخدمات بناءً على الصورة المرفقة
    final List<Map<String, dynamic>> services = [
      {
        "title": "Custom Flutter App Development",
        "description":
            "From concept to deployment, building bespoke cross-platform mobile applications tailored to specific business needs.",
        "icon": Icons.app_registration, // أيقونة مشابهة للصورة
      },
      {
        "title": "Mobile App UI/UX Design & Implementation",
        "description":
            "Crafting intuitive user interfaces and seamless user experiences, ensuring engaging and accessible applications.",
        "icon": Icons.person_outline,
      },
      {
        "title": "App Maintenance & Bug Fixes",
        "description":
            "Providing ongoing support, identifying and resolving issues, and ensuring smooth operation of existing Flutter applications.",
        "icon": Icons.build_circle_outlined,
      },
      {
        "title": "Performance Optimization",
        "description":
            "Enhancing app speed, responsiveness, and efficiency through code refactoring, asset optimization, and profiling.",
        "icon": Icons.speed,
      },
      {
        "title": "Firebase Integration & Backend Services",
        "description":
            "Leveraging Firebase for scalable backend solutions, including authentication, databases, cloud functions, and analytics.",
        "icon": Icons.cloud_queue,
      },
    ];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
      // color: const Color(0xFFFFFBF2), // لون الخلفية الكريمي
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Services I Offer",
            style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.bold,
              fontFamily: 'Serif',
              // color: Color(0xFF4E342E), // اللون البني الغامق للعنوان
            ),
          ),
          const SizedBox(height: 40),
          // استخدام Wrap لجعل الكروت مرنة وتنتقل للسطر التالي تلقائياً
          Wrap(
            spacing: 25, // المسافة الأفقية بين الكروت
            runSpacing: 25, // المسافة الرأسية بين الكروت
            children:
                services.map((service) => _buildServiceCard(service)).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildServiceCard(Map<String, dynamic> service) {
    return Container(
      width: 350, // عرض الكارت
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        // color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
            color: const Color(0xFFFFE0B2), width: 1), // إطار برتقالي فاتح
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // الأيقونة الدائرية البرتقالية كما في الصورة
          Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: Color(0xFFFFB74D), // لون برتقالي مشرق للأيقونة
              shape: BoxShape.circle,
            ),
            child: Icon(
              service['icon'],
              color: Colors.white,
              size: 28,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            service['title'],
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              // color: Color(0xFF5D4037),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            service['description'],
            style: const TextStyle(
              fontSize: 15,
              // color: Colors.black54,
              height: 1.5, // تباعد الأسطر لراحة العين
            ),
          ),
        ],
      ),
    );
  }
}
