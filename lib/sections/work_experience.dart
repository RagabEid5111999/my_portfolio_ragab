import 'package:flutter/material.dart';

class WorkExperienceSection extends StatelessWidget {
  const WorkExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),
      // color: const Color(0xFFFFFBF2), // نفس الخلفية الكريمية
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Work Experience",
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w500,
              fontFamily: 'Serif',
              // color: Color(0xFF4E342E),
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "My professional journey is marked by a dedication to crafting robust and intuitive mobile experiences.",
            style: TextStyle(fontSize: 16, fontFamily: 'Serif'),
          ),
          const SizedBox(height: 50),

          // منطقة الخط الزمني
          Stack(
            children: [
              // الخط الرأسي في المنتصف
              Positioned(
                left: MediaQuery.of(context).size.width / 2 - 41, // توسيط الخط
                top: 0,
                bottom: 0,
                child: Container(
                  width: 2,
                  color: const Color(0xFFFFCC80),
                ),
              ),
              Column(
                children: [
                  // الخبرة الأولى (على اليسار)
                  _buildTimelineItem(
                    context,
                    isLeft: true,
                    title: "Software Engineer & Flutter Developer",
                    company: "at TechInnovate Solutions",
                    date: "June 2022 – Present",
                    points: [
                      "Led end-to-end development of high-performance Flutter applications.",
                      "Implemented efficient state management using BLoC and Provider.",
                      "Collaborated with cross-functional teams to define requirements.",
                      "Achieved a 20% reduction in app load times."
                    ],
                  ),
                  const SizedBox(height: 40),
                  // الخبرة الثانية (على اليمين)
                  _buildTimelineItem(
                    context,
                    isLeft: false,
                    title: "Junior Flutter Developer",
                    company: "at MobileCraft Studios",
                    date: "January 2021 – May 2022",
                    points: [
                      "Contributed to development and maintenance of key mobile features.",
                      "Assisted in bug identification, debugging, and resolution.",
                      "Gained hands-on experience with Firebase services.",
                      "Participated in daily stand-ups and agile sprint cycles."
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTimelineItem(
    BuildContext context, {
    required bool isLeft,
    required String title,
    required String company,
    required String date,
    required List<String> points,
  }) {
    return Row(
      mainAxisAlignment:
          isLeft ? MainAxisAlignment.start : MainAxisAlignment.end,
      children: [
        if (!isLeft)
          SizedBox(width: MediaQuery.of(context).size.width / 2 - 40),

        // الكارت الخاص بالخبرة
        Container(
          width: MediaQuery.of(context).size.width / 2 - 100,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            // color: Colors.white,
            border: Border.all(color: const Color(0xFFFFE0B2)),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  )),
              Text(company,
                  style:
                      const TextStyle(fontSize: 16, color: Color(0xFF8D6E63))),
              Align(
                alignment: Alignment.centerRight,
                child: Text(date,
                    style: const TextStyle(fontSize: 12, color: Colors.grey)),
              ),
              const SizedBox(height: 10),
              ...points.map((p) => Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("• ",
                            style: TextStyle(color: Color(0xFFFFB74D))),
                        Expanded(
                            child: Text(p,
                                style: const TextStyle(
                                    fontSize: 13, height: 1.4))),
                      ],
                    ),
                  )),
            ],
          ),
        ),

        // النقطة البرتقالية على الخط
        if (isLeft) ...[
          const SizedBox(width: 25),
          Container(
            width: 12,
            height: 12,
            decoration: const BoxDecoration(
                color: Color(0xFFFFB74D), shape: BoxShape.circle),
          ),
        ] else ...[
          // للنصف الأيمن يتم ترتيب العناصر عكسياً
        ]
      ],
    );
  }
}
