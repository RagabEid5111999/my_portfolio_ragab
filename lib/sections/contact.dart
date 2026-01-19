import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 30),
      // color: const Color(0xFFFDF9F0), // الخلفية الكريمية المميزة
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Let's Work Together",
            style: TextStyle(
              fontSize: 42,
              fontFamily: 'Serif',
              // color: Color(0xFF5D4037),
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 15),
          const Text(
            "Ready to collaborate? Let's discuss your next project!",
            style: TextStyle(
              fontSize: 18,
              // color: Color(0xFF795548),
            ),
          ),
          const SizedBox(height: 50),
          LayoutBuilder(
            builder: (context, constraints) {
              // تحديد عدد الأعمدة بناءً على العرض المتاح
              int crossAxisCount = constraints.maxWidth > 900
                  ? 3
                  : (constraints.maxWidth > 600 ? 2 : 1);

              return GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: crossAxisCount,
                childAspectRatio: crossAxisCount == 1 ? 3 : 2.5,
                mainAxisSpacing: 30,
                crossAxisSpacing: 20,
                children: const [
                  ContactItem(
                    icon: Icons.email_outlined,
                    label: 'Email',
                    value: 'ragabeid5111999@gmail.com',
                    url: 'mailto:ragabeid5111999@gmail.com',
                  ),
                  ContactItem(
                    icon: Icons.phone_outlined,
                    label: 'Phone',
                    value: '+20 1128792749',
                    url: 'tel:+201128792749',
                  ),
                  ContactItem(
                    icon: Icons.folder_shared_outlined,
                    label: 'GitHub',
                    value: 'RagabEid5111999',
                    url: 'https://github.com/RagabEid5111999',
                  ),
                  ContactItem(
                    icon: Icons.account_tree_outlined,
                    label: 'LinkedIn',
                    value: 'ragabeid',
                    url: 'https://linkedin.com/in/ragabeid',
                  ),
                  ContactItem(
                    icon: Icons.chat_bubble_outline, // أيقونة بديلة للواتساب
                    label: 'WhatsApp',
                    value: 'Chat or Call\n+20 1128792749',
                    url: 'https://wa.me/201128792749',
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class ContactItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final String url;

  const ContactItem({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    const Color orangeColor = Color(0xFFF28B50);

    return InkWell(
      onTap: () async {
        final Uri uri = Uri.parse(url);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri);
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: orangeColor, size: 36),
          const SizedBox(height: 15),
          Text(
            label,
            style: const TextStyle(
              fontSize: 22,
              // color: Color(0xFF5D4037),
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              color: orangeColor,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}
