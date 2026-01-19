import 'package:flutter/material.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    // البيانات منظمة حسب الفئات كما في الصورة
    final categories = [
      {
        "title": "PROGRAMMING LANGUAGES",
        "icon": Icons.code,
        "skills": ["Dart", "Java", "Kotlin"],
      },
      {
        "title": "MOBILE DEVELOPMENT",
        "icon": Icons.on_device_training,
        "skills": ["Flutter", "Firebase", "REST APIs"],
      },
      {
        "title": "TOOLS & TECHNOLOGIES",
        "icon": Icons.settings_suggest,
        "skills": ["Git", "Android Studio", "VS Code"],
      },
      {
        "title": "OTHER SKILLS",
        "icon": Icons.lightbulb_outline,
        "skills": ["UI/UX Principles", "State Management", "Database Design"],
      },
    ];

    return Container(
      padding: const EdgeInsets.all(40),
      // color: const Color(0xFFFFFBF2), // لون خلفية كريمي فاتح مثل الصورة
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Technical Skills",
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w500,
              fontFamily: 'Serif', // أو الخط المستخدم في تصميمك
              // color: Color(0HeaderColor), // استبدله باللون البني في الصورة
            ),
          ),
          const SizedBox(height: 30),
          // استخدام LayoutBuilder لجعل التصميم متجاوب (Responsive)
          LayoutBuilder(builder: (context, constraints) {
            int crossAxisCount = constraints.maxWidth > 800 ? 2 : 1;
            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: 1.8, // تحكم في ارتفاع الكارت من هنا
              ),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return SkillCard(
                  title: categories[index]['title'] as String,
                  icon: categories[index]['icon'] as IconData,
                  skills: categories[index]['skills'] as List<String>,
                );
              },
            );
          }),
        ],
      ),
    );
  }
}

class SkillCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final List<String> skills;

  const SkillCard({
    super.key,
    required this.title,
    required this.icon,
    required this.skills,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // color: Colors.white,
        border: Border.all(color: const Color(0xFFFFE0B2), width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // الخط الفاصل العلوي الصغير في الصورة
          Container(
              height: 40,
              decoration: const BoxDecoration(
                  border: Border(
                      bottom:
                          BorderSide(color: Color(0xFFFFE0B2), width: 0.5)))),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // العنوان الفرعي مع الأيقونة
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFEBD8),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(icon, size: 14, color: Colors.brown),
                      const SizedBox(width: 5),
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF8D6E63),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                // قائمة المهارات
                ...skills.map((skill) => Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Row(
                        children: [
                          const Text("• ", style: TextStyle(fontSize: 18)),
                          Text(
                            skill,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
